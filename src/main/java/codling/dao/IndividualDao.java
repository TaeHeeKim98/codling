package codling.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import codling.identity.Apply;
import codling.identity.CoverLetter;
import codling.identity.Individual;

public class IndividualDao {
	final static String DB_URL = "jdbc:mysql://localhost:3306/codling";
	final static String DB_NAME = "codling";
	final static String DB_PASSWORD = "1234";
	
	static Connection conn;
	static PreparedStatement pstmt;
	static ResultSet rs;
	
	protected Connection getConnection() throws Exception {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(DB_URL, DB_NAME, DB_PASSWORD);
			return conn;
	}
	
	// 개인회원 정보
	public Individual getIndividual(String id) {
		Individual individual = null;
		String query = "SELECT * FROM individual WHERE id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String password = rs.getString("password");
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String gender = rs.getString("gender");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				
				individual = new Individual(id, password, name, birth, gender, email, phone, address, "");
				
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getIndividual Error : " + e.getMessage());
		}
		return individual;
	}
	
	// 개인회원 회원가입
	public boolean insertIndividual(Individual individual) {
		boolean result = false;
		String query = "INSERT INTO individual VALUES (?,DEFAULT,?,?,?,?,?,?,?,'')";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, individual.getId());
			pstmt.setString(2, individual.getPassword());
			pstmt.setString(3, individual.getName());
			pstmt.setString(4, individual.getBirth());			
			pstmt.setString(5, individual.getGender());
			pstmt.setString(6, individual.getEmail());
			pstmt.setString(7, individual.getPhone());
			pstmt.setString(8, individual.getAddress());
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("insertIndividual Error : " + e.getMessage());
		}
		return result;
	}
	
	// 개인회원 자기소개서 가져오기
	public List<CoverLetter> getCoverLetter(String individual_id) {
		List<CoverLetter> coverLetterList = new ArrayList<CoverLetter>();
		String query = "SELECT * FROM coverLetter WHERE individual_id = ?";
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, individual_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String content = rs.getString("content");
				
				CoverLetter coverLetter = new CoverLetter(no, individual_id, title, content);
				coverLetterList.add(coverLetter);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			System.out.println("getCoverLetter Error : " + e.getMessage());
		}
		return coverLetterList;
	}
	
	// 자기소개서 작성
	public boolean insertCoverLetter(CoverLetter coverLetter) {
		boolean result = false;
		String query = "INSERT INTO coverLetter "
				+ "VALUES(DEFAULT, ?, ?, ?)";
		
		return result;
	}
	
	// 자기소개서 수정
	public boolean updateCoverLetter(CoverLetter coverLetter) {
		boolean result = false;
		String query = "UPDATE coverLetter "
				+ "SET individual_id = ?, title = ?, content = ? "
				+ "WHERE no = ?";
		
		return result;
	}
	
	// 자기소개서 삭제
	public boolean deleteCoverLetter(CoverLetter coverLetter) {
		boolean result = false;
		String query = "DELETE FROM coverLetter WHERE no = ?";
		
		return result;
	}
	
	// 개인회원 지원하기
	public boolean insertApply(Apply apply) {
		boolean result = false;
		String query = "INSERT INTO apply VALUES(DEFAULT, ?, ?, ?, ?, DEFAULT)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, apply.getIndividual_id());
			pstmt.setInt(2, apply.getJobOpening_no());
			pstmt.setInt(3, apply.getField_no());
			pstmt.setInt(4, apply.getCoverLetter_no());
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("insertApply Error : " + e.getMessage());
		}
		return result;
	}
	
	// 지원한 공고 데이터 가져오기
	public List<Apply> getApply(String individual_id) {
		List<Apply> applys = new ArrayList<Apply>();
		String query = "SELECT A.*, C.corporateName, F.name AS fieldName, F.career, F.pay FROM apply A "
				+ "JOIN corporation C "
				+ "ON C.id = (SELECT corporation_id FROM jobOpening WHERE no = A.jobOpening_no) "
				+ "JOIN field F "
				+ "ON F.no = A.field_no "
				+ "WHERE individual_id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, individual_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				int jobOpening_no = rs.getInt("jobOpening_no");
				int field_no = rs.getInt("field_no");
				int coverLetter_no = rs.getInt("coverLetter_no");
				String status = rs.getString("status");
				String corporateName = rs.getString("corporateName");
				String fieldName = rs.getString("fieldName");
				String career = rs.getString("career");
				String pay = rs.getString("pay");
				
				Apply apply = new Apply(no, individual_id, jobOpening_no, field_no, coverLetter_no, status, corporateName, fieldName, career, pay);
				applys.add(apply);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getApply Error : " + e.getMessage());
		}
		return applys;
	}
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인 회원 정보 수정</title>
    <link rel="stylesheet" href="css/individual_modify.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/footers/">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="js/individual_modify.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <header>
        <a href="index.jsp"><img src="img/logo.png" alt="logoImg" id="logo"></a>
    </header>
    <section>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-10 col-md-7 col-lg-5 col-xl-4">
                        <form class="validation-form" method="post">
                        <div id="individual" class="form-action show container-fluid align-items-center">
                            <div class="row align-items-center mt-4" id="frame">
                                <!-- 아이디 -->
                                <p class="fw-bold">아이디</p>
                                <div class="col" id="chain">
                                    <input type="text" maxlength="20" oninput="maxLengthCheck(this)" onkeyup="inputDataCheck(this.id)" name="id" id="id" class="form-control" required readonly value="codling123">
                                        <div class="invalid-feedback">
                                            아이디를 입력하세요
                                        </div>      
                                </div>
                            </div>
                            <!-- 비밀번호 -->
                            <div class="row align-items-center mt-4 frame" id="hey">
                                <div class="col" >
                                    <p class="fw-bold">비밀번호</p>
                                        <input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호"  onkeyup="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                비밀번호를 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <!-- 비밀번호 확인-->
                            <div class="row align-items-center mt-4" id="">
                                <div class="col">
                                    <p class="fw-bold">비밀번호 재확인</p>
                                        <input type="password" name="confirmPassword" id="cfpw" class="form-control" placeholder="비밀번호 재확인"  onkeyup="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                비밀번호를 다시 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <!-- 이름-->
                            <div class="row align-items-center mt-4 frame" >
                                <div class="col">
                                    <p class="fw-bold">이름</p>
                                        <input type="text" name="name" id = "name" class="form-control" placeholder="이름"  onkeyup="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                이름을 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <!-- 생년월일 -->
                            <div class="row align-items-center mt-4 frame">
                                <p class="fw-bold">생년월일<span class="caution"></span></p>
                                    <div class="col">
                                        <select name="yy" id="year" class="form-select" aria-label="Default select example"></select>
                                            <div class="invalid-feedback">
                                                년을 입력하세요.
                                            </div>
                                    </div>
                                    <div class="col">
                                        <select name="mm" id="month" class="form-select" aria-label="Default select example"></select>
                                            <div class="invalid-feedback">
                                                월을 입력하세요.
                                            </div>
                                    </div>
                                    <div class="col">
                                        <select name="dd" id="day" class="form-select" aria-label="Default select example"></select>
                                            <div class="invalid-feedback">
                                                일을 입력하세요.
                                            </div>
                                    </div>
                            </div>
                            <!-- 성별 -->
                            <div class="row align-items-center mt-4 frame">
                                <div class="col">
                                    <p class="fw-bold">성별 </p>
                                        <select class="form-select" id="gender" >
                                            <option value="">성별</option>
                                            <option value="male">남성</option>
                                            <option value="female">여성</option>
                                        </select>
                                            <div class="invalid-feedback">
                                                성별을 선택하세요.
                                            </div>
                                </div>
                            </div>
                            <!-- 이메일 -->
                            <div class="row align-items-center mt-4 frame" >
                                <div class="col">
                                    <p class="fw-bold">이메일</p>
                                        <input type="email" name="email" id="email" class="form-control" placeholder="name@example.com"  onkeyup="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                이메일을 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <!-- 전화번호 -->
                            <div class="row align-items-center mt-4 frame" >
                                <p class="fw-bold">전화번호</p>
                                    <div class="col-4">
                                        <select class="form-select" id="phoneInd1" name="tel" onkeyup="inputDataCheck(this.id)" required>
                                            <option selected value="010">010</option>
                                            <option value="direct">직접입력</option>
                                            <input type="text" id="selfBoxDirect" name="selfBoxDirect" class="form-control"/>
                                            </select>
                                                <div class="invalid-feedback">
                                                    식별번호를 선택하세요.
                                                </div>
                                    </div>
                                    <div class="col">
                                        <input type="text" class="form-control" id="phoneInd2" placeholder="'-'없이 입력"  onkeyup="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                전화번호를 입력하세요.
                                            </div>
                                    </div>
                            </div>
                            <div class="row align-items-center mt-4" id="frame2">
                                <div class="col">
                                    <p class="fw-bold" id="addressCom">주소</p>
                                    <input type="text" placeholder="우편번호" name="postCode" id="postcode" class="form-control mb-1 " style="display:inline-block;width:100px;"  onkeyup="inputDataCheck(this.id)" required> 
                                    <input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기" id="search"><br>
                                    <input type="text"  name="address" id="address" class="form-control  mb-1" placeholder="주소" onkeyup="inputDataCheck(this.id)" required>
                                    <input type="text" name="detailAddress" id="detailAddress" class="form-control mb-3 col-md-7" placeholder="상세주소"  onkeyup="inputDataCheck(this.id)" required>
                                    <input type="text" name="extraAddress" id="extraAddress" class="form-control mb-3 col-md-7" placeholder="참고항목"  onkeyup="inputDataCheck(this.id)" required>
                                </div>       
                            </div>
                            <div id="modify_btn" >
                                <button type="button" id="#btn1" value="modifyIndividual" onclick="signUpInd_submit()" class="btn-xlarge modifyBtn">수정하기</button>
                            </div> 
                        </div>
                    </form>
                        </div>
                        </div>
            </div>
    </section>    
    <footer>
        <a href="#up"><img src="img/footerLogo.png"></a>
        <a href="#">전체서비스</a>&ensp;|&ensp; 
        <a href="#">이용약관</a>&ensp;|&ensp; 
        <a href="#">개인정보처리방침</a>&ensp;|&ensp;
        <a href="#">제휴문의</a>&ensp;| 
        © CODLING Corp.
    </footer>
</body>
</html>
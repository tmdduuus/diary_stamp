<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <style>
        body {
            background:#f5f5f5;
            font-family:"Raleway";
        }
        .form {
            position:absolute;
            top:30%;
            left:50%;
            transform:translate(-50%,-50%);
            width:300px;
            height:250px;
            padding:10px;
            margin-bottom: 50%;
        }
        .form .form-header {
            height:30px;
            display:flex;
            align-items:center;
            text-align:center;
        }
        .form .form-header > div {
            width:calc(100% / 2);
            color:#2c2c2c;
            font-size:18px;
            font-weight:600;
            cursor:pointer;
        }
        .form.signup .form-header div.show-signup {
            color:#f1575b;
        }
        .form.signin .form-header div.show-signin {
            color:#f1575b;
        }
        .form.reset .form-header div.show-reset {
            color:#f1575b;
        }
        .form .form-elements {
            margin-top:15px;
        }
        .form .form-elements .form-element {
            height:50px;
            opacity:1;
            overflow:hidden;
            transition:all 500ms ease-in-out;
        }
        .form .form-elements input {
            width:100%;
            padding:10px;
            font-size:16px;
            margin:5px 0px;
            border-radius:10px;
            box-sizing:border-box;
            border:1px solid #222;
            background:#f5f5f5;
        }
        .form .form-elements button {
            width:100%;
            padding:10px;
            font-size:16px;
            font-weight:600;
            margin-top:5px;
            border-radius:10px;
            background:#f1575b;
            color:#f5f5f5;
            cursor:pointer;
            border:none;
            outline:none;
        }
        .form .arrow {
            position:absolute;
            top:51px;
            width:0;
            height:0;
            border-left:10px solid transparent;
            border-right:10px solid transparent;
            border-bottom:10px solid #f5f5f5;
        }
        .form.signup .arrow {
            left:calc(calc(100% / 3) / 2);
        }
        .form.signin .arrow {
            left:calc(calc(100% / 3) + calc(calc(100% / 3) / 2.2)) ;
        }
        .form.reset .arrow {
            left:calc(calc(calc(100% / 3) * 2) + calc(calc(100% / 3) / 3)) ;
        }

        .form.signin .form-elements > div:nth-child(3) {
            height:0px;
            opacity:0;
        }
        .form.reset .form-elements > div:nth-child(2),
        .form.reset .form-elements > div:nth-child(3) {
            height:0px;
            opacity:0;
        }

        img {
            width: 100%;
            margin-bottom: 50px;
        }

        .margin-bottom {
            margin-bottom: 15px; /* 원하는 간격 크기로 설정 */
            text-align: center; /* 가운데 정렬 */
        }

        /* ID 중복 확인 버튼 스타일 */
        #checkId {
            background-color: #ff847c; /* 버튼 배경색 */
            color: white; /* 버튼 텍스트 색상 */
            border: none; /* 테두리 제거 */
            border-radius: 10px; /* 모서리를 둥글게 */
            /*padding: auto; !* 내부 여백 *!*/
            margin-top: 5px; /* 상단 여백 */
            cursor: pointer; /* 마우스 커서를 손가락 모양으로 */
            margin-left: 5px;
            width: 25%;
            font-size:16px;
            font-weight:300;
            text-align: center; /* 가운데 정렬 */
        }

        /* 가입하기 버튼 스타일 */
        #join {
            background-color: #f1575b; /* 버튼 배경색 */
            color: white; /* 버튼 텍스트 색상 */
            border: none; /* 테두리 제거 */
            border-radius: 10px; /* 모서리를 둥글게 */
            padding: 10px 0px; /* 내부 여백 */
            margin-top: 10px; /* 상단 여백 */
            cursor: pointer; /* 마우스 커서를 손가락 모양으로 */
            width: 100%; /* 부모 요소의 전체 너비 */
            box-sizing: border-box; /* 박스 사이즈 계산 방식 */
            margin-bottom: 30px;
            font-size:16px;
            font-weight:600;
        }

        .id-input-container {
            display: flex; /* Flexbox를 사용하여 내용을 나란히 배치 */
            justify-content: space-between; /* 요소들 사이에 공간을 균등하게 배분 */
            align-items: center; /* 버튼과 입력란을 중앙에 정렬 */
            /*margin-bottom: 15px; !* 아래쪽 여백 추가 *!*/
        }

        .password-container{
            margin-top: 15px;
        }


    </style>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function() {
            // Sign Up 클릭 이벤트
            $(".show-signup").click(function() {
                $(".form").removeClass("signin").addClass("signup");
                $(".signin-form").hide();
                $(".signup-form").show();
            });

            // Sign In 클릭 이벤트
            $(".show-signin").click(function() {
                $(".form").removeClass("signup").addClass("signin");
                $(".signup-form").hide();
                $(".signin-form").show();
            });
        });

        function resetClass(element, classname){
            element.classList.remove(classname);
        }

        window.onload = function() {
            // 기존 로그인 오류 메시지 처리
            <% if (Boolean.TRUE.equals(request.getAttribute("loginError"))) { %>
            alert('아이디나 비밀번호가 올바르지 않습니다.');
            <% } %>
            <% if (Boolean.TRUE.equals(request.getAttribute("signupSuccess"))) { %>
            alert('회원가입이 성공적으로 완료되었습니다.');
            <% } %>

            // 새로운 탭 기능 추가
            document.getElementsByClassName("show-signup")[0].addEventListener("click", function(){
                let form = document.getElementsByClassName("form")[0];
                resetClass(form, "signin");
                resetClass(form, "reset");
                form.classList.add("signup");
                document.getElementById("submit-btn").innerText = "Sign Up";
            });
            document.getElementsByClassName("show-signin")[0].addEventListener("click", function(){
                let form = document.getElementsByClassName("form")[0];
                resetClass(form, "signup");
                resetClass(form, "reset");
                form.classList.add("signin");
                document.getElementById("submit-btn").innerText = "Sign In";
            });
            // document.getElementsByClassName("show-reset")[0].addEventListener("click", function(){
            //     let form = document.getElementsByClassName("form")[0];
            //     resetClass(form, "signup");
            //     resetClass(form, "signin");
            //     form.classList.add("reset");
            //     document.getElementById("submit-btn").innerText = "Reset password";
            // });
        };

    //
        var isIdChecked = false;
        function validateForm() {
            var password = document.getElementById("userPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if (password != confirmPassword) {
                alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                return false;
            }
            if (!isIdChecked) {
                alert("아이디 중복 확인을 해주세요.");
                return false; // 폼 제출 중지
            }
            return true;
        }

        $(function(){
            $("#checkId").click(function(){

                let userId = $("#userId").val();

                $.ajax({
                    type:'post', //post 형식으로 controller 에 보내기위함!!
                    url:"/checkId", // 컨트롤러로 가는 mapping 입력
                    data: {"userId":userId}, // 원하는 값을 중복확인하기위해서  JSON 형태로 DATA 전송
                    success: function(data){
                        if(data == "N"){ // 만약 성공할시
                            result = "사용 가능한 아이디입니다.";
                            $("#result_checkId").html(result).css("color", "green");
                            $("#userPassword").trigger("focus");
                            isIdChecked = true;
                        }else{ // 만약 실패할시
                            result="이미 사용중인 아이디입니다.";
                            $("#result_checkId").html(result).css("color","red");
                            $("#userId").val("").trigger("focus");
                            isIdChecked = false;
                        }

                    },
                    error : function(error){alert(error);}
                });

            });

        });
    </script>
</head>
<body>
    <div class="form signin">
        <div class="ex-container">
            <!-- 로고 이미지 추가 -->
            <img src="logo.png" alt="Logo" class="logo-image">
        </div>
        <div class="form-header">
            <div class="show-signup">Sign Up</div>
            <div class="show-signin">Sign In</div>
<%--            <div class="show-reset">Reset</div>--%>
        </div>
<%--        <div class="arrow"></div>--%>
        <div class="form-elements">
            <div class="signin-form">
            <form action="login" method="post">
                <div class="form-element">
                    <input type="text" placeholder="ID" name="userId" required>
                </div>
                <div class="form-element margin-bottom">
                    <input type="password" placeholder="Password" name="userPassword" required>
                </div>
                <div class="form-element">
                    <button class="signin-btn" type="submit">LOGIN</button>
                </div>
            </form>
            </div>
            <div class="signup-form" style="display:none;">
                <div class="signup-form" style="display:none;">
                    <form action="join" method="post" onsubmit="return validateForm()">
<%--                        <div class="margin-bottom id-input-container">--%>
<%--                            <input type="text" id="userId" placeholder="ID" name="userId" required>--%>
<%--                            <div><span id="result_checkId" style="font-size:12px;"></span></div>--%>
<%--                            <input type="button" id="checkId" value="Check"><br/>--%>
<%--                        </div>--%>
                        <div class="form-element id-input-container">
                            <input type="text" id="userId" placeholder="ID" name="userId" required>
                            <input type="button" id="checkId" value="Check">
                        </div>
                        <!-- 중복 확인 결과 메시지를 표시하는 컨테이너 -->
                        <div id="idCheckResult" class="id-check-result">
                            <span id="result_checkId" style="font-size:12px;"></span>
                        </div>
                        <div class="password-container">
                            <input type="password" id="userPassword" placeholder="Password" name="userPassword" required>
                        </div>
                        <div class="margin-bottom">
                            <input type="password" id="confirmPassword" placeholder="Confirm Password" name="confirmPassword" required>
                        </div>
                        <div class="margin-bottom">
                            <input type="text" id="userName" placeholder="Name" name="userName" required>
                        </div>
                        <div class="margin-bottom">
                            <input type="email" id="userEmail" placeholder="Email" name="userEmail" required>
                        </div>
                        <div class="margin-bottom">
                            <input type="submit" id="join" value="JOIN">
                        </div>
                        <c:if test="${not empty errorMessage}">
                            <div style="color: red;">${errorMessage}</div>
                        </c:if>
                    </form>
                </div>

            </div>
    </div>
</body>
</html>

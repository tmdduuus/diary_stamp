<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <style>
        body {
            background:#2c2c2c;
            font-family:"Raleway";
        }
        .form {
            position:absolute;
            top:50%;
            left:50%;
            transform:translate(-50%,-50%);
            width:300px;
            height:250px;
            padding:10px;
        }
        .form .form-header {
            height:30px;
            display:flex;
            align-items:center;
            text-align:center;
        }
        .form .form-header > div {
            width:calc(100% / 3);
            color:#ddd;
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

    </style>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
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
            document.getElementsByClassName("show-reset")[0].addEventListener("click", function(){
                let form = document.getElementsByClassName("form")[0];
                resetClass(form, "signup");
                resetClass(form, "signin");
                form.classList.add("reset");
                document.getElementById("submit-btn").innerText = "Reset password";
            });
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
        <div class="form-header">
            <div class="show-signup">Sign Up</div>
            <div class="show-signin">Sign In</div>
            <div class="show-reset">Reset</div>
        </div>
        <div class="arrow"></div>
        <div class="form-elements">
            <form action="login" method="post">
                <div class="form-element">
                    <input type="text" placeholder="ID" name="userId" required>
                </div>
                <div class="form-element">
                    <input type="password" placeholder="Password" name="userPassword" required>
                </div>
                <div class="form-element">
                    <button class="signin-btn" type="submit">로그인</button>
                </div>
            </form>
            <form action="join" method="post" onsubmit="return validateForm()">
                <!-- Sign Up 폼 -->
                <div>
<%--                    <label for="userId">아이디:</label>--%>
                    <input type="text" id="userId" placeholder="ID" name="userId" required>
                    <input type="button" id="checkId" value="ID 중복 확인"><br/>
                    <div><span id="result_checkId" style="font-size:12px;"></span></div>
                </div>
                <div>
<%--                    <label for="userPassword">비밀번호:</label>--%>
                    <input type="password" id="userPassword" placeholder="Password" name="userPassword" required>
                </div>
                <div>
<%--                    <label for="confirmPassword">비밀번호 확인:</label>--%>
                    <input type="password" id="confirmPassword" placeholder="Confirm Password" name="confirmPassword" required>
                </div>
                <div>
<%--                    <label for="userName">이름:</label>--%>
                    <input type="text" id="userName" placeholder="Name" name="userName" required>
                </div>
                <div>
<%--                    <label for="userEmail">이메일:</label>--%>
                    <input type="email" id="userEmail" placeholder="Email" name="userEmail" required>
                </div>
                <div>
                    <input type="submit" value="가입하기">
                </div>
                <c:if test="${not empty errorMessage}">
                    <div style="color: red;">${errorMessage}</div>
                </c:if>
            </form>
        </div>
    </div>
</body>
</html>

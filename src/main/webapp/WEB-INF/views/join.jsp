<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
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
<h2>회원가입</h2>
<form action="/join" method="post" onsubmit="return validateForm()">
    <div>
        <label for="userId">아이디:</label>
        <input type="text" id="userId" name="userId" required>
        <input type="button" id="checkId" value="중복 확인"><br/>
        <div><span id="result_checkId" style="font-size:12px;"></span></div>
    </div>
    <div>
        <label for="userPassword">비밀번호:</label>
        <input type="password" id="userPassword" name="userPassword" required>
    </div>
    <div>
        <label for="confirmPassword">비밀번호 확인:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>
    </div>
    <div>
        <label for="userName">이름:</label>
        <input type="text" id="userName" name="userName" required>
    </div>
    <div>
        <label for="userEmail">이메일:</label>
        <input type="email" id="userEmail" name="userEmail" required>
    </div>
    <div>
        <input type="submit" value="가입하기">
    </div>
    <c:if test="${not empty errorMessage}">
        <div style="color: red;">${errorMessage}</div>
    </c:if>
</form>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
<html>
<head>
    <title>My Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            /*background: #f5f5f5;*/
            margin: 0;
            padding: 20px;
        }

        .mypage {
            width: 300px;
            margin: auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #f1575b;
            margin-bottom: 20px;
        }

        .form-group {
            display: flex;
            margin-bottom: 10px;
            align-items: center;
        }

        .form-group label {
            width: 30%;
            font-weight: bold;
            text-align: right;
            padding-right: 10px;
        }

        .form-group .value {
            width: 70%;
            background: #e9e9e9;
            padding: 10px;
            border-radius: 10px;
        }

        .main-content {
            margin-top: 400px; /* header 높이 + 추가 여백 */
        }
    </style>
</head>
<body>
<div class="main-content">
<div class="mypage">
    <h2>My Profile</h2>
    <div class="form-group">
        <label for="userId">ID</label>
        <div class="value" id="userId">${loggedInUser.userId}</div>
    </div>
    <div class="form-group">
        <label for="userName">Name</label>
        <div class="value" id="userName">${loggedInUser.userName}</div>
    </div>
    <div class="form-group">
        <label for="userEmail">Email</label>
        <div class="value" id="userEmail">${loggedInUser.userEmail}</div>
    </div>
</div>
</div>
</body>
</html>

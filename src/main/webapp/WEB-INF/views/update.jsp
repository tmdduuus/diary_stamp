<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
<html>
<head>
    <title>Update Post</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            /*background: #f3f3f3;*/
        }

        .input-group {
            margin-bottom: 15px;
            margin-left: 30px;
            margin-right: 30px;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
        }

        .input-group input[type="text"],
        .input-group input[type="password"],
        .input-group textarea,
        .input-group input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .input-group textarea {
            resize: vertical; /* 사용자가 세로 크기를 조절할 수 있게 합니다. */
        }

        .input-group input[type="button"] {
            background-color: #ff4d4d;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .input-group input[type="button"]:hover {
            background-color: #ff6666;
        }

        .form-content {
            padding-top: 60px; /* header의 높이에 따라 조정 */
            margin-left: 150px;
            margin-right: 200px;
            /*width: 70%; !* 폼의 너비를 70%로 설정합니다. *!*/
            /*max-width: 800px; !* 최대 너비를 800px로 설정합니다. *!*/
        }
    </style>
</head>
<body>
<div class="form-content">
    <form action="/diary/update" method="post" enctype="multipart/form-data" name="updateForm">
        <!-- 숨겨진 필드들 -->
        <input type="hidden" name="id" value="${board.id}">
        <!-- 수정할 수 없는 필드들은 label과 함께 표시 -->
        <div class="input-group">
            <label>Writer</label>
            <input type="text" name="boardWriter" value="${board.boardWriter}" readonly>
        </div>
        <div class="input-group">
            <label>Password</label>
            <input type="password" name="boardPass" id="boardPass" placeholder="비밀번호">
        </div>
        <div class="input-group">
            <label>Title</label>
            <input type="text" name="boardTitle" value="${board.boardTitle}">
        </div>
        <div class="input-group">
            <label>Upload Image</label>
            <input type="file" name="image" placeholder="사진">
        </div>
        <div class="input-group">
            <label>Content</label>
            <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea>
        </div>
        <!-- 수정할 수 없는 필드들은 숨겨진 필드로 처리 -->
        <input type="hidden" name="imagePath" value="${board.imagePath}">
        <input type="hidden" name="imageName" value="${board.imageName}">
        <input type="hidden" name="boardHits" value="${board.boardHits}">
        <input type="hidden" name="boardCreatedTime" value="${board.boardCreatedTime}">
        <div class="input-group">
            <input type="button" value="Update" onclick="updateReqFn()">
        </div>
    </form>
</div>
<script>
    const updateReqFn = () => {
        document.updateForm.submit();

        const passInput = document.getElementById("boardPass").value;
        const passDB = '${board.boardPass}';
        if (passInput == passDB) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!!");
        }
    }
</script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
<html>
<head>
    <title>Save Post</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            /*background: #f3f3f3;*/
            margin: 0;
            padding: 20px;
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

        .input-group input[type="submit"] {
            background-color: #ff4d4d;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .input-group input[type="submit"]:hover {
            background-color: #ff6666;
        }

        .input-group input[type="file"] {
            border: none;
            box-shadow: none;
        }

        .save-input-group {
            margin-bottom: 15px;
            margin-left: 30px;
            margin-right: 30px;
        }
        /* 추가적인 top-margin을 제공하여 header와 본문 내용이 겹치지 않도록 함 */
        .save-form-content {
            padding-top: 60px; /* header의 높이에 따라 조정 */
            margin-left: 150px;
            margin-right: 200px;
        }

        .bottom-group{
            margin-top: 330px;
            display: flex; /* Flexbox 사용 */
            align-items: center; /* 세로 중앙 정렬 */
            margin-bottom: 15px; /* 아래쪽 여백 추가 */
        }
        .bottom-group label {
            margin-right: 10px; /* 레이블과 입력 필드 사이의 오른쪽 여백 */
            white-space: nowrap; /* 레이블이 줄바꿈 되지 않도록 설정 */
        }

        .bottom-group input[type="text"] {
            flex-grow: 1; /* 나머지 공간을 모두 차지하도록 설정 */
            /* 입력 필드 스타일링은 유지 */
        }
    </style>
</head>
<body>
<div class="save-form-content">
<form action="/diary/save" method="post" enctype="multipart/form-data">
    <div class="input-group bottom-group">
        <label for="boardTitle">Title</label>
        <input type="text" id="boardTitle" name="boardTitle" required>
    </div>

    <div class="input-group">
        <label for="image">Upload Image</label>
        <input type="file" id="image" name="image">
    </div>

    <div class="input-group">
        <label for="boardContents">Content</label>
        <textarea id="boardContents" name="boardContents" rows="10" placeholder="내용을 입력하세요" required></textarea>
    </div>

    <div class="input-group">
        <input type="submit" value="Save">
    </div>
</form>
</div>
</body>
</html>

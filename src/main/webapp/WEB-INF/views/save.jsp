<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
            border-radius: 20px;
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
    </style>
</head>
<body>
<form action="/diary/save" method="post" enctype="multipart/form-data">
    <div class="input-group">
        <label for="boardTitle">Title</label>
        <input type="text" id="boardTitle" name="title" required>
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

</body>
</html>

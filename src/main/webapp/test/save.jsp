<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>save</title>
</head>
<body>
    <form action="/diary/save" method="post">
    title, text, category_id, photo
        <input type="text" name="category_id" placeholder="카테고리">
        <input type="text" name="title" placeholder="제목">
        <input type="text" name="photo" placeholder="사진">
        <textarea name="text" cols="30" rows="10" placeholder="내용을 입력하세요"></textarea>
        <input type="submit" value="작성">
    </form>
</body>
</html>
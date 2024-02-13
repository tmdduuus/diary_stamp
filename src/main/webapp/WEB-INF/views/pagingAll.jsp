<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>paging</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            /*background: #f5f5f5;*/
            margin: 0;
            padding: 20px;
        }

        .article-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
            margin-left: 140px;
            margin-right: 230px;
        }

        .article-card {
            width: calc(50% - 40px);
            height: 400px;
            margin: 20px;
            background: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .article-card img {
            width: 100%;
            height: 300px; /* Adjust image height as needed */
            object-fit: cover;
        }

        .article-content {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .article-title {
            font-size: 18px;
            color: #333;
            margin: 0;
        }

        .article-info {
            font-size: 14px;
            color: #666;
            margin-top: 10px;
        }

        .article-card a{
            align-self: flex-end;
            text-decoration: none;
            color: #f1575b;
            font-weight: bold;
        }

        .paging-container {
            text-align: center;
            padding: 20px;
        }

        .paging-container a,
        .paging-container span {
            margin: 0 5px;
            text-decoration: none;
            color: #333;
        }

        /* Adjust link styles for paging */
        .paging-container a {
            background: #f1575b;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .paging-container span.current-page {
            font-weight: bold;
            color: #f1575b;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
<div class="article-container">
    <c:forEach items="${boardList}" var="board">
        <div class="article-card">
            <img src="data:image/jpeg;base64,${board.imagePath}" alt="${board.boardTitle}"/>
            <div class="article-content">
                <h2 class="article-title">${board.boardTitle}</h2>
                <div class="article-info">
                    By ${board.boardWriter} on ${board.boardCreatedTime}
                    <br>
                    Hits: ${board.boardHits}
                </div>
                <a href="/diary?id=${board.id}&page=${paging.page}">Read More</a>
            </div>
        </div>
    </c:forEach>
</div>

<div class="paging-container">
    <!-- Paging links -->
</div>
</body>
</html>

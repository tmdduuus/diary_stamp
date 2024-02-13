<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>paging</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            /*background: #f5f5f5;*/
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
            margin-left: 140px;
            margin-right: 230px;
            margin-top: 330px;
        }

        .card {
            width: calc(50% - 40px); /* 계산된 너비를 유지합니다. */
            height: 400px; /* 고정된 높이를 설정합니다. 이 값은 필요에 따라 조정해주세요. */
            margin: 20px;
            background: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden; /* 내용이 카드 밖으로 넘칠 경우 숨깁니다. */
            display: flex; /* flex 컨테이너로 설정합니다. */
            flex-direction: column; /* 자식 요소들을 세로로 정렬합니다. */
        }

        .card img {
            width: 100%;
            height: 300px; /* 이미지 높이를 고정합니다. 필요에 따라 조정해주세요. */
            object-fit: cover; /* 이미지를 카드의 너비에 맞게 조정합니다. */
        }

        .card-content {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card-title {
            font-size: 18px;
            color: #333;
            margin: 0;
        }

        .card-date {
            font-size: 14px;
            color: #666;
            margin: 0 0 10px 0;
        }

        .card a {
            align-self: flex-end;
            text-decoration: none;
            color: #f1575b;
            font-weight: bold;
        }

        /* 추가적인 페이징 스타일링 */
        .paging-container {
            text-align: center;
            padding: 20px;
        }

        .paging-container a {
            margin: 0 5px;
            text-decoration: none;
            color: #333;
        }

        .paging-container span {
            margin: 0 5px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
<div class="card-container">
    <c:forEach items="${boardList}" var="board">
        <div class="card">
            <img src="data:image/jpeg;base64,${board.imagePath}" alt="${board.boardTitle}"/>
            <div class="card-content">
                <h2 class="card-title">${board.boardTitle}</h2>
                <p class="card-date">${board.boardCreatedTime}</p>
                <a href="/diary?id=${board.id}&page=${paging.page}">READ MORE</a>
            </div>
        </div>
    </c:forEach>
</div>

<div class="paging-container">
    <!-- 페이징 처리 부분은 기존의 로직을 유지하되 스타일을 적용 -->
    <!-- 이전 페이지, 페이지 번호, 다음 페이지 링크 -->
</div>
</body>
</html>

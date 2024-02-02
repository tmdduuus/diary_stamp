<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 보기</title>
</head>
<body>
    <h2>게시글 보기</h2>

    <c:set var="diaryId" value="${param.diaryId}" />
    <c:if test="${not empty postId}">
        <%-- 게시글 ID를 통해 게시글 정보를 가져옴 --%>
        <c:set var="diary" value="${DiaryService.getDiaryById(diaryId)}" />
        <c:if test="${not empty diary}">
            <div>
                <h3>${diary.title}</h3>
                <p>${diary.photo}</p>
                <p>${diary.content}</p>
                <p>${diary.write_date}</p>
            </div>

            <%-- 댓글 목록 가져오기 --%>
            <c:set var="comments" value="${postService.getCommentsByPostId(postId)}" />

            <%-- 댓글 목록이 비어있지 않다면 댓글 표시 --%>
            <c:if test="${not empty comments}">
                <h4>댓글 목록</h4>
                <ul>
                    <c:forEach items="${comments}" var="comment">
                        <li>${comment.content}</li>
                    </c:forEach>
                </ul>
            </c:if>

            <%-- 댓글 작성 폼 추가 --%>
            <form method="post" action="/addComment">
                <input type="hidden" name="postId" value="${postId}" />
                <label for="commentContent">댓글 작성:</label>
                <input type="text" id="commentContent" name="commentContent" required>
                <input type="submit" value="댓글 등록">
            </form>
        </c:if>
    </c:if>

    <c:if test="${empty diary}">
        <p>게시글이 존재하지 않습니다.</p>
    </c:if>

</body>
</html>

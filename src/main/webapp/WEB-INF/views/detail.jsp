<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>detail.jsp</title>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script>
        window.onload = function() {
            <% if (Boolean.TRUE.equals(request.getAttribute("errorMessage"))) { %>
            alert('권한이 없습니다.');
            <% } %>
        };
    </script>
</head>
<body>
    <table>
        <tr>
            <th>writer</th>
            <td>${board.boardWriter}</td>
        </tr>
        <tr>
            <th>date</th>
            <td>${board.boardCreatedTime}</td>
        </tr>
        <tr>
            <th>hits</th>
            <td>${board.boardHits}</td>
        </tr>
        <tr>
            <th>title</th>
            <td>${board.boardTitle}</td>
        </tr>
        <tr>
            <th>photo</th>
            <td>${board.imageName}</td>
            <img src="data:image/jpeg;base64,${getImagePath}" alt="Image"/>
        </tr>
        <tr>
            <th>contents</th>
            <td>${board.boardContents}</td>
        </tr>
    </table>
    <button onclick="listFn()">목록</button>
    <button onclick="updateFn()">수정</button>
    <button onclick="deleteFn()">삭제</button>
<div>
    <input type="hidden" id="id" placeholder="id">
    <input type="hidden" id="commentWriter" placeholder="작성자">
    <input type="text" id="commentContents" placeholder="내용">
    <button id="comment-write-btn" onclick="commentWrite()">댓글작성</button>
</div>

<div id="comment-list">
    <table>
        <tr>
            <th>작성자</th>
            <th>내용</th>
            <th>작성시간</th>
        </tr>
        <c:forEach items="${commentList}" var="comment">
            <tr>
                <td>${comment.commentWriter}</td>
                <td>${comment.commentContents}</td>
                <td>${comment.commentCreatedTime}</td>
                <td>
                    <button id="comment-delete-btn" onclick="deleteComment(${comment.id})">삭제</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    const listFn = () => {
        const page = '${page}';
        location.href = "/diary/mylist";
    }
    const updateFn = () => {
        const id = '${board.id}';
        location.href = "/diary/update?id=" + id;
    }
    const deleteFn = () => {
        const id = '${board.id}';
        location.href = "/diary/delete?id=" + id;
    }

    const commentWrite = () => {
        const writer = document.getElementById("commentWriter").value;
        const contents = document.getElementById("commentContents").value;
        const board = '${board.id}';
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                commentWriter: writer,
                commentContents: contents,
                boardId: board
            },
            dataType: "json",
            success: function(commentList) {
                console.log("작성성공");
                console.log(commentList);
                let output = "<table>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for(let i in commentList){
                    output += "<tr>";
                    output += "<td>"+commentList[i].commentWriter+"</td>";
                    output += "<td>"+commentList[i].commentContents+"</td>";
                    output += "<td>"+commentList[i].commentCreatedTime+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentWriter').value='';
                document.getElementById('commentContents').value='';
            },
            error: function() {
                console.log("실패");
            }
        });
    }
    function deleteComment(commentId) {
        if (confirm('댓글을 삭제하시겠습니까?')) {
            $.ajax({
                type: "GET",
                url: "/comment/delete",
                data: { id: commentId },
                success: function(response) {
                    // 성공적으로 삭제되었을 때 댓글 목록 새로고침 또는 업데이트
                    console.log("댓글 삭제 성공");
                    // 페이지를 새로고침하거나, AJAX를 사용하여 댓글 목록만 업데이트할 수 있습니다.
                    location.reload(); // 페이지 전체를 새로고침
                },
                error: function(xhr) {
                    if(xhr.status === 403) {
                        alert(xhr.responseJSON.msg); // 권한 없음 메시지 출력
                    } else {
                        console.log("댓글 삭제 실패");
                    }
                }
            });
        }
    }
</script>
</html>
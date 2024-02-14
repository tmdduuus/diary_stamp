<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Blog Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha384-9a6us0uaC5V1cZEJz1HkdCOPUnJpV7ckg8gH9pHl0iG5R0P8mpaYwV4jNt9HtpY" crossorigin="anonymous">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            /*background: #f5f5f5;*/
            margin: 0;
            padding: 0;
        }

        .blog-details{
            /*margin-top: 370px;*/
            margin-left: 150px;
            margin-right: 230px;
        }

        .blog-image {
            width: 90%;
            height: auto;
            display: block;
        }

        .blog-content {
            background: #fff;
            padding: 2px;
            /*margin: 10px;*/
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .blog-title-detail {
            color: #333;
            margin-bottom: 10px;
            font-size: 50px;
            font-weight: bold; /* 텍스트를 굵게 */
            margin-left: 30px;
        }

        .blog-info {
            font-size: 14px;
            color: #000000;
            margin-bottom: 35px;
            margin-left: 30px;
        }

        .blog-text {
            font-size: 20px;
            line-height: 1.6;
            color: #444;
            margin-left: 40px;
            margin-bottom: 30px;
        }

        .action-buttons {
            text-align: right;
            margin-top: 30px;
            margin-right: 30px;
            margin-bottom: 50px;
        }

        .action-buttons button {
            padding: 10px 20px;
            margin-left: 10px;
            border: none;
            border-radius: 5px;
            background-color: #f1575b;
            color: white;
            cursor: pointer;
        }

        img{
            margin-bottom: 30px;
            margin-left: 30px;
            margin-right: 50px;
        }

        #comment-list {
            /*max-width: 800px;*/
            /*margin: auto;*/
            margin-left: 40px;
            margin-right: 50px;
            padding: 20px;
            border-radius: 10px;
            /*box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);*/
        }

        .comment-item {
            background: #EFEFEF;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 16px;
            margin-bottom: 10px; /* 댓글 사이의 여백 */
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .comment-author {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .comment-body {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .comment-content {
            margin-bottom: 10px;
        }

        .comment-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .comment-date {
            font-size: 0.8em;
            color: #666;
        }

        .comment-actions {
            margin-left: auto;
        }

        .comment-actions button {
            padding: 5px 10px;
            background-color: #000000;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .comment-actions button:hover {
            background-color: #ff6666;
        }

        #comment-form {
            margin: 20px 0;
            padding: 20px;
            /*background-color: #fff;*/
            /*border-radius: 8px;*/
            /*box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);*/
        }

        .input-group {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-left: 40px;
            margin-right: 50px;
        }

        .input-group .comment-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .input-group .comment-submit-btn {
            padding: 10px 20px;
            background-color: #f1575b;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .input-group .comment-submit-btn:hover {
            background-color: #ff6666;
        }


    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
<div class="blog-details">
    <div class="blog-content">
        <h1 class="blog-title-detail">${board.boardTitle}</h1>
        <div class="blog-info">
            <span>Written by ${board.boardWriter}</span> |
            <span>${board.boardCreatedTime}</span> |
            <span>Views: ${board.boardHits}</span>
        </div>
        <img src="data:image/jpeg;base64,${getImagePath}" alt="Blog Image" class="blog-image"/>
        <div class="blog-text">${board.boardContents}</div>

        <div id="comment-list">
            <div class="comment-author">comment</div>
            <hr>
            <c:forEach items="${commentList}" var="comment">
                <div class="comment-item">
                    <div class="comment-body">
                        <div class="comment-author">${comment.commentWriter}</div>
                        <div class="comment-content">${comment.commentContents}</div>
                        <div class="comment-date">${comment.commentCreatedTime}</div>
                    </div>
                    <div class="comment-actions">
                        <button onclick="deleteComment(${comment.id})">Delete</button>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div id="comment-form">
            <input type="hidden" id="id" placeholder="id">
            <input type="hidden" id="commentWriter" placeholder="작성자">
            <div class="input-group">
                <input type="text" id="commentContents" placeholder="내용을 입력하세요" class="comment-input">
                <button id="comment-write-btn" onclick="commentWrite()" class="comment-submit-btn">Comment</button>
            </div>
        </div>

        <div class="action-buttons">
            <button onclick="listFn()">List</button>
            <button onclick="updateFn()">Edit</button>
            <button onclick="deleteFn()">Delete</button>
        </div>
    </div>
</div>

</div>
<!-- Include your JavaScript and comment functionality -->
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
                let output = "<div class='comment-list'>";
                output += "<div class='comment-author'>comment</div> <hr>";
                for(let i in commentList){
                    output += "<div class='comment-item'>";
                    output += "<div class='comment-body'>";
                    output += "<div class='comment-author'>" + commentList[i].commentWriter + "</div>";
                    output += "<div class='comment-content'>" + commentList[i].commentContents + "</div>";
                    output += "<div class='comment-date'>" + commentList[i].commentCreatedTime + "</div>";
                    output += "</div>"; // .comment-info
                    output += "<div class='comment-actions'>";
                    output += "<button onclick='deleteComment(" + commentList[i].id + ")'>Delete</button>";
                    output += "</div>"; // .comment-delete
                    output += "</div>";
                }
                output += "</div>"; // .comments
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

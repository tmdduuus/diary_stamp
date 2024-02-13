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
        }

        .blog-title {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
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
            margin-top: 20px;
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
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
<div class="blog-details">
    <div class="blog-content">
        <h1 class="blog-title">${board.boardTitle}</h1>
        <div class="blog-info">
            <span>Written by ${board.boardWriter}</span> |
            <span>${board.boardCreatedTime}</span> |
            <span>Views: ${board.boardHits}</span>
        </div>
        <img src="data:image/jpeg;base64,${getImagePath}" alt="Blog Image" class="blog-image"/>
        <div class="blog-text">${board.boardContents}</div>
    </div>
    <div class="action-buttons">
        <button onclick="listFn()">List</button>
        <button onclick="updateFn()">Edit</button>
        <button onclick="deleteFn()">Delete</button>
    </div>
    <!-- Comments section will go here -->
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

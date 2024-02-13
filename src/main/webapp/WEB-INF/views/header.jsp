<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Diary STAMP</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
    }

    .container {
      width: 80%;
      margin: auto; /* 페이지 중앙 정렬 */
    }

    .header {
      width: 100%;
      /*background-color: #f5f5f5; !* 변경하고 싶은 헤더 배경 색상 *!*/
      padding: 20px 0;
      position: fixed;
      /*top: 90px;*/
      width: 100%;
      z-index: 1000;
    }

    .header-content {
      /*width: 80%;*/
      /*margin: 0 auto;*/
      /*display: flex;*/
      /*justify-content: space-between;*/
      /*align-items: center;*/

      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .logo-container {
      display: flex;
      align-items: center;
    }

    .logo-image {
      height: 20px; /* 로고 이미지 높이 설정 */
      margin-left: 20px; /* 로고 이미지와 타이틀 간격 설정 */
    }

    .blog-title {
      font-size: 50px;
      color: #f1575b; /* 버건디 색상 코드 */
      font-weight: bold; /* 텍스트를 굵게 */
      margin-left: 30px;
    }

    .blog-semi-title {
      font-size: 35px;
      margin-top: 5px;
      margin-left: 30px;
    }

    .blog-description {
      margin-top: 8px;
      font-size: 14px;
      color: #666;
      margin-left: 30px;
    }

    .content {
      padding-top: 120px; /* 헤더 높이에 맞춰 조정 */
    }

    .calendar {
      margin-right: 30px;
      width: 50%;
    }

    .menu {
      list-style: none;
      padding: 0;
      margin-left: 180px;
    }

    .menu li {
      display: inline;
      margin-right: 20px;
    }

    .menu li a {
      text-decoration: none;
      font-size: 18px;
      color: #000;
      font-weight: bold;
      padding: 5px 10px;
      border-radius: 20px;
      transition: background-color 0.3s, color 0.3s;
    }

    .menu li a:hover,
    .menu li a.active {
      background-color: #f1575b; /* 버건디 색상 */
      color: white;
    }

    .nav-menu {
      display: flex;
      list-style: none;
      padding: 0;
    }

    .nav-menu li {
      padding: 0 10px; /* 좌우 패딩 설정 */
      font-size: 16px; /* 메뉴 항목 글씨 크기 */
      color: #333;
    }

    .nav-menu li a {
      text-decoration: none;
      color: inherit; /* 부모 요소(여기서는 li)의 글씨 색상 상속 */
    }

    .ex {
        /*margin: 0 auto;*/
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-left: 160px;
        margin-right: 280px;
        margin-bottom: 50px;
    }

    .ex-container {
        display: flex;
        align-items: center;
    }
    /* 캘린더 CSS는 calendar.jsp 내부에서 관리하는 것이 좋습니다. */
  </style>
    <script>
        function confirmLogout() {
            // 사용자에게 로그아웃 의사를 확인
            var logoutConfirm = confirm("정말 로그아웃 하시겠습니까?");
            if (logoutConfirm) {
                // 사용자가 '확인'을 클릭하면 로그아웃 처리
                return true;
            }
            // 사용자가 '취소'를 클릭하면 로그아웃하지 않음
            return false;
        }
    </script>
</head>
<body>
  <div class="header">
    <div class="ex">
      <div class="ex-container">
        <!-- 로고 이미지 추가 -->
        <img src="logo.png" alt="Logo" class="logo-image">
      </div>
      <ul class="nav-menu">
        <li><a href="/">BLOG</a></li>
<%--        <li><a href="/user">USER NAME</a></li>--%>
<%--        <li><a href="/contact">CONTACT</a></li>--%>
      </ul>
    </div>
    <div class="container header-content">
      <div class="logo-container">
        <div>
            <div class="blog-title">Blog Title</div>
            <div class="blog-semi-title">Blog Semi Title</div>
            <div class="blog-description">
                <p>HAPPY 2024 DIARY</p>
            </div>
        </div>
      </div>
        <div class="calendar">
        <%@ include file="calendar.jsp" %>
        </div>
    </div>
    <ul class="menu">
      <li><a href="/diary/mylist">my list</a></li>
      <li><a href="/diary/all">all list</a></li>
      <li><a href="/diary/save">write</a></li>
      <li><a href="/mypage">mypage</a></li>
      <li><a href="/logout" onclick="return confirmLogout();">logout</a></li>
    </ul>
  </div>

<%--<div id="content" style="padding-top: 100px;"> <!-- 헤더 높이에 맞춰 조정 -->--%>
<div class="container content">
  <!-- 본문 내용 -->
</div>
</body>
</html>

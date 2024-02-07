<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script>
        var msg = "${msg}";
        var url = "${url}";
        alert(msg);
        location.href = url;
    </script>
</head>
</html>
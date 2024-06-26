<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 4/29/2024
  Time: 9:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple login form</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
        html, body {
            display: flex;
            justify-content: center;
            font-family: Roboto, Arial, sans-serif;
            font-size: 15px;
        }

        form {
            border: 5px solid #f1f1f1;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 16px 8px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button {
            background-color: #8ebf42;
            color: white;
            padding: 14px 0;
            margin: 10px 0;
            border: none;
            cursor: grabbing;
            width: 100%;
        }

        h1 {
            text-align: center;
            fone-size: 18;
        }

        button:hover {
            opacity: 0.8;
        }

        .formcontainer {
            text-align: left;
            margin: 24px 50px 12px;
        }

        .container {
            padding: 16px 0;
            text-align: left;
        }

        span.psw {
            float: right;
            padding-top: 0;
            padding-right: 15px;
        }

        /* Change styles for span on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }
        }
    </style>
</head>
<body>

<form action="./login" method="post">
    <h1>Đăng nhập</h1>
    <% String error = (request.getAttribute("error") == null) ? "" : (String) request.getAttribute("error");%>
    <p><%= error %></p>
    <label for="username"><strong>Tên đăng nhập</strong></label>
    <input type="text" placeholder="Nhập tên đăng nhập" name="username" id="username" required>
    <label for="psw"><strong>Mật khẩu</strong></label>
    <input type="password" placeholder="Nhập mật khẩu" name="password" id="psw" required>
    <button type="submit" onclick="onSubmitLogin()">Đăng nhập</button>
    <div class="container" style="background-color: #eee">
        <span class="psw"><a href="dangky.jsp"> Bạn đã có tài khoản?</a></span>
    </div>
</form>

<% String success = (request.getAttribute("success") == null) ? "" : request.getAttribute("success").toString();%>
<script>
    function onSubmitLogin() {
        alert(<%=success%>);
    }
</script>

</body>
</html>

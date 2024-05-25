<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 4/29/2024
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple registration form</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <style>
        html, body {
            display: flex;
            justify-content: center;
            height: 100%;
        }
        body, div, h1, form, input, p {
            padding: 0;
            margin: 0;
            outline: none;
            font-family: Roboto, Arial, sans-serif;
            font-size: 16px;
            color: #666;
        }
        h1 {
            padding: 10px 0;
            font-size: 32px;
            font-weight: 300;
            text-align: center;
        }
        p {
            font-size: 12px;
        }
        hr {
            color: #a9a9a9;
            opacity: 0.3;
        }
        .main-block {
            max-width: 340px;
            min-height: 460px;
            padding: 10px 0;
            margin: auto;
            border-radius: 5px;
            border: solid 1px #ccc;
            box-shadow: 1px 2px 5px rgba(0,0,0,.31);
            background: #ebebeb;
        }
        form {
            margin: 0 30px;
        }
        input[type=radio] {
            display: none;
        }
        label#icon1, label#icon2, label#icon3 {
            margin: 0;
            border-radius: 5px 0 0 5px;
        }
        label.radio {
            position: relative;
            display: inline-block;
            padding-top: 4px;
            margin-right: 20px;
            text-indent: 30px;
            overflow: visible;
            cursor: pointer;
        }
        label.radio:before {
            content: "";
            position: absolute;
            top: 2px;
            left: 0;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: #1c87c9;
        }
        label.radio:after {
            content: "";
            position: absolute;
            width: 9px;
            height: 4px;
            top: 8px;
            left: 4px;
            border: 3px solid #fff;
            border-top: none;
            border-right: none;
            transform: rotate(-45deg);
            opacity: 0;
        }
        input[type=radio]:checked + label:after {
            opacity: 1;
        }
        input[type=text], input[type=password] {
            width: calc(100% - 57px);
            height: 36px;
            margin: 13px 0 0 -5px;
            padding-left: 10px;
            border-radius: 0 5px 5px 0;
            border: solid 1px #cbc9c9;
            box-shadow: 1px 2px 5px rgba(0,0,0,.09);
            background: #fff;
        }
        input[type=password] {
            margin-bottom: 15px;
        }
        #icon1, #icon2 , #icon3{
            display: inline-block;
            padding: 9.3px 15px;
            box-shadow: 1px 2px 5px rgba(0,0,0,.09);
            background: #1c87c9;
            color: #fff;
            text-align: center;
        }
        .btn-block {
            margin-top: 10px;
            text-align: center;
        }
        button {
            width: 100%;
            padding: 10px 0;
            margin: 10px auto;
            border-radius: 5px;
            border: none;
            background: #1c87c9;
            font-size: 14px;
            font-weight: 600;
            color: #fff;
        }
        button:hover {
            background: #26a9e0;
        }
    </style>
</head>
<body>
<div class="main-block">
    <h1>Đăng ký</h1>

    <form method="post" action="register">
        <% String error = (request.getAttribute("error") == null) ? "" : (String) request.getAttribute("error"); %>
        <p><%=error%></p>
        <hr>
        <label id="icon1" for="email"><i class="fas fa-envelope"></i></label>
        <input type="text" name="email" id="email" placeholder="Nhập email" required/>
        <label id="icon2" for="username"><i class="fas fa-user"></i></label>
        <input type="text" name="username" id="username" placeholder="Nhập tên đăng nhập" required/>
        <label id="icon3" for="password"><i class="fas fa-unlock-alt"></i></label>
        <input type="password" name="password" id="password" placeholder="Nhập mật khẩu" required/>
        <hr>
        <div class="btn-block">
            <button type="submit" onclick="onSubmitRegister()" >Đăng ký</button>
        </div>
    </form>
</div>

<% String success = (request.getAttribute("success") == null) ? "" : request.getAttribute("success").toString();%>
<script>
    function onSubmitRegister() {
        alert(<%=success%>);
    }
</script>
</body>
</html>

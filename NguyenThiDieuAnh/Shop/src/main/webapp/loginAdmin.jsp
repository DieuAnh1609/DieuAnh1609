<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login Admin</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    body {
      background: #FFD1DC;
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .form-container {
      width: 360px;
      padding: 20px;
      background: #fff;
      border-radius: 15px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
      text-align: center;
    }
    .form-container h2 {
      margin-bottom: 20px;
      font-size: 24px;
      color: #ff69b4;
      font-weight: bold;
    }
    .form-container .form-group {
      margin-bottom: 20px;
    }
    .form-container input {
      border-radius: 25px;
      padding: 10px;
      border: 1px solid #ddd;
      width: 100%;
      box-sizing: border-box;
    }
    .form-container input:focus {
      outline: none;
      border-color: #ff69b4;
      box-shadow: 0 0 5px rgba(255, 105, 180, 0.5);
    }
    .btn-custom {
      background-color: #FFD1DC;
      color: #fff;
      border: none;
      border-radius: 25px;
      padding: 10px 20px;
      font-size: 16px;
      cursor: pointer;
      width: 100%;
    }
    .btn-custom:hover {
      background-color: #ff85c0;
    }
    .message {
      color: red;
      margin-top: 10px;
      font-size: 14px;
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h2>Đăng nhập Admin</h2>
    <form action="loginAdminController" method="post">
      <div class="form-group">
        <input type="text" class="form-control" name="txtun" placeholder="User name" required>
      </div>
      <div class="form-group">
        <input type="password" class="form-control" name="txtpass" placeholder="Password" required>
      </div>
      <% 
      int d = 0;
      if (session.getAttribute("dem") != null) {
        d = (int) session.getAttribute("dem");
      }
      if (d > 3) { 
      %>
        <div class="form-group">
          <img src="simpleCaptcha.jpg" alt="CAPTCHA" style="margin-bottom: 10px;">
          <input type="text" class="form-control" name="answer" placeholder="Nhập mã CAPTCHA" required>
        </div>
      <% } %>
      <button type="submit" class="btn btn-custom" name="but" value="Login">Đăng nhập</button>
    </form>
    <div class="message">
      <% 
      String tb = (String) request.getAttribute("tb");
      if (tb != null) { 
        out.print(tb); 
      } 
      %>
    </div>
  </div>
</body>

</html>

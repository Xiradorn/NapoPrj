<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="widht=device-width, initial-scale=1">
    <title>Login Page</title>
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/custom.css" rel="stylesheet">
</head>
<body>

    <div class="content xir text-center">
        <form class="form-signin" action="user!login.action" method="post" onSubmit="return check()">
            <h2 class="form-signin-heading">Login Form</h2>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" name="loginUser.username" id="username" class="form-control">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="loginUser.username" id="password" class="form-control">
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
            <button type="reset" class="btn btn-default">Reset</button>
        </form>
    </div>
    <div class="container text-center">
        <p class="copyright">Xir Napo <span class="glyphicon glyphicon-copyright-mark"></span> 2015</p>
    </div>

    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/user/login.js"></script>
</body>
</html>

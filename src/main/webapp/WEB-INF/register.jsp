<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
    <script>
        function validateForm() {
           let password = document.getElementById("password").value;
            let confirm_password = document.getElementById("confirm_password").value;

            if (password !== confirm_password) {
                document.getElementById("error-msg").innerText = "Password and confirm password do not match.";
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
<jsp:include page="partials/navbar.jsp" />
<div class="container">
    <h1>Please fill in your information.</h1>
    <form action="${pageContext.request.contextPath}/register" method="post" onsubmit="return validateForm();">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text" value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input id="email" name="email" class="form-control" type="text" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password">
        </div>
        <div class="form-group">
            <label for="confirm_password">Confirm Password</label>
            <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            <small id="error-msg" class="text-danger"></small>
        </div>
        <input type="submit" class="btn btn-primary btn-block">
        <%
            if (request.getParameter("password") != null && request.getParameter("confirm_password") != null && !request.getParameter("password").equals(request.getParameter("confirm_password"))) {
        %>
        <div class="alert alert-danger mt-3">
            Password and confirm password do not match.
        </div>
        <% } %>
    </form>
</div>
</body>
</html>

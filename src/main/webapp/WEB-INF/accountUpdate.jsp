<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Account Update" />
  </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
  <h1>Account Update</h1>

  <form action="${pageContext.request.contextPath}/account-update" method="POST">
    <div class="form-group">
      <label for="username">Username</label>
      <input type="text" class="form-control" id="username" name="username" value="${user.username}" required>
    </div>
    <div class="form-group">
      <label for="email">Email</label>
      <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
    </div>

    <button type="submit" class="btn btn-primary">Update Account</button>
  </form>
</div>

</body>
</html>

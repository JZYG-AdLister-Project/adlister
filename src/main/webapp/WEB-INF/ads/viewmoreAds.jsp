<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ad Details</title>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<%--<h1>Ad Details</h1>--%>
  <h2>${ad.title}</h2>
  <h3 class="fs-4">${ad.category}</h3>
  <h4 class="fs-6">${ad.description}</h4>
  <p class="fs-6">posted by: ${user.username}</p>
</body>
</html>

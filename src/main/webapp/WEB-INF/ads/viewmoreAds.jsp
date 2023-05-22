<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ad Details</title>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<h1>Ad Details</h1>
<table>
    <tr>
        <th>Username</th>
        <th>Title</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>${user.username}</td>
        <td>${ad.title}</td>
        <td>${ad.description}</td>
    </tr>
</table>
</body>
</html>

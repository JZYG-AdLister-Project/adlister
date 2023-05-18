<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>
    <c:if test="${not empty search}">
        <h1>You are searching for <c:out value="${search}"/></h1>
    </c:if>
    <form action="/ads/search" method="POST">
        <input type="text" name="search" placeholder="Search">
        <button type="submit">Search</button>
    </form>
    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <a href="ads/details?id=${ad.id}">View Details</a>
        </div>
    </c:forEach>
</div>
</body>
</html>

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

    <form action="/ads/search" method="POST">
        <label for="category">Search Categories</label>
        <select name="category" id="category">
            <option value="">All Categories</option>
            <option value="furniture">Furniture</option>
            <option value="collectables">Collectables</option>
            <option value="toys">Toys</option>
            <option value="jewelry">Jewelry</option>
            <option value="souvenirs">Souvenirs</option>
            <option value="itemsWanted">Items Wanted</option>
            <option value="services">Services</option>
            <option value="miscellaneous">Miscellaneous</option>
        </select>
        <button type="submit">Search</button>
    </form>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <p>${ad.category}</p>
            <a href="ads/details?id=${ad.id}">View Details</a>
        </div>
    </c:forEach>

</div>
</body>
</html>

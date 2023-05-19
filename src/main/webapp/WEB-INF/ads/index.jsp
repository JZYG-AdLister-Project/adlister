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
    <div class="container text-center">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4 ">
            <c:forEach var="ad" items="${ads}">
            <div class="col">
                <div class="card h-100">
                    <div class="card-body">
                        <h5>${ad.title}</h5>
                        <p class="card-text text-nowrap overflow-hidden text-truncate">${ad.description}</p>
                        <a href="ads/details?id=${ad.id}" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
          </c:forEach>
        </div>
    </div>
</body>
</html>

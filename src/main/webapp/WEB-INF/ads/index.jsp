<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Heirlooms" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">

    <h1>Here are all the Heirlooms!</h1>

    <c:if test="${not empty search}">
        <h1>You are searching for <c:out value="${search}"/></h1>
    </c:if>

    <form action="/ads/search" method="POST" id="search-form">
        <div>
            <label for="category">Filter Categories:</label>
            <select name="category" id="category">
                <option value="">All</option>
                <option value="furniture">Furniture</option>
                <option value="collectables">Collectables</option>
                <option value="toys">Toys</option>
                <option value="jewelry">Jewelry</option>
                <option value="souvenirs">Souvenirs</option>
                <option value="items wanted">Items Wanted</option>
                <option value="services">Services</option>
                <option value="miscellaneous">Miscellaneous</option>
            </select>
        </div>
    </form>

    <script>
        document.getElementById("category").addEventListener("change", function() {
            document.getElementById("search-form").submit();
        });
    </script>

    <div class="container text-center">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4 ">
            <c:forEach var="ad" items="${ads}">
            <div class="col">
                <div class="card h-100 border border-success">
                    <div class="card-body">
                        <h5>${ad.title}</h5>
                        <h6>${ad.category}</h6>
<%--                        <p class="card-text text-nowrap overflow-hidden text-truncate invisible ">${ad.description}</p>--%>
                        <a href="ads/details?id=${ad.id}" class="btn btn-danger">View Details</a>
                    </div>
                </div>
            </div>
          </c:forEach>
        </div>
    </div>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Ads</title>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Search Heirlooms" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="page-wrapper">
    <div class="container">
        <div class="row">
            <div class="column">
                <c:if test="${empty search && empty adsCategory}">
                    <h1>Here are all the Heirlooms!</h1>
                </c:if>
                <c:if test="${not empty search}">
                    <h1>You are searching for "<c:out value="${search}"/>"</h1>
                </c:if>
                <c:if test="${not empty adsCategory}">
                    <h1>You are searching for "<c:out value="${category}"/>"</h1>
                </c:if>

                <form action="/ads/search" method="POST">
                    <label>
                        <input type="text" name="search" placeholder="Search">
                    </label>
                    <button type="submit">Search</button>
                </form>

                <form action="/ads/search" method="POST" id="search-form">
                    <div>
                        <label for="category">Filter Categories:</label>
                        <select name="category" id="category">
                            <option value="" selected>All</option>
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

                <c:if test= "${adsCategory != null}">
                    <c:forEach var="ad" items="${adsCategory}">
                        <div class="col-md-6">
                            <h2>${ad.title}</h2>
                            <p>${ad.description}</p>
                            <p>${ad.category}</p>
                        </div>
                    </c:forEach>
                </c:if>
                
                <%-- search by title --%>
                <c:forEach var="ad" items="${ads}">
                    <div class="col-md-6">
                        <h2>${ad.title}</h2>
                        <p>${ad.description}</p>
                        <p>${ad.category}</p>
                    </div>
                </c:forEach>

<%--                Conditional logic saying nothing matches that search :/--%>
                <c:if test="${empty ads}">
                    <h3>Sorry! There's no Heirloom matches for that... :(</h3>
                </c:if>

                <a href="http://localhost:8080/ads">Go Back</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
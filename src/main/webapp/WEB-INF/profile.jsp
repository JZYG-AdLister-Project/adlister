<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <h2>Here's your profile:</h2>
        <ul>
            <li>Username: <c:out value="${user.getUsername()}"/></li>
            <li>Email: <c:out value="${user.getEmail()}"/></li>
        </ul>
        <h2>Ads you've posted:</h2>
            <div class="container">
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <div class="col ad-cards">
                        <c:forEach var="ad" items="${ads}">
                            <!-- Ad CARD START -->
                        <div class="card h-100">
                            <c:if test="${ad == null}">
                            <div class="card-body">
                                <h3 class="card-title">No ads found</h3>
                            </div>
                            </c:if>
                            <c:if test="${ad != null}">
                            <div class="card-body">
                                <h2 class="card-title">Title: ${ad.title}</h2>
                                <p class="card-text">Description: ${ad.description}</p>
                                <form action="/ads/edit" method="post" class="z-1 position-absolute top-0 right-0">
                                    <label for="editTitle" class="invisible form-label">Edit Title</label>
                                    <input name="title" type="text" placeholder="${ad.title}" id="editTitle" class="invisible edit-title form-control">
                                    <label for="editDescription" class="invisible form-label">Edit Description</label>
                                    <input name="description" type="text" placeholder="${ad.description}" id="editDescription" class="form-control invisible edit-description">
                                    <input type="hidden" name="id" value="${ad.id}">
                                </form>
                                <button type="button" id="edit-btn" class="edit z-3 position-absolute"></button>
                            </div>
                            <div class="card-body invisible z-2 position-relative">
                                <button type="button" class="deleteAd btn btn-primary position-absolute start-0 top-100">Delete</button>
                                <button type="button" class="doneButton btn btn-primary position-absolute end-0 top-100">Done</button>
                            </div>
                            </c:if>
                        </div>
                            <!-- Ad CARD END -->
                        </c:forEach>
                    </div>
                </div>
            </div>
    </div>
<script src="../js/buttons.js"></script>
</body>
</html>
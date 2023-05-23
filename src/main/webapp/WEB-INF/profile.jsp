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
                <div class="row row-cols-4 row-cols-md-2 g-4 ad-cards">
                            <!-- Ad CARD START -->
                    <c:forEach var="ad" items="${ads}">
                    <div class="col ">
                        <div class="card h-100">
                            <c:if test="${ad == null}">
                            <div class="card-body">
                                <h3 class="card-title">No ads found</h3>
                            </div>
                            </c:if>
                            <c:if test="${ad != null}">
                            <div class="card-body">
                                <h2 class="card-title">${ad.title}</h2>
                                <h5 class="card-subtitle mb-2 text-muted fst-italic">${ad.category}</h5>
                                <p class="card-text">${ad.description}</p>
                                <form action="/ads/edit" method="post" class="z-1 position-absolute top-0 right-0 update-form row">
                                    <div class="invisible col">
                                        <label for="editTitle" class="form-label">Edit Title</label>
                                        <input name="title" type="text" placeholder="${ad.title}" id="editTitle" class="edit-title form-control">
                                        <label for="editDescription" class="form-label">Edit Description</label>
                                        <input name="description" type="text" placeholder="${ad.description}" id="editDescription" class="form-control edit-description">
                                    </div>
                                    <div class="invisible col">
                                        <label class="form-label">Edit Category</label>
                                        <br>
                                        <label><input type="checkbox" name="category" value="1">Furniture</label>
                                        <br>
                                        <label><input type="checkbox" name="category" value="2">Collectables</label>
                                        <br>
                                        <label><input type="checkbox" name="category" value="3">Toys</label>
                                        <br>
                                        <label><input type="checkbox" name="category" value="4">Items Wanted</label>
                                        <br>
                                        <label><input type="checkbox" name="category" value="5">Miscellaneous</label>
                                        <br>
                                        <label><input type="checkbox" name="category" value="6">Souvenirs</label>
                                        <br>
                                        <label><input type="checkbox" name="category" value="7">Jewelry</label>
                                        <br>
                                        <label><input type="checkbox" name="category" value="8">Services</label>
                                    </div>
                                    <input type="hidden" name="id" value="${ad.id}">
                                </form>
                                <button type="button" id="edit-btn" class="edit z-3 position-absolute"></button>
                            </div>
                            <div class="card-body invisible z-2 position-relative">
                                <button type="button" id="delete-btn" class="deleteAd btn btn-primary position-absolute start-0 top-100">Delete</button>
                                <button type="button" id="done-btn" class="doneButton btn btn-primary position-absolute end-0 top-100">Done</button>
                            </div>
                            <form action="/ads/delete" method="post" class="delete-form invisible">
                                <input type="hidden" name="title" value="${ad.title}">
                                <input type="hidden" name="description" value="${ad.description}">
                            </form>
                            </c:if>
                        </div>
                    </div>
                    <!-- Ad CARD END -->
                    </c:forEach>
                </div>
            </div>
    </div>
<script src="../js/buttons.js"></script>
</body>
</html>
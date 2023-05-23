<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Heirloom" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control"></textarea>
            </div>
            <div class="form-group">
                <label>Please Select a Category:</label>
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
            <input type="submit" class="btn btn-block btn-primary">
            <br>
            <a href="http://localhost:8080/ads">Go Back</a>
        </form>
    </div>
</body>
</html>

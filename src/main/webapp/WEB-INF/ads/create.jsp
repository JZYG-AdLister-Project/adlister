<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
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
                <label><input type="checkbox" name="category" value="Furniture">Furniture</label>
                <br>
                <label><input type="checkbox" name="category" value="Collectables">Collectables</label>
                <br>
                <label><input type="checkbox" name="category" value="Toys">Toys</label>
                <br>
                <label><input type="checkbox" name="category" value="Items wanted">Items Wanted</label>
                <br>
                <label><input type="checkbox" name="category" value="Miscellaneous">Miscellaneous</label>
                <br>
                <label><input type="checkbox" name="category" value="Souvenirs">Souvenirs</label>
                <br>
                <label><input type="checkbox" name="category" value="Jewelry">Jewelry</label>
                <br>
                <label><input type="checkbox" name="category" value="Services">Services</label>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
            <br>
            <a href="http://localhost:8080/ads">Go Back</a>
        </form>
    </div>
</body>
</html>

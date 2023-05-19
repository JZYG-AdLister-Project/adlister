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
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group">
                <label for="category">Category</label>
                <select name="category" id="category">
                    <option value="furniture">Furniture</option>
                    <option value="collectables">Collectables</option>
                    <option value="toys">Toys</option>
                    <option value="jewelry">Jewelry</option>
                    <option value="souvenirs">Souvenirs</option>
                    <option value="itemsWanted">Items Wanted</option>
                    <option value="services">Services</option>
                    <option value="miscellaneous">Miscellaneous</option>
                </select>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
            <br>
            <a href="http://localhost:8080/ads">Go Back</a>
        </form>
    </div>
</body>
</html>

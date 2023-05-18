<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
            <a class="navbar-brand" href="/ads/create">Post an ad!</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/login">Login</a></li>
            <c:if test="${!empty user}">
                <li class="logout-tab visible "><a href="/logout">Logout</a></li>
            </c:if>
            <c:if test="${empty user}">
                <li class="register-tab"><a href="/register">Register</a></li>
            </c:if>

        </ul>
    </div>
</nav>

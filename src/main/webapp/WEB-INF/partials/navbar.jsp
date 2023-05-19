<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
            <a class="navbar-brand" href="/ads/create">Post an ad!</a>

            <div class="navbar-brand">
                <c:if test="${!empty user}">
                    <form action="/ads/search" method="POST">
                        <label>
                            <input type="text" name="search" placeholder="Search">
                        </label>
                        <button type="submit">Search</button>
                    </form>
                </c:if>
            </div>

        </div>

        <ul class="nav navbar-nav navbar-right">

            <%-- If logged in: --%>
            <c:if test="${!empty user}">
                <li class="logout-tab visible "><a href="/logout">Logout</a></li>
            </c:if>

            <%-- If NOT logged in: --%>
            <c:if test="${empty user}">
                <form action="/ads/search" method="POST">
                    <input type="text" name="search" placeholder="Search">
                    <button type="submit">Search</button>
                </form>

                <li class="login-tab "><a href="/login">Login</a></li>
                <li class="register-tab"><a href="/register">Register</a></li>
            </c:if>

        </ul>
    </div>
</nav>

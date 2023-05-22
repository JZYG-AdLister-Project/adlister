<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">
                <img src="/img/heirloom.png" alt="Bootstrap" width="75" height="75">
            </a>
            <a class="navbar-brand" href="/ads/create">Post an heirloom!</a>


        </div>

        <%-- If user on search page, search bar is invisibe --%>
        <c:if test="${fn:containsIgnoreCase(pageContext.request.requestURI, '/search')}">
            <form class="d-flex input-group w-auto invisible" action="/ads/search" method="POST">
                <input type="text" class="form-control" name="search" placeholder="Search" aria-label="Search"/>
                <button class="btn btn-outline-primary" type="submit" data-mdb-ripple-color="dark">Search</button>
            </form>
        </c:if>

        <%-- If logged in search bar visible: --%>
        <c:if test="${!fn:containsIgnoreCase(pageContext.request.requestURI, '/search') && !empty user }">
            <form class="d-flex input-group w-auto visible" action="/ads/search" method="POST">
                <input type="text" class="form-control" name="search" placeholder="Search" aria-label="Search"/>
                <button class="btn btn-outline-primary" type="submit" data-mdb-ripple-color="dark">Search</button>
            </form>
        </c:if>

        <%-- If logged in search bar invisible: --%>
        <c:if test="${fn:containsIgnoreCase(pageContext.request.requestURI, '/search') && empty user }">
            <form class="d-flex input-group w-auto invisible" action="/ads/search" method="POST">
                <input type="text" class="form-control" name="search" placeholder="Search" aria-label="Search"/>
                <button class="btn btn-outline-primary" type="submit" data-mdb-ripple-color="dark">Search</button>
            </form>
        </c:if>

        <ul class="nav navbar-nav  justify-content-right">
            <%-- If logged in: --%>
                <c:if test="${!empty user }">
                <li class="logout-tab visible "><a href="/log out">Logout</a></li>
                <li class="profile-tab visible "><a href="/profile">View Profile</a></li>
                <li class="update-tab visible "><a href="/account-update">Update Profile</a></li>
            </c:if>
                <%-- If NOT logged in: --%>
            <c:if test="${empty user}">
                <li class="login-tab "><a href="/login">Login</a></li>
                <li class="register-tab"><a href="/register">Register</a></li>
            </c:if>
        </ul>
    </div>
</nav>

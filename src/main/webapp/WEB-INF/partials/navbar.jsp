<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">
                <img src="/img/heirloom.png" alt="Bootstrap" width="75" height="75">
            </a>
            <c:if test="${!fn:containsIgnoreCase(pageContext.request.requestURI, '/create')}">
                <a class="navbar-brand" href="/ads/create">Post an heirloom!</a>
            </c:if>

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

        <div class="nav navbar-nav  justify-content-right">
            <%-- If logged in: --%>
                <c:if test="${!empty user }">
                    <a class="logout-tab visible " href="/logout">
                        <img src="/img/door-closed-fill.svg" alt="Bootstrap" width="30" height="30">
                    </a>
                    <a class="profile-tab visible " href="/profile">
                        <img src="/img/person-square.svg" alt="Bootstrap" width="30" height="30">
                    </a>
                    <a class="update-tab visible " href="/account-update">
                        <img src="/img/edit-profile.svg" alt="Bootstrap" width="30" height="30">
                    </a>
            </c:if>
                <%-- If NOT logged in: --%>
            <c:if test="${empty user}">
                <a class="login-tab " href="/login">
                    <img src="/img/login.svg" alt="Bootstrap" width="60" height="60">
                </a>
                <a class="register-tab" href="/register">
                    <img src="/img/sign-up.svg" alt="Bootstrap" width="60" height="60">
                </a>
            </c:if>
        </div>
    </div>
</nav>

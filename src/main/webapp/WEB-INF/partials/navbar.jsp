<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
            <a class="navbar-brand" href="/ads/create">Post an ad!</a>

        </div>

        <ul class="nav navbar-nav navbar-right">



            <%-- If logged in: --%>
            <c:if test="${!empty user }">
                <div class="navbar-brand">
                    <form action="/ads/search" method="POST">
                        <label>
                            <input type="text" name="search" placeholder="Search">
                        </label>
                        <button type="submit">Search</button>
                    </form>
                </div>
                <li class="logout-tab visible "><a href="/logout">Logout</a></li>
                <li class="profile-tab visible "><a href="/profile">View Profile</a></li>
                <li class="update-tab visible "><a href="/account-update">Update Profile</a></li>
            </c:if>

            <%-- If NOT logged in: --%>
            <c:if test="${empty user}">
                <div class="navbar-brand">
                    <form action="/ads/search" method="POST">
                        <label>
                            <input type="text" name="search" placeholder="Search">
                        </label>
                        <button type="submit">Search</button>
                    </form>
                </div>

                <li class="login-tab "><a href="/login">Login</a></li>
                <li class="register-tab"><a href="/register">Register</a></li>
            </c:if>

        </ul>
    </div>
</nav>

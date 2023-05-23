<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Heirloom Details</title>

    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Heirloom Details" />
    </jsp:include>

    <style>
        .center-content {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 80vh;
            text-align: center;
        }
        .ad-info {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container center-content">
    <div class="ad-info">
        <h4 class="fw-bold">Title:</h4>
        <h2>${ad.title}</h2>
    </div>
    <div class="ad-info">
        <h4 class="fw-bold">Description:</h4>
        <h3 class="fs-4">${ad.description}</h3>
    </div>
    <div class="ad-info">
        <h4 class="fw-bold">Posted by:</h4>
        <p class="fs-6">${user.username}</p>
    </div>
</div>

</body>
</html>
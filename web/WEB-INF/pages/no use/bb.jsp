<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fordevelopment
  Date: 15/5/25
  Time: 下午11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<c:forEach var="stock" items="${requestScope.dkl}">
  ${stock.date} </br>
</c:forEach>
</body>
</html>

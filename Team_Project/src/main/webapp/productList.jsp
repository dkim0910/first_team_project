<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>Product List</title>
    <!-- 페이지 제목 옆의 아이콘 -->
    <link href="https://i.ibb.co/X4b9F9N/logo.png" rel="icon">
</head>
<body>
<h1>Product List</h1>
<table border="1">
    <tr>
        <th>#</th> <!-- 인덱스 번호를 표시하는 열 -->
        <th>Product ID</th>
        <th>Brand</th>
        <th>Name</th>
        <th>Price</th>
        <th>Image</th>
        <th>CATEGORY</th>
        <th>subCategory</th>
    </tr>
    <c:forEach var="product" items="${requestScope.products}" varStatus="status">
        <tr>
            <td>${status.index + 1}</td> <!-- 인덱스 번호 1부터 시작 -->
            <td>${product.product_id}</td>
            <td>${product.brand}</td>
            <td>${product.product_name}</td>
            <td>${product.price_amount}</td>
            <td><img src="${product.image_url}" alt="Product Image"/></td>
            <td>${product.CATEGORY}</td>
            <td>${product.subCategory}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

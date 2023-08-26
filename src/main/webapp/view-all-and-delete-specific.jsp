<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>KFC Sri Lanka onAir</title>
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
		<div class="container">
			<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link" aria-current="page" href="add-product.jsp">Add Product</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="search-and-update.jsp">Search & Update the Product</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active" href="#">View All & Delete Specific</a>
			  </li>
			</ul>			
			<br/>
			<h2>View All & Delete Specific Product</h2>
			<p style='color:magenta'>${message}</p>			
			<br/>		
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Product Code</th>
						<th>Product Name</th>
						<th>Price [LKR]</th>
					</tr>
				</thead>			
				<tbody>
					<tag:forEach var="product" items="${productList}">
						<tr>
							<td>${product.productCode}</td>
							<td>${product.name}</td>
							<td>${product.price}</td>
							<td>
								<form action="productmanager" method="post">								
									<input type="hidden" name="productCode" value="${product.productCode}">
									<input type="hidden" name="actiontype" value="delete">
									<button type="submit" class="btn btn-danger">Delete the Product</button>
								</form>							
							</td>
						</tr>
					</tag:forEach>
				</tbody>
			</table>	
		</div>
	</body>
</html>
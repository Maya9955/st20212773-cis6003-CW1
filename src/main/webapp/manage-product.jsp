<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://unpkg.com/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
	<meta charset="ISO-8859-1">
	<title>KFC onAir</title>
</head>
<body>
	<br/>
	<h2>Welcome to KFC Manage Product Wizard!</h2>
	<div class= "container">
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link" aria-current="page" href="getAllProducts?action=all">All Products</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="add-product.jsp">Add Product</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link  active" href="#">Manage Products</a>
		  </li>
		</ul>
		<br/>
		<h3>Search The Product:</h3>
		<p>${searchFeedBack}</p>
		<br>
		
		<form action="getProduct">
			<label for="productCode">Enter Product Code:</label>
			<input id="productCode" type="number" name="productCode" class="form-control"/>
			<br/>
			<button type="submit" class="btn btn-info">Search</button>
		</form>
		<br/>
		<hr/>
		<p>${updateMessage}</p>
		<br/>
		<form action="updateProduct?action=update" method="post">
			<label for="productCode">Product Code:</label>
			<input id="productCode" type="number" name="productCode" readonly="readonly" class="form-control" value ="${product.productCode}"/>
			<label for="productName">Product Name:</label>
			<input id="productName" type="text" name="productName" class="form-control" value ="${product.productName}"/>
			<label for="price">Price [LKR]:</label>
			<input id="price" type="number" name="price" class="form-control" value ="${product.price}"/>
			<br/>
			<button type="submit" class="btn btn-warning">Update</button>
		</form>	
		<br/>

	</div>
</body>
</html>
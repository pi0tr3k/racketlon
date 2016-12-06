<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> -->
<%@ include file="/WEB-INF/views/template/header.jsp" %> 

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Magazyn produktów</h1>
			<p>Jesteś na stronie magazynu produktów</p>
		</div>
		<table class="table table-stiped table-hover">
			<tr class="bg-success">
				<th>Zdjęcie</th>
				<th>Nazwa</th>
				<th>Kategoria</th>
				<th>Marka</th>
				<th>Cena</th>
				<th></th>
			</tr>
			<c:forEach items="${products}" var="product">
				<tr>
					<td><img src="<c:url value="/resources/images/${product.productId}.png" />" 
							 alt="zdjęcie" style="width:100%" /></td>
					<td>${product.productName}</td>
					<td>${product.productCategory}</td>
					<td>${product.productManufacturer}</td>
					<td>${product.productPrice} PLN</td>
					<td>
						<a href="<spring:url value="/productList/viewProduct/${product.productId}" />"
						><span class="glyphicon glyphicon-info-sign"></span></a>
						<a href="<spring:url value="/admin/productInventory/deleteProduct/${product.productId}" />"
						><span class="glyphicon glyphicon-remove"></span></a>
						<a href="<spring:url value="/admin/productInventory/editProduct/${product.productId}" />"
						><span class="glyphicon glyphicon-pencil"></span></a>
					</td>
				</tr>
			</c:forEach>
		</table>

<a href="<spring:url value="/admin/productInventory/addProduct" />" class="btn btn-primary ">Dodaj produkt</a>	
<br>
<%@ include file="/WEB-INF/views/template/footer.jsp" %> 
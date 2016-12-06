<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> -->
<%@ include file="/WEB-INF/views/template/header.jsp" %> 

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Wszystkie produkty</h1>
			<p>Sprawdź pozostałe dostępne produkty!</p>
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
					<td><a href="<spring:url value="/productList/viewProduct/${product.productId}" />"
					><span class="glyphicon glyphicon-info-sign"></span></a></td>
				</tr>
			</c:forEach>
		</table>

<%@ include file="/WEB-INF/views/template/footer.jsp" %> 
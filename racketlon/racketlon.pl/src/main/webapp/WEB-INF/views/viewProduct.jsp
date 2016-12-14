<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %> 

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Szczegóły produktu</h1>
			<p>Tutaj znajdziesz szczegółowe informacje na temat produktu.</p>
		</div>
		
		<div class="container" ng-app="cartApp">
			<div class="row">
				<div class="col-md-5">
					<img src="<c:url value="/resources/images/${product.productId}.png" />" 
						 alt="zdjęcie" style="width:100%" />
				</div>
			
				<div class="col-md-5">
					<h3>${product.productName}</h3>
					<p>${product.productDescription}</p>
					<p>
						<strong>Kategoria</strong> : ${product.productCategory}
					</p> 
					<p>
						<strong>Marka</strong> : ${product.productManufacturer}
					</p> 
					<p>
						<strong>Stan</strong> : ${product.productCondition}
					</p> 
					<p>
						<strong>Status</strong> : ${product.productStatus}
					</p> 
					<p>
						<strong>Ilość sztuk w magazynie</strong> : ${product.unitInStock}
					</p>
					<h4>
						${product.productPrice} PLN 
					</h4>
					<br/>
					<!-- Gość/Klient powraca do listy produktów, admin powraca to magazynu -->
					<c:set var="role" scope="page" value="${param.role}" />
					<c:set var="url" scope="page" value="/productList" />
					<c:if test="${role='admin'}">
						<c:set var="url" scope="page" value="/admin/productInventory" />
					</c:if>
					<p ng-controller="cartCtrl">
						<a href="<c:url value="${url}" />" class="btn btn-default">Cofnij</a>
						<!-- <a href="addToCart('${product.productId}')" class="btn btn-warning btn-large" ng-click="addToCart('${product.productId}')"> -->
						<a href="#" class="btn btn-warning btn-large" ng-click="addToCart('${product.productId}')">
						<span class="glyphicon glyphicon-shopping-cart"></span>Złóż zamówienie</a>
						<!-- <a href="<spring:url value="/cart" />" class="btn btn-default"> -->
						<a href="<spring:url value="/cart" />" class="btn btn-default">
						<span class="glyphicon glyphicon-hand-right"></span>Zobacz swój koszyk</a>
					</p>
				</div>
			</div>
		</div>
<script src="<c:url value="/resources/js/controller.js" />" ></script>
<%@ include file="/WEB-INF/views/template/footer.jsp" %> 
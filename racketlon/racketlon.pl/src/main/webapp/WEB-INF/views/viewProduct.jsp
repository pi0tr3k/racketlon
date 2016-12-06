<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %> 

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Szczegóły produktu</h1>
			<p>Tutaj znajdziesz szczegółowe informacje na temat produktu.</p>
		</div>
		
		<div class="container">
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
					<p>
						<strong>Cena</strong> : ${product.productPrice} PLN 
					</p> 
				</div>
			</div>
		</div>

<%@ include file="/WEB-INF/views/template/footer.jsp" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/template/header.jsp" %> 

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Strona administracyjna</h1>
			<p>Jesteś na stronie dla administratorów.</p>
		</div>
		<a href="<c:url value="/admin/productInventory" />"><h3>Zapasy magazynowe produktów</h3></a>

		<p>Tutaj możesz sprawdzić oraz modyfikować towary dostępne w magazynie.</p>
<%@ include file="/WEB-INF/views/template/footer.jsp" %> 
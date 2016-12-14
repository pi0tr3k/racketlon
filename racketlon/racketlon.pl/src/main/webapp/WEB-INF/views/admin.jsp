<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/template/header.jsp" %> 

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Strona administracyjna</h1>
			<p>Jesteś na stronie dla administratorów.</p>
		</div>
		
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
				Welcome: ${pageContext.request.userPrincipal.name} | 
				<a href="<c:url value="/j_spring_security_logout" />">Wyloguj</a>
			</h2>
		</c:if>
		
		
		<a href="<c:url value="/admin/productInventory" />"><h3>Zapasy magazynowe produktów</h3></a>

		<p>Tutaj możesz sprawdzić oraz modyfikować towary dostępne w magazynie.</p>
<%@ include file="/WEB-INF/views/template/footer.jsp" %> 
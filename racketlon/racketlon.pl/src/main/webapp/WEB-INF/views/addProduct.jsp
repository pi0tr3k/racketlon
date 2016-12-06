<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %> 

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Dodaj produkt</h1>
			<p>Wypełnij poniższy formularz aby dodać nowy produkt:</p>
		</div>
		
		<form:form 	action="${pageContext.request.contextPath}/admin/productInventory/addProduct" 
					method="post" commandName="product" enctype="multipart/form-data">
			<div class="form-group">
				<label for="name">Nazwa</label><form:errors path="productName" cssStyle="color: #ff0000;" />
				<!-- productName (path) is a field of product (commandName) -->
				<!-- class form-control expands input to whole screen width -->
				<form:input path="productName" id="name" class="form-control" />
			</div>
			
			<div class="form-group">
				<label for="category">Kategoria</label>
				<label class="checkbox-inline">
					<form:radiobutton path="productCategory" id="category" value="Tenis ziemny" />
					Tenis ziemny
				</label>
				<label class="checkbox-inline">
					<form:radiobutton path="productCategory" id="category" value="Tenis stołowy" />
					Tenis stołowy
				</label>
				<label class="checkbox-inline">
					<form:radiobutton path="productCategory" id="category" value="Badminton" />
					Badminton
				</label>
			</div>
			
			<div class="form-group">
				<label for=manufacturer>Marka</label><br>
				<form:input path="productManufacturer" id="manufacturer" class="form-control" />
			</div>
			
			<div class="form-group">
				<label for="price">Cena</label><form:errors path="productPrice" cssStyle="color: #ff0000;" />
				<br><form:input path="productPrice" id="price" class="form-control" />
			</div>
			
			<div class="form-group">
				<label for="condition">Stan</label>
				<label class="checkbox-inline">
					<form:radiobutton path="productCondition" id="condition" value="Nowy" />
					Nowy
				</label>
				<label class="checkbox-inline">
					<form:radiobutton path="productCondition" id="condition" value="Używany" />
					Używany
				</label>
			</div>
			
			<div class="form-group">
				<label for="status">Status</label>
				<label class="checkbox-inline">
					<form:radiobutton path="productStatus" id="status" value="W magazynie" />
					W magazynie
				</label>
				<label class="checkbox-inline">
					<form:radiobutton path="productStatus" id="status" value="Na zamówienie" />
					Na zamówienie
				</label>
				<label class="checkbox-inline">
					<form:radiobutton path="productStatus" id="status" value="Niedostępny" />
					Niedostępny
				</label>
			</div>
			
			<div class="form-group">
				<label for="unitInStock">Ilość sztuk w magazynie</label><form:errors path="unitInStock" cssStyle="color: #ff0000;" />
				<br><form:input path="unitInStock" id="unitInStock" class="form-control" />
			</div>
			
			<div class="form-group">
				<label for="description">Opis</label><br>
				<form:textarea path="productDescription" id="description" class="form-control" />
			</div>
			
			<div class="form-group">
				<label class="control-label" for=productImage>Załaduj zdjęcie</label><br>
				<form:input path="productImage" id="productImage" type = "file" class="form:input-large" />
			</div>
			<br>
			<input type="submit" value="Dodaj" class="btn btn-primary" />
			<a href="<c:url value="/admin/productInventory" />" class="btn btn-primary">Anuluj</a>
			<br>
		</form:form>

<%@ include file="/WEB-INF/views/template/footer.jsp" %> 
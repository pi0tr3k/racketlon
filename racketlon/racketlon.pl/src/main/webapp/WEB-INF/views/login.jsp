<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/views/template/header.jsp"%>

<div class="container-wrapper">
    <div class="container">
        <div id="login-box">

            <h1>Podaj nazwę użytkownika i hasło</h1>

            <c:if test="${not empty msg}" >
                <div class="msg">${msg}</div>
            </c:if>

            <c:if test="${not empty logout}" >
                <div class="msg">${logout}</div>
            </c:if>

            <form class="login-form" name="loginForm" action="<c:url value="/j_spring_security_check"/>" method="post">
                <c:if test="${not empty error}">
                    <div class="error" style="color: red">${error}</div>
                </c:if>
                <div class="form-group">
                    <label for="username">Użytkownik:</label>
                    <input type="text" id="username" name="username" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="password">Hasło:</label>
                    <input type="password" id="password" name="password" class="form-control"/>
                </div>
                <input type="submit" value="Zaloguj" class="btn btn-default">

                <input type="hidden" name="$(_csrf.parameterName)" value="$(_csrf.token)" />
            </form>

        </div>
    </div>
</div>
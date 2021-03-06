<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de Produtos</title>
</head>
<body>
	<form:form method="post" action="/LearningSpring/produtos" commandName="product">
		<div>
			<label for="title">Titulo</label>
			 <form:input  path="title" />
			 <form:errors path="title"/>
		</div>
		<div>
			<label for="description">Descrição</label>
			<form:textarea rows="10" cols="20" path="description" />
			<form:errors path="description"/>
		</div>
		<div>
			<label for="pages">Número de paginas</label>
			 <form:input  path="pages" />
			<form:errors path="pages"/>
		</div>
		
		<div>
			<label for="releaseDate">Data de Lancamento</label>
			<form:input type="date" path="releaseDate"/>
			<form:errors path="releaseDate"/>
		</div>

		<c:forEach items="${types}" var="bookType" varStatus="status">
			<div>
				<label for="price_${bookType}">${bookType}</label> <input
					type="text" name="prices[${status.index}].value"
					id="price_${bookType}" /> <input type="hidden"
					name="prices[${status.index}].bookType" value="${bookType}" />
			</div>

		</c:forEach>

		<div>
			<input type="submit" value="Enviar">
		</div>

	</form:form>






</body>
</html>
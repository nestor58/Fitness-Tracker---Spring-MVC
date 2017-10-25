<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css" />
<title><spring:message code="AddGoal"/></title>
 <style>
		.error {
			color: #ff0000;
		}
		
		.errorblock {
			color: #000;
			background-color: #ffEEEE;
			border: 3px solid #ff0000;
			padding: 8px;
			margin: 16px;
		}
	</style>
	
</head>
<body>
<h1><spring:message code="AddTheGoal"/></h1>
<br/><br/>
Language : <a href="?language=en">English</a> | <a href="?language=es">Spanish</a> | <a href="?language=fr">French</a>
<br/><br/>
<h2><spring:message code="goalpage.desc"/></h2>
<h2><spring:message code="goalpage.desc2"/></h2>

<form:form commandName="goal">
	<form:errors path="*" cssClass="errorblock" element="div" />
	<table>
		<tr>
			<td><h3><spring:message code="EnterMinutes"/></h3></td>
			<td><form:input path="minutes"/></td>
			<td><form:errors path="minutes" cssClass="error" /></td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="submit" value='<spring:message code="EnterGoalMinutes"/>' />
			</td>
		</tr>
	</table>
</form:form>

</body>
</html>
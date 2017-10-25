<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css" />
<title>Add Minutes Page</title>
<script type="text/javascript" src="jquery-3.2.1.js"></script>
<script type="text/javascript">
		$(document).ready(
			function() {
				$.getJSON('<spring:url value="activities.json"/>', {
					ajax : 'true'
				}, function(data){
					var html = '<option value="">--Please select one--</option>';
					var len = data.length;
					for (var i = 0; i < len; i++) {
						html += '<option value="' + data[i].desc + '">'
								+ data[i].desc + '</option>';
					}
					html += '</option>';
					
					$('#activities').html(html);
				});
				
			});
		
		function myFunction() {
		    if (${goal.minutes} < ${exercise.totalMinutes})
		    	document.getElementById("demo").innerHTML = "<h2 style='background-color:DodgerBlue;'><spring:message code='GoodYouHaveReachTheTarget'/></h2>";
		    	else if (${exercise.totalMinutes} > 0)
		    		document.getElementById("demo").innerHTML = "<h2><spring:message code='AddMoreMinutesUntil'/></h2>";
		}
				
	</script>
	
	
</head>
<body onload="myFunction()">
<h1>Add minutes exercised</h1>
<br/><br/>
Language : <a href="?language=en">English</a> | <a href="?language=es">Spanish</a> | <a href="?language=fr">French</a>
<br/><br/>
<form:form modelAttribute="exercise">
	<table>
		<tr>
			<td><spring:message code="goal.text"/></td>
			<td><form:input path="minutes"/></td>
			<td>
				<form:select id="activities" path="activity"></form:select>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="submit" value="Enter Exercise"/>
			</td>
		</tr>		
	</table>
</form:form>
<h3><spring:message code="OurGoalForThisWeekIs"/>${goal.minutes}</h3>
<h3><spring:message code="ActivitiesForToday"/><br/>  ${exercise.list}</h3>
<h3><spring:message code="TheTotalForTodayIs"/> ${exercise.totalMinutes}</h3>
<p id="demo"></p>
</body>
</html>
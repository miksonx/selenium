<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="includes/header.jsp" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Please login</h3>
  </div>
<div class="panel-body">
	<form:form modelAttribute="user" id="loginForm">
	  <form:errors cssClass="error"></form:errors>
      <div class="form-group">
	    <form:label path="name" >Username</form:label>
	    <form:input path="name" type="text" class="form-control" id="username" placeholder="Username" />
	    <form:errors path="name" cssClass="error"></form:errors>
	  </div>
	  <div class="form-group">
	    <form:label path="password">Password</form:label>
	    <form:input path="password" type="password" class="form-control" id="password" placeholder="Password" />
	    <form:errors path="password" cssClass="error"></form:errors>
	  </div>
	  <button type="submit" class="btn btn-primary" id="login">Login</button>
	</form:form>
	</div>
</div>
<%@include file="includes/footer.jsp" %>
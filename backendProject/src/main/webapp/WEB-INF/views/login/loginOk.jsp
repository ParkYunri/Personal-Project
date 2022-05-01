<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String userid = request.getParameter("userid"); //id가 아닌 name을 받는다
String userpw = request.getParameter("userpw");

boolean isSuccess = false;

if(userid.equals("abcd") && userpw.equals("1234")){
	isSuccess = true;
}

%>
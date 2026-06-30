<%@page import="kr.co.sist.mypage.MyPageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String id=request.getParameter("id");
MyPageService mps=new MyPageService();
pageContext.setAttribute("userData", mps.searchMyPage(id));
%>
<%= mps.searchMyPage(id) %>
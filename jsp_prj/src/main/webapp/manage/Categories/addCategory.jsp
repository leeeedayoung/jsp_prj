<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

CategoryDTO cDTO = new CategoryDTO();
cDTO.setCategoryName(request.getParameter("categoryName"));

CategoryService cs = new CategoryService();
cs.addCategory(cDTO);

out.print("success");
%>
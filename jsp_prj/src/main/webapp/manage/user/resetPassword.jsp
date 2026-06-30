<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ClientService sc = new ClientService();

String clientId = request.getParameter("clientId");
String newPw = sc.changeClientPw(clientId);

response.setContentType("application/json;charset=UTF-8");

out.print("{");
out.print("\"newPw\":\"" + newPw + "\"");
out.print("}");
%>
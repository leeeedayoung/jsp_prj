<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
SearchProductService sps = new SearchProductService();
String[] prdIDs = request.getParameterValues("prdID");

if(prdIDs != null){
    for(String prdID : prdIDs){
        ProductDTO dto = new ProductDTO();
        dto.setPrdID(prdID);
        sps.deleteProduct(dto);
    }//end for
}//end if
response.sendRedirect("vieweditProducts.jsp");
%>
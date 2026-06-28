<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

ProductDTO pDTO = new ProductDTO();

pDTO.setCategory(request.getParameter("category"));
pDTO.setPrdName(request.getParameter("prdName"));
pDTO.setPrdDescription(request.getParameter("prdDescription"));

pDTO.setPrice(Integer.parseInt(request.getParameter("price")));
pDTO.setMinPurchase(Integer.parseInt(request.getParameter("minPurchase")));
pDTO.setMaxPurchase(Integer.parseInt(request.getParameter("maxPurchase")));
pDTO.setDiscount(Integer.parseInt(request.getParameter("discount")));

AddProductService service = new AddProductService();

int result = service.addProduct(pDTO);

if (result > 0) {
    response.sendRedirect("adminProducts.jsp");
} else {
%>
<script>
    alert("상품 등록에 실패했습니다.");
    history.back();
</script>
<%
}
%>
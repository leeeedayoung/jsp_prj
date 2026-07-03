<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../login/loginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View/Edit Products</title>
<link rel="shortcut icon" href="http://localhost/jsp_prj/manage/images/favicon.png"/>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/dashboard.css" rel="stylesheet">
<link href="../css/vieweditProducts.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>
function resetSearch(){
    document.getElementById("keyword").value = "";
    document.querySelector("input[name='status'][value='all']").checked = true;
    document.getElementById("category").selectedIndex = 0;
    document.getElementById("startDate").value = "";
    document.getElementById("endDate").value = "";
    
    let dateBtns = document.querySelectorAll(".date-btns button");
    dateBtns.forEach(function(btn){
        btn.classList.remove("active");
    });
    dateBtns[3].classList.add("active");
} //resetSearch

function selectPeriod(btn){
    let dateBtns = document.querySelectorAll(".date-btns button");
    dateBtns.forEach(function(item){
        item.classList.remove("active");
    });
    btn.classList.add("active");
}//selectPeriod

function checkAllProducts(check){
    let products = document.querySelectorAll(".productCheck");
    products.forEach(function(item){
        item.checked = check.checked;
    });
}//checkAllProducts

function checkProduct(){
    let products = document.querySelectorAll(".productCheck");
    let checked = document.querySelectorAll(".productCheck:checked");
    document.getElementById("checkAll").checked =
        (products.length == checked.length);
}//checkProduct

function deleteProduct(){
    let checked = document.querySelectorAll(".productCheck:checked");
    if(checked.length == 0){
        alert("삭제할 상품을 선택하세요.");
        return;
    }
    if(!confirm("선택한 상품을 삭제하시겠습니까?")){
        return;
    }
    let form = document.getElementById("deleteForm");
    form.innerHTML = "";
    checked.forEach(function(item){
        let input = document.createElement("input");
        input.type = "hidden";
        input.name = "prdID";
        input.value = item.value;
        form.appendChild(input);
    });
    form.submit();
}//deleteProduct

function openEditModal(productNo, productName, stock){
    document.getElementById("editProductNo").value = productNo;
    document.getElementById("editName").value = productName;
    document.getElementById("editStock").value = stock;
    document.getElementById("editModal").style.display = "flex";
}//openEditModal

function closeEditModal(){
    document.getElementById("editModal").style.display = "none";
}//closeEditModal

</script>
</head>

<body>
	<div class="wrapper">
		<!-- 사이드바 -->
		<c:import url="../fragments/sidebar.jsp"></c:import>

		<%
		SearchProductService sps = new SearchProductService();
		List<ProductDTO> productList = sps.searchItem("");

		request.setAttribute("productList", productList);
		request.setAttribute("totalCount", sps.countTotal());
		request.setAttribute("onSaleCount", sps.countOnSale());
		request.setAttribute("soldoutCount", sps.countSoldOut());
		%>

		<!-- 메인 -->
		<div class="main">
			<!-- 헤더 -->
			<div class="top-header">
				<div>
					<h3>View/Edit Products</h3>
				</div>
			</div>
			<!-- 내용 -->
			<div class="card product-wrap">
				<!-- 통계 -->
				<div class="status-box">
					<div class="status-item">
						<p>전체</p>
						<h3>
							${totalCount} <span>건</span>
						</h3>
					</div>
					<div class="status-item">
						<p>판매중</p>
						<h3>
							${onSaleCount} <span>건</span>
						</h3>
					</div>
					<div class="status-item">
						<p>품절</p>
						<h3>
							${soldoutCount} <span>건</span>
						</h3>
					</div>
				</div>

				<!-- 검색 -->
				<div class="search-area">
					<div class="search-row">
						<div class="search-title">검색어</div>
						<div class="search-content">
							<input type="text" id="keyword" class="form-control"
								placeholder="상품명을 입력하세요">
						</div>
					</div>
					<div class="search-row">
						<div class="search-title">판매상태</div>
						<div class="search-content">
							<label><input type="radio" name="status" value="all" checked> 전체</label>
							<label><input type="radio" name="status" value="sale"> 판매중</label>
							<label><input type="radio" name="status" value="soldout"> 품절</label>
						</div>
					</div>
					<div class="search-row">
						<div class="search-title">카테고리</div>
						<div class="search-content">
							<select id="category" class="form-select">
								<option>전체</option>
								<option>과일</option>
								<option>채소</option>
							</select>
						</div>
					</div>

					<div class="search-row">
						<div class="search-title">기간</div>
						<div class="search-content">
							<div class="date-btns">
								<button type="button" onclick="selectPeriod(this)">오늘</button>
								<button type="button" onclick="selectPeriod(this)">1주일</button>
								<button type="button" onclick="selectPeriod(this)">1개월</button>
								<button type="button" class="active" onclick="selectPeriod(this)">3개월</button>
								<button type="button" onclick="selectPeriod(this)">6개월</button>
								<button type="button" onclick="selectPeriod(this)">1년</button>
								<button type="button" onclick="selectPeriod(this)">전체</button>
							</div>
							<div class="date-input">
								<input type="date" id="startDate"> ~ <input type="date" id="endDate">
							</div>
						</div>
					</div>

					<div class="search-button">
						<button type="button" class="btn-reset" onclick="resetSearch()">초기화</button>
						<button type="button" class="btn-search">조회</button>
					</div>
				</div>

				<!-- 목록 -->
				<div class="list-top">
					<span>상품목록 <b>5644</b>개
					</span> <select id="pageSize">
						<option value="20">20개씩</option>
						<option value="50">50개씩</option>
						<option value="100">100개씩</option>
					</select>
				</div>

				<table class="table table-bordered table-hover align-middle text-center">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll" onclick="checkAllProducts(this)"></th>
							<th>수정</th>
							<th>복사</th>
							<th>상품번호</th>
							<th>상품명</th>
							<th>판매상태</th>
							<th>재고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${productList}">
							<tr>
								<td><input type="checkbox" class="productCheck" onclick="checkProduct()"
									value="${product.prdID}"></td>
								<td>
									<button class="btn btn-sm btn-outline-secondary"
										onclick="openEditModal('${product.prdID}','${product.prdName}','${product.stock}')">
										수정</button>
								</td>
								<td>
									<button class="btn btn-sm btn-warning copy-btn"
										data-product-no="${product.prdID}">복사</button>
								</td>
								<td>${product.prdID}</td>
								<td>${product.prdName}</td>
								<td>${product.status}</td>
								<td>${product.stock}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="pagination-wrap">
					<button>&lt;</button>
					<button class="active">1</button>
					<button>2</button>
					<button>3</button>
					<button>4</button>
					<button>5</button>
					<button>&gt;</button>
				</div>

				<form id="deleteForm" method="post" action="deleteProduct.jsp"></form>
				
				<div class="delete-btn">
					<button type="button" id="deleteBtn" onclick="deleteProduct()">상품삭제</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 상품 수정 모달 -->
	<div id="editModal" class="modal-overlay">

		<div class="modal-box">
		 	<form action="changeProduct.jsp" method="post">
			<div class="modal-header">
				<span>상품 정보</span>
				<button type="button" id="closeModal" onclick="closeEditModal()">&times;</button>
			</div>
			<div class="modal-body">
				<input type="hidden" id="editProductNo" name="prdID">
				<div class="form-group">
					<label>카테고리 <span class="required">*</span></label> <select
						id="editCategory">
						<option>채소</option>
						<option>과일</option>
					</select>
				</div>
				<div class="form-group">
					<label>상품명 <span class="required">*</span></label>
					<input type="text" id="editName" name="prdName">
				</div>
				<div class="form-group">
					<label>판매 가격</label>
					<div class="price-box">
						<span>₩</span> <input type="text" id="editPrice">
					</div>
				</div>
				<div class="form-group">
					<label>재고 수량</label>
					<div class="stock-box">
						<button type="button" id="minusBtn">-</button>
						<input type="text" id="editStock" value="5" name="stock">
						<button type="button" id="plusBtn">+</button>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button type="button" id="cancelBtn" onclick="closeEditModal()">취소</button>
				<button id="saveBtn">저장하기</button>
			</div>
			</form>
		</div>
	</div>
</body>
</html>
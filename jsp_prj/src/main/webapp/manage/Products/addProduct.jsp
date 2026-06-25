<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="../login/loginCheck.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
<link href="http://localhost/jsp_prj/manage/css/bootstrap.min.css"
	rel="stylesheet">

<link href="http://localhost/jsp_prj/manage/css/dashboard.css"
	rel="stylesheet">

<link href="http://localhost/jsp_prj/manage/css/addProduct.css"
	rel="stylesheet">

</head>

<body>
	<div class="wrapper">

		<!-- 사이드바 -->
		<c:import url="../fragments/sidebar.jsp"></c:import>

		<!-- 메인 -->
		<div class="main">

			<!-- 헤더 -->
			<div class="top-header">
				<div>
					<h3>AddProduct</h3>
				</div>
			</div>

			<!-- 내용 -->
			<div class="product-wrap">
				<div class="accordion">

					<!-- 기본정보 -->
					<div class="accordion-item">
						<div class="accordion-header">
							<span>기본정보 <span class="required">*</span></span> <span class="arrow">&#9662;</span>
						</div>

						<div class="accordion-content">
							<div class="input-group">
								<label for="category">카테고리 <span class="required">*</span></label> <select id="category"
									name="category">
									<option value="">카테고리를 선택하세요.</option>
									<option value="fruit">과일</option>
									<option value="vegetable">채소</option>
								</select> 
								<%-- <select id="category" name="category">
									<c:forEach var="category" items="${categoryList}">
										<option value="${category.categoryNo}">
											${category.categoryName}</option>
									</c:forEach>
								</select> --%>
							</div>
						</div>
					</div>

					<!-- 상품명 -->
					<div class="accordion-item">
						<div class="accordion-header">
							<span>상품명 <span class="required">*</span></span> <span
								class="arrow">&#9662;</span>
						</div>

						<div class="accordion-content">
							<!-- 상품명 -->
							<div class="input-row">
								<label for="productName">상품명 <span class="required">*</span></label>
								<div class="input-box">
									<input type="text" id="productName" name="productName"
										maxlength="50" placeholder="상품명을 입력하세요."> <span
										class="count"> <span id="nameCount">0</span>/50자
									</span>
								</div>
							</div>
							
							<!-- 상품설명 -->
							<div class="input-row">

								<label for="productDesc">상품설명</label>

								<div class="input-box">
									<textarea id="productDesc" name="productDesc" maxlength="150"
										placeholder="상품설명을 입력하세요."></textarea>
									<span class="count"> <span id="descCount">0</span>/150자
									</span>
								</div>
							</div>
						</div>
					</div>

					<!-- 판매정보 -->
					<div class="accordion-item">
						<div class="accordion-header">
							<span>판매정보 <span class="required">*</span></span> <span
								class="arrow">&#9662;</span>
						</div>

						<div class="accordion-content">

							<!-- 가격 -->
							<div class="sale-row">
								<label for="price">가격</label>
								<div class="sale-input">
									<input type="number" id="price" name="price"> <span>원</span>
								</div>
							</div>

							<!-- 최소구매수량 -->
							<div class="sale-row">
								<label for="minQty">최소구매수량 <span class="required">*</span></label>
								<div class="sale-input">
									<input type="number" id="minQty" name="minQty" value="1" min="1">
									<span>개</span>
								</div>
							</div>

							<!-- 최대구매수량 -->
							<div class="sale-row">
								<label for="maxQty">최대구매수량</label>
								<div class="sale-input">
									<input type="number" id="maxQty" name="maxQty"
										value="999999999" max="999999999"> <span>개</span>
								</div>
							</div>

							<!-- 할인율 -->
							<div class="sale-row">
								<label for="discount">할인율</label>
								<div class="sale-input">
									<input type="number" id="discount" name="discount"> <span>%</span>
								</div>
							</div>
						</div>
					</div>

					<!-- 옵션 -->
					<div class="accordion-item">
						<div class="accordion-header active">
							<span>옵션 <span class="required">*</span></span> <span
								class="arrow">&#9652;</span>
						</div>

						<div class="accordion-content show">
							<div class="form-row">
								<label>옵션명</label> <input type="text">
							</div>
						</div>
					</div>
				</div>

				<div class="btn-area">
					<button class="save-btn">저장</button>
				</div>
			</div>
		</div>
	</div>
	<script src="http://localhost/jsp_prj/manage/js/addProduct.js"></script>
</body>

</html>
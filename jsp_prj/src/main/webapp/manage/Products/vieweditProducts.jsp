<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="../login/loginCheck.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View/Edit Products</title>
<link href="http://localhost/jsp_prj/manage/css/bootstrap.min.css"
	rel="stylesheet">

<link href="http://localhost/jsp_prj/manage/css/dashboard.css"
	rel="stylesheet">

<link href="http://localhost/jsp_prj/manage/css/vieweditProducts.css"
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
							${sellingCount} <span>건</span>
						</h3>
					</div>


					<div class="status-item">
						<p>품절</p>
						<h3>
							${soldOutCount} <span>건</span>
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
							<label> <input type="radio" name="status" value="all"
								checked> 전체
							</label> <label> <input type="radio" name="status" value="sale">
								판매중
							</label> <label> <input type="radio" name="status"
								value="soldout"> 품절
							</label>
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
								<button>오늘</button>
								<button>1주일</button>
								<button>1개월</button>
								<button class="active">3개월</button>
								<button>6개월</button>
								<button>1년</button>
								<button>전체</button>
							</div>

							<div class="date-input">
								<input type="date" id="startDate"> ~ <input type="date"
									id="endDate">
							</div>

						</div>
					</div>

					<div class="search-button">
						<button type="button" class="btn-reset">초기화</button>
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

				<table
					class="table table-bordered table-hover align-middle text-center">

					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll"></th>
							<th>수정</th>
							<th>복사</th>
							<th>상품번호</th>
							<th>상품명</th>
							<th>판매상태</th>
							<th>재고수</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="product" items="${productList}">
							<tr>
								<td><input type="checkbox" class="productCheck"
									value="${product.productNo}"></td>
								<td>
									<button class="btn btn-sm btn-outline-secondary edit-btn"
										data-product-no="${product.productNo}"
										data-name="${product.productName}"
										data-status="${product.status}" data-stock="${product.stock}">
										수정</button>
								</td>
								<td>
									<button class="btn btn-sm btn-warning copy-btn"
										data-product-no="${product.productNo}">복사</button>
								</td>

								<td>${product.productNo}</td>
								<td>${product.productName}</td>
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

				<div class="delete-btn">
					<button id="deleteBtn">상품삭제</button>
				</div>

			</div>

		</div>
	</div>

	<script src="http://localhost/jsp_prj/manage/js/vieweditProducts.js"></script>

	<!-- 상품 수정 모달 -->
	<div id="editModal" class="modal-overlay">

		<div class="modal-box">

			<div class="modal-header">
				<span>상품 정보</span>
				<button id="closeModal">&times;</button>
			</div>

			<div class="modal-body">

				<input type="hidden" id="editProductNo">

				<div class="form-group">
					<label>카테고리 <span class="required">*</span></label> <select
						id="editCategory">
						<option>채소</option>
						<option>과일</option>
					</select>
				</div>

				<div class="form-group">
					<label>상품명 <span class="required">*</span></label> <input
						type="text" id="editName">
				</div>

				<div class="form-group">
					<label>판매상태</label> <select id="editStatus">
						<option selected="selected">판매중</option>
						<option>품절</option>
					</select>
				</div>

				<div class="form-group">
					<label>가격</label>

					<div class="price-box">
						<span>₩</span> <input type="text" id="editPrice">
					</div>
				</div>

				<div class="form-group">
					<label>재고수량</label>

					<div class="stock-box">
						<button type="button" id="minusBtn">-</button>
						<input type="text" id="editStock" value="5">
						<button type="button" id="plusBtn">+</button>
					</div>
				</div>

			</div>

			<div class="modal-footer">
				<button id="cancelBtn">취소</button>
				<button id="saveBtn">저장하기</button>
			</div>

		</div>

	</div>

</body>

</html>
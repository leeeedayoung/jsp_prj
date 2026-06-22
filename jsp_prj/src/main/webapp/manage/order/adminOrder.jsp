<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order</title>
<link href="http://localhost/jsp_prj/manage/css/bootstrap.min.css"
	rel="stylesheet">

<link href="http://localhost/jsp_prj/manage/css/dashboard.css"
	rel="stylesheet">

<link href="http://localhost/jsp_prj/manage/css/order.css"
	rel="stylesheet">
</head>

<body>
	<div class="wrapper">

		<!-- 사이드바 -->
		<div class="sidebar">
			<div class="logo">
				<h3>
					프레시마켓 <span>Admin</span>
				</h3>
			</div>

			<ul>
				<li><a href="../dashboard/dashboard.jsp"> Dashboard </a></li>
				<li><a href="../Products/vieweditProducts.jsp"> Products </a></li>
				<li><a href="../Categories/adminCategories.jsp"> Categories </a></li>
				<li class="active"><a href="../order/adminOrder.jsp"> Order </a></li>
				<li><a href="../user/adminUsers.jsp"> Users </a></li>
				<li><a href="../inquiries/adminInquiries.jsp"> Inquiries </a></li>
			</ul>

			<div class="bottom-menu">
				<ul>
					<li><a href="../dashboard/settings.jsp"> Settings </a></li>
					<li><a href="../login/login.jsp" class="logout">Logout</a></li>
				</ul>
			</div>
		</div>

		<!-- 메인 -->
		<div class="main">

			<!-- 헤더 -->
			<div class="top-header">
				<div>
					<h3>대시보드</h3>
					<span class="badge-custom"> 실시간 모니터링 </span>
				</div>
				<div class="update">마지막 업데이트 :</div>
			</div>

			<!-- 내용 -->
			<div class="order-wrap">

				<h2 class="page-title">주문목록</h2>

				<!-- 검색 영역 -->
				<div class="search-box">

					<div class="search-row">
						<label>조회기간</label>

						<button type="button" class="date-btn">오늘</button>
						<button type="button" class="date-btn">1주일</button>
						<button type="button" class="date-btn active">1개월</button>
						<button type="button" class="date-btn">3개월</button>
						<input type="date" id="startDate"> ~ <input type="date"
							id="endDate">
					</div>

					<div class="search-row">
						<label>처리상태</label> <select id="orderStatus">
							<option value="">전체</option>
							<option value="paid">결제완료</option>
							<option value="ready">배송준비중</option>
							<option value="delivery">배송중</option>
							<option value="complete">배송완료</option>
							<option value="cancel">취소요청</option>
						</select>
					</div>

					<div class="search-row">
						<label>상품구분</label> <select id="category">
							<option value="">전체</option>
							<option value="vegetable">채소</option>
							<option value="fruit">과일</option>
						</select>
					</div>

					<div class="search-btn-area">
						<button type="button" id="resetBtn">초기화</button>
						<button type="button" id="searchBtn">조회</button>
					</div>

				</div>

				<!-- 주문 목록 -->
				<table class="order-table">
					<thead>
						<tr>
							<th><input type="checkbox" id="allCheck"></th>
							<th>No.</th>
							<th>주문번호</th>
							<th>회원ID</th>
							<th>상품명</th>
							<th>주문일</th>
							<th>결제금액</th>
							<th>수량</th>
							<th>주문상태</th>
							<th>클레임</th>
						</tr>
					</thead>

					<tbody id="orderTableBody">
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>202506200001</td>
							<td>user01</td>
							<td>유기농 사과</td>
							<td>2025-06-20</td>
							<td>15,000원</td>
							<td>1</td>
							<td>배송준비중</td>
							<td>
								<button class="claim-btn">교환 요청</button>
							</td>
						</tr>

						<tr>
							<td><input type="checkbox"></td>
							<td>2</td>
							<td>202506200002</td>
							<td>user02</td>
							<td>방울토마토</td>
							<td>2025-06-20</td>
							<td>12,000원</td>
							<td>2</td>
							<td>배송완료</td>
							<td>
								<button class="cancel-btn">취소 요청</button>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="bottom-btn">
					<button type="button" id="deliveryBtn">배송처리</button>
				</div>

			</div>
		</div>
	</div>
	<script src="http://localhost/jsp_prj/manage/js/order.js"></script>

</body>

</html>
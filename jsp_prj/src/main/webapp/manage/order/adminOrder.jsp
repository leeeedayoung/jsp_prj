<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="../login/loginCheck.jsp" %>
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
					<li><a href="../login/logout.jsp" class="logout">Logout</a></li>
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
								<button class="cancel-btn" data-order-no="202506200002">취소 요청</button>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="bottom-btn">
					<button type="button" id="deliveryBtn" data-order-no="202506200001">배송처리</button>
				</div>

			</div>
		</div>
	</div>
	<script src="http://localhost/jsp_prj/manage/js/bootstrap.bundle.min.js"></script>
	<script src="http://localhost/jsp_prj/manage/js/order.js"></script>

	<!-- 취소 요청 상세 -->
	<div class="modal fade" id="cancelModal" tabindex="-1">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">취소요청 상세</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body">
					<table class="table table-bordered">
						<tr>
							<th>클레임번호</th>
							<td>81377</td>
							<th>취소요청일시</th>
							<td>2025-07-11 17:22:28</td>
						</tr>
						<tr>
							<th>클레임상태</th>
							<td>취소요청</td>
							<th>구매자 연락처</th>
							<td>010-1111-1111</td>
						</tr>
					</table>

					<h6>취소요청 상품</h6>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>No</th>
								<th>상품코드</th>
								<th>상품명</th>
								<th>단가</th>
								<th>취소수량</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>1000036987</td>
								<td>친환경 바른계란</td>
								<td>8,000</td>
								<td>2</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="modal-footer">
					<button class="btn btn-danger">취소완료 처리</button>
					<button class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 교환 요청 상세 -->
	<div class="modal fade" id="exchangeModal" tabindex="-1">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">교환 / 반품 요청 상세</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<table class="table table-bordered">
						<tr>
							<th>클레임번호</th>
							<td>57724</td>
							<th>클레임요청일</th>
							<td>2025-07-03</td>
						</tr>
						<tr>
							<th>주문자ID</th>
							<td>홍길동</td>
							<th>연락처</th>
							<td>010-1234-5678</td>
						</tr>
					</table>
					<h6>상품정보</h6>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>No</th>
								<th>상품번호</th>
								<th>상품명</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>P20230401</td>
								<td>친환경 바른계란</td>
								<td>교환요청</td>
							</tr>
						</tbody>
					</table>
					<div class="mt-3">
						<h6>상세사유</h6>
						<textarea class="form-control" rows="4" readonly>
						상품이 파손된 상태로 배송되었습니다.
                    	</textarea>
					</div>
				</div>

				<div class="modal-footer">
					<button class="btn btn-primary">교환승인</button>
					<button class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

</body>

</html>
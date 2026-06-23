<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users</title>
<link href="http://localhost/jsp_prj/manage/css/bootstrap.min.css"
	rel="stylesheet">

<link href="http://localhost/jsp_prj/manage/css/dashboard.css"
	rel="stylesheet">

<link href="http://localhost/jsp_prj/manage/css/user.css"
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
				<li><a href="../order/adminOrder.jsp"> Order </a></li>
				<li class="active"><a href="../user/adminUsers.jsp"> Users </a></li>
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
			<div class="users-page">

				<!-- 상단 통계 -->
				<div class="user-summary">
					<div class="summary-card">
						<div class="summary-icon">👥</div>
						<div>
							<div class="summary-title">전체 사용자</div>
							<div class="summary-count">1,284명</div>
						</div>
					</div>

					<div class="summary-card">
						<div class="summary-icon">📝</div>
						<div>
							<div class="summary-title">신규 가입</div>
							<div class="summary-count">+42명</div>
						</div>
					</div>
				</div>

				<!-- 목록 + 상세 -->
				<div class="user-content">
					<!-- 왼쪽 -->
					<div class="user-list-box">
						<div class="search-area">
							<input type="text" placeholder="이름, 이메일, 전화번호 검색">
							<button type="button">검색</button>
						</div>

						<table class="user-table">
							<thead>
								<tr>
									<th>사용자</th>
									<th>이메일</th>
									<th>전화번호</th>
									<th>가입일</th>
								</tr>
							</thead>
							<tbody>

								<tr class="user-row" data-name="김철수" data-email="test@test.com"
									data-phone="010-1234-5678" data-date="2023-11-15"
									data-grade="일반회원">
									<td>김철수</td>
									<td>test@test.com</td>
									<td>010-1234-5678</td>
									<td>2023-11-15</td>
								</tr>
								<tr class="user-row" data-name="이영희" data-email="test2@test.com"
									data-phone="010-8375-1562" data-date="2024-01-20"
									data-grade="VIP">
									<td>이영희</td>
									<td>test2@test.com</td>
									<td>010-8375-1562</td>
									<td>2024-01-20</td>
								</tr>
							</tbody>
						</table>
					</div>

					<!-- 오른쪽 -->
					<div class="user-detail" id="userDetail" style="display: none;">
						<div class="profile-image">👤</div>
						<h4 id="detailName"></h4>
						<p id="detailEmail"></p>
						<hr>
						<p>
							📞 <span id="detailPhone"></span>
						</p>
						<p>
							📅 <span id="detailDate"></span>
						</p>
						<p>
							🏷 <span id="detailGrade"></span>
						</p>
						<button class="delete-btn">비밀번호 초기화</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="http://localhost/jsp_prj/manage/js/bootstrap.bundle.min.js"></script>
	<script src="http://localhost/jsp_prj/manage/js/user.js"></script>

	<div class="modal fade" id="resetPasswordModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">비밀번호 초기화</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal">
					</button>
				</div>
				<div class="modal-body">새 비밀번호<br>xxxxxxxxxxxxxxx</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary" id="resetConfirmBtn">
						Confirm</button>
				</div>
			</div>
		</div>
	</div>

</body>

</html>
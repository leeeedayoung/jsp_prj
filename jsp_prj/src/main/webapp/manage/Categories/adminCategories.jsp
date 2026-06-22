<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Categories</title>
<link href="http://localhost/jsp_prj/manage/css/bootstrap.min.css"
	rel="stylesheet">

<link href="http://localhost/jsp_prj/manage/css/dashboard.css"
	rel="stylesheet">

<link href="http://localhost/jsp_prj/manage/css/categories.css"
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
				<li class="active"><a href="../Categories/adminCategories.jsp"> Categories </a></li>
				<li><a href="../order/adminOrder.jsp"> Order </a></li>
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
			<div class="product-wrap">

				<div class="category-header">
					<h4>카테고리</h4>
					<span class="category-count">총 2개</span>
				</div>

				<div class="category-list">

					<div class="category-card">
						<div class="category-left">
							<span>&gt;</span>
							<div class="category-info">
								<span class="category-name">채소</span> <span class="status">활성</span>
								<button class="edit-btn" data-no="1" data-name="채소"
									data-status="Y">✎</button>
							</div>
						</div>
						<div class="product-count">상품 28개</div>
					</div>

					<div class="category-card">
						<div class="category-left">
							<span>&gt;</span>
							<div class="category-info">
								<span class="category-name">과일</span> <span class="status">활성</span>
								<button class="edit-btn" data-no="1" data-name="과일"
									data-status="Y">✎</button>
							</div>
						</div>
						<div class="product-count">상품 28개</div>
					</div>
				</div>
				<button class="add-category-btn" id="addCategoryBtn">＋ 카테고리 추가하기</button>
			</div>

		</div>
	</div>

	<!-- 카테고리 수정 모달 -->
	<div id="editCategoryModal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<h3>카테고리 수정</h3>
				<span id="editCloseBtn" class="close">&times;</span>
			</div>

			<div class="modal-body">
				<input type="hidden" id="editCategoryNo"> <label>카테고리명</label>
				<input type="text" id="editCategoryName"> <label>상태</label>
				<select id="editCategoryStatus">
					<option value="Y">활성</option>
					<option value="N">비활성</option>
				</select>
			</div>

			<div class="modal-footer">
				<button class="cancel-btn" id="editCancelBtn">취소</button>
				<button class="save-btn" id="editSaveBtn">저장</button>
			</div>
		</div>
	</div>

	<!-- 카테고리 추가 모달 -->
	<div id="categoryModal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<h3>새 카테고리 추가</h3>
				<span id="closeModal" class="close">&times;</span>
			</div>

			<div class="modal-body">
				<label>카테고리명</label> <input type="text" id="categoryName" placeholder="카테고리명을 입력하세요">
			</div>

			<div class="modal-footer">
				<button class="cancel-btn" id="cancelBtn">취소</button>
				<button class="save-btn" id="saveBtn">저장</button>
			</div>
		</div>
	</div>
	<script src="http://localhost/jsp_prj/manage/js/categories.js"></script>
</body>

</html>
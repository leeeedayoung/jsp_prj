<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="../login/loginCheck.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users</title>
<link rel="shortcut icon" href="http://localhost/jsp_prj/manage/images/favicon.png"/>
<link href="http://localhost/jsp_prj/manage/css/bootstrap.min.css" rel="stylesheet">
<link href="http://localhost/jsp_prj/manage/css/dashboard.css" rel="stylesheet">
<link href="http://localhost/jsp_prj/manage/css/user.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
    let selectedRow = null;
    $(document).on("click", ".user-row", function(){
        const detail = document.getElementById("userDetail");
        if(selectedRow === this){
            detail.style.display = "none";
            $(this).removeClass("selected");
            selectedRow = null;
            return;
        }
        $(".user-row").removeClass("selected");
        $(this).addClass("selected");
        selectedRow = this;

        detail.style.display = "block";
        $("#detailName").text($(this).data("name"));
        $("#detailEmail").text($(this).data("email"));
        $("#detailPhone").text($(this).data("phone"));
        $("#detailDate").text($(this).data("date"));
        $("#detailGrade").text($(this).data("grade"));
    });

    $(".delete-btn").click(function(){
        new bootstrap.Modal(
            document.getElementById("resetPasswordModal")
        ).show();
    });

    $("#resetConfirmBtn").click(function(){
        resetPassword();
        bootstrap.Modal.getInstance(
            document.getElementById("resetPasswordModal")
        ).hide();
    });

    function resetPassword(){
        console.log("비밀번호 초기화 완료");
    }//resetPassword
});

$(function(){
	function searchUser() {
	    let keyword = $("#searchInput").val().toLowerCase();
	
	    $(".user-row").each(function() {
	        let name = $(this).data("name").toLowerCase();
	        let email = $(this).data("email").toLowerCase();
	        let phone = $(this).data("phone");
	        if (name.includes(keyword) || email.includes(keyword) || phone.includes(keyword)) {
	            $(this).show();
	        } else {
	            $(this).hide();
	        }
	    });
	}//searchUser
	
	// 버튼 검색
	$("#searchBtn").click(function() {
	    searchUser();
	});
	
	// 엔터 검색
	$("#searchInput").on("keypress", function(e) {
	    if (e.key === "Enter") {
	        searchUser();
	    }
	});
	
	$("#sortBtn").click(function() {
	    $("#sortMenu").toggle();
	});
	
	$("#sortMenu li").click(function() {
	    let type = $(this).data("sort");
	    let rows = $(".user-row").get();
	
	    rows.sort(function(a, b) {
	        let aName = $(a).data("name");
	        let bName = $(b).data("name");
	        let aDate = new Date($(a).data("date").replace(/-/g,'/'));
	        let bDate = new Date($(b).data("date").replace(/-/g,'/'));
	
	        switch(type) {
	            case "nameAsc": return aName.localeCompare(bName);
	            case "nameDesc": return bName.localeCompare(aName);
	            case "dateAsc": return aDate - bDate;
	            case "dateDesc": return bDate - aDate;
	        }//end switch
	    });
	    $(".user-table tbody").html(rows);
	    $("#sortMenu").hide();
	});
	
	$(document).click(function(e) {
	    if (!$(e.target).closest(".sort-box").length) {
	        $("#sortMenu").hide();
	    }
	});
});
</script>

</head>

<body>
	<div class="wrapper">

		<!-- 사이드바 -->
		<c:import url="../fragments/sidebar.jsp"></c:import>

		<%-- <%
		ClientService sc=new ClientService();
		List<ClientDTO> clientList=sc.getClientList();
		
		pageContext.setAttribute("clientList", clientList);
		%> --%>

		<!-- 메인 -->
		<div class="main">

			<!-- 헤더 -->
			<div class="top-header">
				<div>
					<h3>Users</h3>
				</div>
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
							<input type="text" id="searchInput" placeholder="이름, 이메일, 전화번호 검색">
							<button type="button" id="searchBtn">검색</button>
							<div class="sort-box">
								<button type="button" id="sortBtn">정렬 ⇔</button>
								<ul id="sortMenu" class="sort-menu">
									<li data-sort="nameAsc">이름 오름차순</li>
									<li data-sort="nameDesc">이름 내림차순</li>
									<li data-sort="dateAsc">가입일 오름차순</li>
									<li data-sort="dateDesc">가입일 내림차순</li>
								</ul>
							</div>
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
	<script src="../js/bootstrap.bundle.min.js"></script>
	<script src="http://localhost/jsp_prj/manage/js/user.js"></script>
</body>

</html>
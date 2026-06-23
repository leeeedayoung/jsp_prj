<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%
Boolean result = (Boolean)request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings</title>
<link href="http://localhost/jsp_prj/manage/css/bootstrap.min.css"
	rel="stylesheet">

<link href="http://localhost/jsp_prj/manage/css/dashboard.css"
	rel="stylesheet">

<link href="http://localhost/jsp_prj/manage/css/settings.css"
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
				<li><a href="dashboard.jsp"> Dashboard </a></li>
				<li><a href="../Products/vieweditProducts.jsp"> Products </a></li>
				<li><a href="../Categories/adminCategories.jsp"> Categories </a></li>
				<li><a href="../order/adminOrder.jsp"> Order </a></li>
				<li><a href="../user/adminUsers.jsp"> Users </a></li>
				<li><a href="../inquiries/adminInquiries.jsp"> Inquiries </a></li>
			</ul>

			<div class="bottom-menu">
				<ul>
					<li class="active"><a href="settings.jsp"> Settings </a></li>
					<li>
						<a href="../login/login.jsp" class="logout">Logout</a>
					</li>
				</ul>
			</div>
		</div>
		
		<%
		AdminService as=new AdminService();
		pageContext.setAttribute("adminData", as.getAdminInfo());
		%>

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

			<!-- 개인정보 -->
			<div class="info">
				<h3>설정</h3>
				<div class="personalInfo">
					<h4>계정정보</h4>
					<table class="info-table">
						<c:forEach var="aDTO" items="${ userData }" varStatus="i">
						<tr>
							<th>이름</th>
							<td><c:out value="${ aDTO.adminName }"/></td>
							<%-- <td><%=admin.getAdminName()%></td> --%>
						</tr>
						<tr>
							<th>아이디</th>
							<td><c:out value="${ aDTO.adminID }"/></td>
							<%-- <td><%=admin.getAdminID()%></td> --%>
						</tr>
						<tr>
							<th>연락처</th>
							<td><c:out value="${ aDTO.adminTel }"/></td>
							<%-- <td><%=admin.getAdminTel()%></td> --%>
						</tr>
						<tr>
							<th>이메일</th>
							<td><c:out value="${ aDTO.adminEmail }"/></td>
							<%-- <td><%=admin.getAdminEmail()%></td> --%>
						</tr>
						</c:forEach>
					</table>

					<button class="password-btn" onclick="openPwModal()">비밀번호
						변경</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 비밀번호 변경 -->
	<div class="pw-modal" id="pwModal">
		<div class="pw-box">

			<h4>비밀번호 변경</h4>

			<label>현재 비밀번호</label> <input type="password" id="pw"> 
			<label>새 비밀번호</label> <input type="password" id="newPw"> 
			<label>새 비밀번호 확인</label> <input type="password" id="checkPw">

			<p id="pwMsg"></p>

			<button style="background-color: #7CB342" onclick="changePw()">확인</button>
			<button onclick="closePwModal()">취소</button>
		</div>
	</div>

	<!-- 성공 팝업 -->
	<div class="success-modal" id="successModal">
		<div class="success-box">
			<h4>알림</h4>
			<p>비밀번호 변경 성공</p>
			<button onclick="successConfirm()">확인</button>
		</div>
	</div>

	<script>
		function openPwModal() {
			document.getElementById("pwModal").style.display = "flex";
		}

		function closePwModal() {
			document.getElementById("pwModal").style.display = "none";

			document.getElementById("pw").value = "";
			document.getElementById("newPw").value = "";
			document.getElementById("checkPw").value = "";

			document.getElementById("pwMsg").innerHTML = "";
		}
		
		function changePw() {
			let pw = document.getElementById("pw").value;
			let newPw = document.getElementById("newPw").value;
			let checkPw = document.getElementById("checkPw").value;

			if (newPw != checkPw) {
				document.getElementById("pwMsg").innerHTML = "새 비밀번호가 일치하지 않습니다.";
				return;
			}
			/* location.href = "changePw.do?pw=" + pw + "&newPw=" + newPw; */
			document.getElementById("successModal")
			.style.display = "flex";
		}

		function successConfirm(){
			location.href="settings.jsp";
		}

	</script>
	<%
	if (result != null) {

		if (result) {
	%>
	<script>
		document.getElementById("successModal").style.display = "flex";
	</script>
	<%
	} else {
	%>
	<script>
		document.getElementById("pwMsg").innerHTML = "현재 비밀번호가 일치하지 않습니다.";
	</script>
	<%
	}
	}
	%>
</body>
</html>

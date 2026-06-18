<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>관리자 설정</title>

<link href="http://localhost/jsp_prj/manage/css/bootstrap.min.css"
	rel="stylesheet">

<link href="http://localhost/jsp_prj/manage/css/dashboard.css"
	rel="stylesheet">

</head>

<body>

	<div class="wrapper">

		<!-- 사이드바 -->

		<div class="sidebar">

			<div class="logo">

				<h3>프레시마켓</h3>

				<p>Admin</p>

			</div>

			<ul>

				<li class="active">
				<a href="dashboard.jsp">
				Dashboard
				</a>
				</li>

				<li>Products</li>

				<li>Categories</li>

				<li>Order</li>

				<li>Users</li>

				<li>Inquiries</li>

			</ul>

			<div class="bottom-menu">

				<ul>
				<li>

				<a href="settings.jsp">
				Settings
				</a>

				</li>

				<li>
				<div class="logout">Logout</div>
				</li>
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

				<div class="update">마지막 업데이트 : </div>

			</div>

			<!-- 카드 -->

			<div class="card-area">

				

			</div>
			
		</div>

	</div>

	

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<script src="http://localhost/jsp_prj/js/dashboard.js"></script>

</body>

</html>
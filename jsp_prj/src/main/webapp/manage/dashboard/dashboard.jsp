<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
String adminId = (String)session.getAttribute("adminId");
if(adminId == null){
    response.sendRedirect("../login/login.jsp");
    return;
}
%>
<%-- <%@ include file="../login/loginCheck.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link rel="shortcut icon" href="http://localhost/jsp_prj/manage/images/favicon.png"/>
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
				<h3>
					프레시마켓 <span>Admin</span>
				</h3>
			</div>

			<ul>
				<li class="active"><a href="dashboard.jsp?id=<%=adminId%>"> Dashboard </a></li>
				<li><a href="../Products/vieweditProducts.jsp"> Products </a></li>
				<li><a href="../Categories/adminCategories.jsp"> Categories
				</a></li>
				<li><a href="../order/adminOrder.jsp"> Order </a></li>
				<li><a href="../user/adminUsers.jsp"> Users </a></li>
				<li><a href="../inquiries/adminInquiries.jsp"> Inquiries </a></li>
			</ul>
			<div class="bottom-menu">
				<ul>
					<li><a href="settings.jsp"> Settings </a></li>
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
				<div class="update">마지막 업데이트 : 14:32</div>
			</div>

			<!-- 카드 -->
			<div class="card-area">
				<div class="info-card">
					<div class="title">연 총 매출</div>
					<div class="value">
						₩<%=request.getAttribute("totalSales")%>
					</div>
				</div>
				<div class="info-card">
					<div class="title">주간 신규 회원 수</div>
					<div class="value">
						<%=request.getAttribute("newClientWeek")%>건
					</div>
				</div>
				<div class="info-card">
					<div class="title">현재 판매 중인 상품</div>
					<div class="value">
						<%=request.getAttribute("nowItemCount")%>개
					</div>
				</div>
				<div class="info-card">
					<div class="title">미답변 문의</div>
					<div class="value">
						<%=request.getAttribute("nonResponseInquiry")%>건
					</div>
				</div>
			</div>

			<!-- 그래프 -->
			<div class="graph-card">
				<h5>회원 등록 수 / 탈퇴 회원 수</h5>
				<canvas id="myChart"></canvas>
			</div>

			<!-- Top5 -->
			<div class="top5-card">
				<h5>베스트 물품 Top5</h5>
				<%
				List<Map<String, Object>> bestProductList = (List<Map<String, Object>>) request.getAttribute("bestProductList");
				if (bestProductList != null) {
					for (int i = 0; i < bestProductList.size(); i++) {
						Map<String, Object> product = bestProductList.get(i);
				%>
				<div class="top-product">
					<div>
						<%=i + 1%>.
						<%=product.get("productName")%>
					</div>

					<div>
						<strong> <%=product.get("orderCount")%>건 →</strong>
					</div>
				</div>
				<%
					}
				}
				%>
			</div>
		</div>
	</div>

	<!-- js에서 사용할 배열 -->
	<script>
		const newClientData = [
	<%int[] newClient = (int[]) request.getAttribute("newClientStatistics");

	if (newClient != null) {
		for (int i = 0; i < newClient.length; i++) {
			out.print(newClient[i]);
			if (i != newClient.length - 1) {
				out.print(",");
			}//end if
		}//end for
	}//end if %>
		];

		const dropOutData = [
	<%int[] dropOut = (int[]) request.getAttribute("dropOutClientStatistics");

	if (dropOut != null) {
		for (int i = 0; i < dropOut.length; i++) {
			out.print(dropOut[i]);
			if (i != dropOut.length - 1) {
				out.print(",");
			}//end if
		}//end for
	}//end if%>
		];
	</script>

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="http://localhost/jsp_prj/manage/js/dashboard.js"></script>
</body>
</html>

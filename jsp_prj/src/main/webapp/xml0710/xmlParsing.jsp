<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../fragments/external_file.jsp"/>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$.ajax({
			url:"member.xml",
			type:"get",
			dataType:"xml",
			error:function(xhr){
				alert(xhr.status);
			},
			success:function(xmlDoc){
				var name=$(xmlDoc).find("name").text();
				var addr=$(xmlDoc).find("addr").text();
				var age=$(xmlDoc).find("age").text();
				
				$("#name").html(name);
				$("#addr").html(addr);
				$("#age").html(age);
			}
		});//ajax
	});//click
	
	$("#btn2").click(function(){
		$.ajax({
			url:"../xml0709/depts2.xml",
			type:"get",
			dataType:"xml",
			error:function(xhr){
				alert(xhr.status);
			},
			success:function(xmlDoc){
				//찾아낸 4개의 dept node를 반복시킨다.
				$(xmlDoc).find("dept").each(function(ind, deptNode){
					$("#tab tbody:last").append("<tr><td>"+(ind+1)
							+"</td><td>"+$(deptNode).find("deptno").text()
							+"</td><td>"+$(deptNode).find("dname").text()
							+"</td><td>"+$(deptNode).find("loc").text()
							+"</td></tr>");
					//검색된 데이터가 없을 때
					if(!$(xmlDoc).find("result")){
						$("#tab tbody:last")
						.append("<tr><td colspan='4'>부서가 존재하지 않습니다.</td></tr>");
					}
				});//end each
			}
		});//ajax		
	});//click
});//ready
</script>
</head>
<body>
<input type="button" value="값 얻기" class="btn btn-primary btn-sm" id="btn"/>
<br>
<div>
회원명 : <span id="name"></span><br>
주소 : <span id="addr"></span><br>
나이 : <span id="age"></span><br>
</div>
<div>
<input type="button" value="부서정보 얻기" class="btn btn-primary btn-sm" id="btn2"/>
<table class="table table-hover" id="tab">
<thead>
<tr>
	<th>번호</th>
	<th>부서번호</th>
	<th>부서명</th>
	<th>위치</th>
</tr>
</thead>
<tbody></tbody>
</table>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>Dog Detail</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<%@ include file="../common/scriptImport.jsp"%>
<script>
$(()=>{
	$('#dogModifyBtn').click(()=>{
		location.href='../dogModify/'+${dog.dogNum};
	});
});
</script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background: #f3f5f9;
}

#leftNav {
	display: flex;
	position: relative;
}

.marker {
	background-color: yellow;
}

#leftNav #sidebar {
	position: fixed;
	width: 200px;
	height: 100%;
	background: #4b4276;
	padding: 20px 0;
}

#leftNav #sidebar h2 {
	color: #fff;
	text-align: center;
	margin-bottom: 30px;
}

#leftNav #sidebar ul li {
	padding: 15px;
	list-style: none;
	border-bottom: 1px solid rgba(0, 0, 0, 0.05);
	border-top: 1px solid rgba(225, 225, 225, 0.05);
}

#leftNav #sidebar ul li a {
	color: #bdb8d7;
	display: black;
}

#leftNav #sidebar ul li a span {
	width: 25px;
}

#leftNav #sidebar ul li:hover {
	background: #594f8d;
}

#leftNav #sidebar ul li:hover a {
	color: #fff;
	text-decoration: none;
}

#leftNav .main_content {
	width: 100%;
	margin-left: 200px;
}

#leftNav .main_content .header {
	padding: 11px;
	background: #fff;
	color: #717171;
	border-bottom: 1px solid #e0e4e8;
}

#leftNav .main_content .header .border {
	font-size: 19px;
}

#leftNav .main_content .header #topButton {
	text-decoration: none;
	margin-top: 4px;
	margin-right: 20px;
	float: right;
}

#leftNav .main_content .header #topButton a {
	text-decoration: none;
}

#leftNav .main_content .info {
	margin: 50px;
	color: #717171;
}

.item {
	width: 640px;
	height: 300px;
	margin: 0 120px 50px 30px;;
	float: left;
}

th {
	background-color: #EFEFEF;
	width: 100px;
	text-align: center;
}

td {
	width: 200px;
	text-align: center;
}

.img {
	float: left;
	width: 500px;
	height: 500px;
	text-align: center;
	padding-top: 30px;
	margin-right: 30px;
	margin-top: 30px;
}

.txt {
	width: 1000px;
	padding-top: 30px;
}
</style>

</head>
<body>
	<div class='wrapper' id='leftNav'>
		<div class='sidebar' id='sidebar'>
			<%@ include file="../common/nav.jsp"%>
		</div>
		<div class='main_content'>
			<div class='header'>
				<strong>&nbsp;&nbsp;ADMINSTRATOR</strong>
				<div id='topButton'>
					<a href='../../common/logoRegist'>????????????</a>&nbsp;|&nbsp; <a
						href='../../common/bannerRegist'>????????????</a>&nbsp;|&nbsp; <a
						href='<c:url value='/'/>'>???????????? ????????????</a>&nbsp;|&nbsp; <a
						href='../../../user/logout'>????????????</a>
				</div>
			</div>
			<div class='info'>
				<!-- info ????????? ?????? ?????????????????? ???????????? ???????????? id ???????????? ??????????????????. ???????????? ?????????????????? ??????????????? ????????????. -->
				<div class='content'>
					<h3>
						<span class='glyphicon glyphicon-heart'></span><strong>
							????????? ?????? > ??????</strong>
					</h3>
					<hr style='border: 1px solid #a0a0a0;'>

					<h4>
						<strong>${dog.dogTitle}</strong>
					</h4>

					<hr>

					<table class='table'>
						<tr>
							<th>??????</th>
							<td>${dog.dogKind}</td>
							<th>??????</th>
							<td>${dog.dogName}</td>
						</tr>
						<tr>
							<th>??????</th>
							<td>${dog.dogGender}</td>
							<th>??????</th>
							<td>${dog.dogAge}</td>
						</tr>
						<tr>
							<th>??????</th>
							<td>${dog.dogWeight}</td>
							<th>????????????</th>
							<td>${dog.dogEntranceDate}</td>
						</tr>
					</table>

					<div style='overflow: hidden'>
						<div class='img'>
							<img src='../../../attach/dog/${dog.attachName}' />
						</div>
					</div>
					<div style='overflow: hidden' class='txt'>${dog.dogContent}</div>

					<br>
					<hr style='border: 1px solid #a0a0a0;'>

					<div style='text-align: right;'>
						<button type='button' class='btn btn-primary' id='dogModifyBtn'>??????</button>
						<button type='button' class='btn btn-default'
							onClick="location.href='../dogListView'">??????</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
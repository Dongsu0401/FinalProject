<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:import url="../common/header.jsp"></c:import>

	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
					<h2>로그인</h2>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->
	<script>
		alert("아이디와 비밀번호를 확인하세요.")
	</script>
	<section class="section overfree">
		<div class="icon-center">
			<i class="fa fa-code"></i>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="contact-details"></div>
				</div>

				<div class="col-md-4">
					<form class="contactform" action="userlogin.ul" method="post">
						<div class="form-group">
							<input type="text" class="form-control" id="id" name="member_Id"
								placeholder="id" required>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="password"
								name="member_Password" placeholder="password" required>
						</div>

						<input type="submit" class="btn btn-transparent" value="로그인" style="background:white;"/>
						<c:url var="upasswordfind" value="userpasswordfind.ul"/>
						<a class="btn btn-transparent" onclick="location.href='${upasswordfind}'">비밀번호찾기</a>
						
					</form>
				</div>
				<!-- end col -->

				<div class="col-md-4"></div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>

	<jsp:include page="../common/footer.jsp" />
		
</body>
</html>
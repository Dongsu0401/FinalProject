<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고서적 판매</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
table td {
	padding: 20px;
}

table th {
	padding: 20px;
}
</style>
</head>

<body>

	<c:import url="../common/header.jsp"></c:import>

	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
					<h2>중고 서적 판매</h2>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->



	<section class="section overfree" style="padding: 30px 0px;">
		<div class="icon-center">
			<i class="fa fa-code"></i>
		</div>
		<div class="container">
			<div class="col-md-12" style="padding-top: 30px;">
				<div style="display:flex;">
					<div>
						<b style="font-size: 30px; margin-left: 60px;">수치해석</b>
					</div>
					<div class="col-md-9"></div>
					<div class="text-right">조회수: 200</div>	
				</div>
				<hr>
				<div class="col-md-3 text-center">
					<img alt="" src="resources/sale_books/수치해석.PNG">
				</div>
				<div class="col-md-9">
					<div style="display: flex;">
						<b>저자 |</b>&nbsp;&nbsp;&nbsp;
						<p>이수진</p>
						&nbsp;&nbsp; <b>출판사 |</b>&nbsp;&nbsp;&nbsp;
						<p>KH도서</p>
						&nbsp;&nbsp; <b>발행날짜 |</b>&nbsp;&nbsp;&nbsp;
						<p>2011-02-15</p>
						&nbsp;&nbsp; <b>장수 |</b>&nbsp;&nbsp;&nbsp;
						<p>215</p>
						&nbsp;&nbsp; <b>ISBN |</b>&nbsp;&nbsp;&nbsp;
						<p>979-11-961065-0-8</p>
						&nbsp;&nbsp;
					</div>
					<div style="display: flex;">
						<div>
							<b>등록자</b>&nbsp;
							<p>이수진</p>
						</div>
						<div style="margin-left: 150px;">
							<b>등록날짜</b>&nbsp;
							<p>2019-11-05</p>
						</div>
					</div>
					<div style="display: flex;">
						<div>
							<b>가격</b>&nbsp;
							<p>22,000원</p>
						</div>
						<div style="margin-left: 140px; margin-top: 20px;">						
							<b>품질등급</b>
							<p>
							(
							<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
							<i class="fa fa-hand-lizard-o" aria-hidden="true"></i>
							<i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
							)
							</p>
						</div>
						<div style="margin-left: 30px;">
							<i class="fa fa-thumbs-o-up fa-5x" aria-hidden="true"></i>
						</div>
					</div>
					<br>
					<table
						style="height: 120px; width: 780px; border: 1px solid lightgray;">
						<tr>
							<th>품질정보</th>
						</tr>
						<tr>
							<td>책 표지 변색 없고 뒷 표지에 약간의 찢어진 흔적이 있습니다. 책 내부에 낙서나 얼룩도 없고 닳은
								흔적도 없습니다.</td>
						</tr>
					</table>
					<br>
				</div>
				<div class="text-center">
					<!-- Large modal -->
					<button type="button" class="btn btn-transparent" style="background-color:white;" data-toggle="modal"
						data-target=".bd-example-modal-lg">구매하기</button>
				</div>



				<!-- Modal -->
				<div class="modal fade bd-example-modal-lg" tabindex="-1"
					role="dialog" aria-labelledby="myLargeModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header" style="background-color: skyblue; border-radius: 4px;">
								<h3 class="modal-title" id="exampleModalLabel" style="color:white;">[주문하기]</h3>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div style="display: flex">
								<div class="modal-body" style="margin-left: 90px; width: 50%">
									<form class="w3-container">
										<p>
											<label>Name</label> <input class="w3-input" type="text">
										</p>
										<p>
											<label>Student ID</label> <input class="w3-input" type="text">
										</p>
										<p>
											<label>Phone</label> <input class="w3-input" type="text">
										</p>
										<p>
											<label>E-mail</label> <input class="w3-input" type="email">
										</p>
									</form>
								</div>
								<div class="modal-body" style="margin-left: 100px;">
									<div>
										<p>결제상품</p>
									</div>
								</div>
							</div>							
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary">주문하기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- end container -->

	</section>
	<!-- end section -->

	<jsp:include page="../common/footer.jsp" />

</body>
</html>
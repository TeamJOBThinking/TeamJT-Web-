<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/folder.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/folder2.css" rel="stylesheet" />


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<style>
img {
	height: 68%;
}

p.views.views-info {
	position: relative;
	left: 100px;
	bottom: 90px;
}

div .col-md-3.resent-grid.recommended-grid.movie-video-grid {
	width: 200px;
	height: 280px;
	max-width: 200px;
	max-height: 280px;
	padding: 0px;
	margin-right: 20px;
	margin-bottom: 20px;
}

.overlay {
	position: absolute;
	bottom: 0;
	margin: 0px;
	background: none;
	border: 1px solid grey;
	color: #f1f1f1;
	transition: .5s ease;
	opacity: 0;
	width: 200px;
	height: 280px;
	max-width: 200px;
	max-height: 280px;
	color: white;
	font-size: 20px;
	padding: 90px;
	text-align: center;
}

div .col-md-3.resent-grid.recommended-grid.movie-video-grid:hover .overlay
	{
	opacity: 1;
}

div .resent-grid-info.recommended-grid-info.recommended-grid-movie-info
	{
	padding-top: 15px;
	padding-right: 10px;
	max-height: 86.5px;
}

.btndeup {
	position: relative;
	height: 20px;
	width: 20px;
	margin: 0px;
	padding: 0px;
	left: 150px;
	bottom: 25px;
	background-color: white;
	background-size: cover;
	border: 1px solid white;
}

.author {
	position: relative;
	bottom: 8px;
}

p.views.views-info {
	margin-right: 10px;
}
</style>


</head>
<body>
	<br />
	<br />
	<br />
	<h4 style="font-weight: bold;">오프라인 강의 관리</h4>
	<br />


	<div>
		<div id=offFolder style="display: inline-block;">
			<c:forEach var="group" items="${groupList }">
				<div class="col-md-3 resent-grid recommended-grid movie-video-grid" style="display: inline-block;">
					<div class="resent-grid-img recommended-grid-img">
						<a href="upload/folderDetail?bno=${group.bno }&lecCategory=${group.lecCategory}">
						 	<c:if test="${not empty group.imgPath}">
								<img src="${pageContext.request.contextPath}/resources/image/tmpFiles/${group.imgPath}"
									alt="">
							</c:if> 
							<c:if test="${empty group.imgPath }">
								<img src="${pageContext.request.contextPath}/resources/img/nullfolder.png" alt="">
							</c:if>
						</a>
						<div class="time small-time show-time movie-time"></div>
						<div class="clck movie-clock"></div>
					</div>
					<div class="resent-grid-info recommended-grid-info recommended-grid-movie-info">
						<h6 style="color: #04B486; font-size: 70%; font-weight: bold;">${group.lecCategory }.</h6>
						<h5 style="font-size: 60%">
							<a href="single.html" class="title">${group.lecName }</a>
						</h5>
						<ul>
							<li><p class="author author-info">
									<a href="#" class="author">${userName}</a>
								</p></li>
							<li class="right-list"><p class="views views-info">${group.lecLike}</p></li>
						</ul>
					</div>
					<a
						href="offline/offFolderDetail?bno=${group.bno }&lecName=${group.lecName}&lecCategory=${group.lecCategory}"
						class="detail">
						<div class="overlay"></div>
					</a>
					<button class="btndeup" id="btnUpdate"
						style="background:url('${pageContext.request.contextPath}/resources/img/update.png');"></button>
					<a href="upload/folderDelete?bno=${group.bno }">
						<button class="btndeup" id="btnDelete"
							style="background:url('${pageContext.request.contextPath}/resources/img/delete.png');"></button>
					</a>
					<div style="display: inline-block; width: 550px;"></div>
				</div>

			</c:forEach>
		</div>
	</div>
	
	<br />
	<br />
	<br />

	<script>

$(function(){
	
	$("#btnFolder2").click(function () {
		
		  var folderName = $('#folderName1').val();
		  var category = $('#category option:selected').val();
		  var id = '${userId}';
		  var name = '${userName}';
		  
		  console.log(folderName);
		  console.log(category);
		  console.log(id)
	});	  
		
	
	$("#offFolder").on('click','.col-md-3.resent-grid.recommended-grid.movie-video-grid .detail', function(){
		event.preventDefault();
		console.log(' offLec folder 들어옴');
		myFunction();
		var location = $(this).attr('href');
		$('#offLec').animate({opacity: 0},1000);
		 $("#offLec").load(encodeURI(location));
		$('#offLec').animate({opacity: 1},1000);		
	});
	
});



</script>


</body>
</html>
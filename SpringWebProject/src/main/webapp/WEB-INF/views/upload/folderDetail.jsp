<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/folder.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/folder2.css" rel="stylesheet" />
<style>
img{
height: 68%;
}



div .col-md-3.resent-grid.recommended-grid.movie-video-grid{
width:200px;
height:280px;
max-width: 200px;
max-height: 280px;
padding: 0px;
margin-right: 20px;
margin-bottom: 20px;
}

#add{
width:200px;
height:280px;
max-width: 200px;
max-height: 280px;

}

.overlay {
  position: absolute; 
  bottom: 0; 
  margin:0px;
  background: none;
  border : 1px solid grey;
  color: #f1f1f1; 
  transition: .5s ease;
  opacity:0;
  width:200px;
height:280px;
max-width: 200px;
max-height: 280px;
  color: white;
  font-size: 20px;
  padding: 90px;
  text-align: center;
}


div .resent-grid-info.recommended-grid-info.recommended-grid-movie-info{
padding-top:15px;
padding-right:10px;
max-height: 86.5px;
}

div .col-md-3.resent-grid.recommended-grid.movie-video-grid:hover .overlay {
  opacity: 1;
}

#addLec:hover #add{
  opacity: 0.8;
}

.author{
position:relative;
bottom: 8px;
}

</style>
</head>
<body>
<br/>
<br/>
<br/>
<h4>${lecName }</h4>
<br/>
<div id = folder style="height: auto; min-height: 500px">
<div class="col-md-3 resent-grid recommended-grid movie-video-grid" id="addLec" style="display: inline-block; margin-left: 170px;">
<c:if test="${not empty onLecList }">
<a id = "addLec" style="display: inline-block; position: relative; bottom: 150px;">
</c:if>
<c:if test="${empty onLecList }">
<a id = "addLec" style="display: inline-block; position: relative; ">
</c:if>
<img alt="" src="${pageContext.request.contextPath}/resources/img/addlec.png" id="add">
</a>
</div>
<c:forEach var="group" items="${onLecList }">

<div class="col-md-3 resent-grid recommended-grid movie-video-grid" style="display: inline-block;">
<div class="resent-grid-img recommended-grid-img">
<a class="detail" href="Video/videoview?videopath=${group.videoPath }&userId=${userId}&groupBno=${group.groupBno}&lecCategory=${group.lecCategory}&title=${group.title}&content=${group.content}&regDate=${group.regDate}&image=${imagePath}" >
<c:if test="${not empty group.imagePath }">
<img alt="" src="${pageContext.request.contextPath}/resources/image/tmpFiles/${group.imagePath}">
</c:if>
</a>
<div class="time small-time show-time movie-time">
</div>
<div class="clck movie-clock">
</div>
</div>
<div class="resent-grid-info recommended-grid-info recommended-grid-movie-info">
<h6 style="color: #04B486; font-size: 70%;font-weight: bold;">${group.lecCategory }.</h6>
<h5 style="font-size: 60%"><a href="single.html" class="title">${group.title }</a></h5>
<ul>
<li><p class="author author-info"><a href="#" class="author">${userName }</a></p></li>
<li class="right-list"><p class="views views-info"></p></li>
</ul>
</div>
<a class="detail" href="videoview?groupBno=${group.groupBno}&bno=${group.bno}&lecName=${lecName}">
<div class="overlay"></div>
<div></div>
</a>
</div>

</c:forEach>
</div>



<script>

$(()=>{
	$('#offLec').css('display','none');
	$('#createFolder1').css('display','none');
	$('#addLec').click(()=>{
		event.preventDefault();
		var bno = '${bno}';
		var category = '${lecCategory}';
		var lecName = '${lecName}';
		 $("#onLec").load(encodeURI("/project/upload/addonlec?bno=" + bno + "&lecCategory=" + category + "&lecName="+ lecName));
		
	});
	$('#loader').css('display', 'none');
	$('#notClick').css('display', 'none');

});

	

</script>

</body>
</html>
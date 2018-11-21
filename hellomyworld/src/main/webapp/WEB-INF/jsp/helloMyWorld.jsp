<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<style>
html,body,h1,h2,h3,h4 {font-family:"Lato", sans-serif}
.mySlides {display:none}
.w3-tag, .fa {cursor:pointer}
.w3-tag {height:15px;width:15px;padding:0;margin-top:6px}
.titleSpan{padding-left:20px};
</style>
</head>
<body>

<nav class="w3-sidenav w3-white w3-card-2 w3-animate-left" style="display:none">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-closenav w3-large w3-hover-red">CLOSE &times;</a>
  <a href="addPhoto" class="w3-large w3-hover-green">ADD PHOTO</a>		
</nav>

<header class="w3-container w3-teal">
  <span class="w3-opennav w3-xlarge" onclick="w3_open()">&#9776;</span>
  <span class="w3-large titleSpan">PHOTO SHOW</span>
 
</header>

<div class="w3-content" style="max-width:100%;margin-top:10px;margin-bottom:20px">

  <div class="w3-container">
	<div class="w3-container w3-dark-grey w3-padding w3-xlarge">
      <div class="w3-left" onclick="plusDivs(-1)"><i class="fa fa-arrow-circle-left w3-hover-text-teal"></i></div>
      <div class="w3-right" onclick="plusDivs(1)"><i class="fa fa-arrow-circle-right w3-hover-text-teal"></i></div>
      <div class="w3-center" id="nav-bar-top">
      </div>
    </div>
	<div id="imgContainer"></div>
	<div class="w3-container w3-dark-grey w3-padding w3-xlarge">
      <div class="w3-left" onclick="plusDivs(-1)"><i class="fa fa-arrow-circle-left w3-hover-text-teal"></i></div>
      <div class="w3-right" onclick="plusDivs(1)"><i class="fa fa-arrow-circle-right w3-hover-text-teal"></i></div>
      <div class="w3-center"  id="nav-bar-bottom">
      </div>
    </div>
  </div>
</div>

<script>
// Slideshow
var fileNameListStr = "${filelist}";
var fileNameList = fileNameListStr.slice(1,fileNameListStr.length-1).split(",");

for(var i=0;i<fileNameList.length;i++){
	$("#imgContainer").append(getImg(fileNameList[i]));
	$("#nav-bar-top").append(getNavSpan(i));
	$("#nav-bar-bottom").append(getNavSpan(i));
}

function getImg(fileName){
	var photo = $("<img>",{style:"width:100%",src: "../img/"+fileName.trim()})
	return $("<div>",{"class": "w3-display-container mySlides"}).append(photo);
}

function getNavSpan(index){
	return $("<span>",{"class": "w3-tag demodots w3-border w3-transparent w3-hover-white"}).click(function(){showPhoto(slideIndex=index+1)});
}

var slideIndex = 1;
showPhoto(slideIndex);

function plusDivs(n) {
	showPhoto(slideIndex += n);
}

function showPhoto(n){
	var photoList = $('.mySlides');
	var dots = $('.demodots');
	
	if (n > photoList.length) {slideIndex = 1} ;  
	if (n < 1) {slideIndex = photoList.length} ;
	
	for(var i=0;i<photoList.length;i++){
		$(photoList[i]).hide();
	}
	for(var i=0;i<dots.length;i++){
		$(dots[i]).removeClass("w3-white");
	}
	$(photoList[slideIndex-1]).show();
	$(dots[slideIndex-1]).addClass("w3-white");
	$(dots[slideIndex+photoList.length-1]).addClass("w3-white");
}

function currentDiv(n) {
	showPhoto(slideIndex = n);
}

function w3_open() {
    $(".w3-sidenav").show();
}
function w3_close() {
	 $(".w3-sidenav").hide();
}
</script>

</body>
</html>

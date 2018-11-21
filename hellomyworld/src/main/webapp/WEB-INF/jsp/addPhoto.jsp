<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>崖江照--添加照片</title>
</head>
<link rel="stylesheet" href="../css/w3.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<style>
.message{
	color: red;
	font-size: 20px;
}
.fileUploadHidden{
	display: none;
}

</style>
<body>

<nav class="w3-sidenav w3-white w3-card-2 w3-animate-left" style="display:none">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-closenav w3-large w3-hover-red">CLOSE &times;</a>
  <a href="helloWorld" class="w3-large w3-hover-green">PHOTO SHOW</a>		
</nav>

<header class="w3-container w3-teal">
  <span class="w3-opennav w3-xlarge" onclick="w3_open()">&#9776;</span>
  <span class="w3-large titleSpan">ADD PHOTO</span>
</header>
	
<div class="w3-modal-content w3-padding-48">
	<form action="actionAdd" method="post" enctype="multipart/form-data" id="form" onsubmit="return validate()">
		<input type="text" id="fileName" name="name" readonly />
		<input type="button" id="chooseButton" name ="choose" value="choose pic" class="w3-btn w3-green" />
		<input type="file" id="fileUpload" name="file" class="fileUploadHidden"/>
		<input type="submit" id="submit" class="w3-btn w3-green"/>
	</form>
	<div id="message" class="message"></div>
</div>

	
</body>
<script>
var message = "${message}";
if(message){
	$("#message").html(message);
}
$(function(){
	$("#chooseButton").click(function(){
		$("#fileUpload").click();
	})
	$("#fileUpload").change(function(){
		$("#fileName").val($("#fileUpload")[0].files[0].name);
	})
})

function validate(){
	var filename = $("#fileName").val();
	if(filename==""){
		$("#message").html("What do you expect me to upload if you do not choose a photo?");
		return false;
	}
	if(fileNameValid(filename)){
		return true;
	}else{
		$("#message").html("Please choose photo with suffix .jpg or .png or gif and file name length limited to 40 character");
		return false;
	}
}
function fileNameValid(filename){
	var typeValid = (filename.lastIndexOf(".jpg")+4)== filename.length || (filename.lastIndexOf(".png")+4)==filename.length || (filename.lastIndexOf(".gif")+4)==filename.length;
	var lengthValid = filename.length <=40;
	return typeValid && lengthValid;
}

function w3_open() {
    $(".w3-sidenav").show();
}
function w3_close() {
	 $(".w3-sidenav").hide();
}
</script>
</html>
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
<input type="button" class="button" value="back to photo list" id="back"/>
	<div class="w3-modal-content" style="float:right">
		<form action="actionAdd" method="post" enctype="multipart/form-data" id="form" onsubmit="return validate()">
			<input type="text" id="fileName" name="name" readonly />
			<input type="button" id="chooseButton" name ="choose" value="choose pic" class="button" />
			<input type="file" id="fileUpload" name="file" class="fileUploadHidden"/>
			<input type="submit" id="submit" class="button"/>
		</form>
	</div>
	<div id="message" class="message"></div>
	
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
	$("#back").click(function(){
		window.location.href="helloWorld";
	})
})

function validate(){
	var filename = $("#fileName").val();
	if(filename==""){
		$("#message").html("What do you expect me to upload if you do not choose a photo?");
		return false;
	}
	
	var validated = (filename.indexOf(".jpg")+4)== filename.length || (filename.indexOf(".png")+4)==filename.length;
	if(validated){
		return true;
	}else{
		$("#message").html("Please choose photo with suffix .jpg or .png");
		return false;
	}
}
</script>
</html>
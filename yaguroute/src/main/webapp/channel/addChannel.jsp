<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>addChannel Page</h1>
	
	<form name="detailForm" class="form-horizontal">
		
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>채널 아이디</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					${channel.channelID}
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>채널 이름</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					${channel.channelName}
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>녹화본 경로</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					${channel.bucketName} / ${channel.uploadPath}
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>스트림키</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					${channel.streamKey}
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>스트림 URL</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					${channel.streamURL}
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>스트리밍 주소</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					${channel.channelCDN}
				</div>
			</div>
		</form>
</body>
</html>
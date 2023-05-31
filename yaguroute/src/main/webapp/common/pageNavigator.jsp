<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	

	<% System.out.println("pageNavigator "+ request.getAttribute("pageType")); %>


	
	<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
			◀ 이전
	</c:if>
	<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
		<a href="
			
			<c:choose>
			
				<c:when test= "${pageType eq 'users' }">
					javascript:fncGetUserList
				</c:when>
				<c:otherwise>
					javascript:fncGetProductList
				</c:otherwise>
			</c:choose>
						
					('${ resultPage.currentPage-1}')">◀ 이전</a>
	</c:if>
	
	<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
		<a href="
		
			<c:choose>
			
				<c:when test= "${pageType eq 'users'}">
					javascript:fncGetUserList
				</c:when>
				<c:otherwise>
					javascript:fncGetProductList
				</c:otherwise>
			</c:choose>
						
		('${ i }');">${ i }</a>
	</c:forEach>
	
	<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
			이후 ▶
	</c:if>
	<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
			<a href="
			
			<c:choose>
			
				<c:when test= "${pageType eq 'users' }">
					javascript:fncGetUserList
				</c:when>
				<c:otherwise>
					javascript:fncGetProductList
				</c:otherwise>
			</c:choose>
			
			('${resultPage.endUnitPage+1}')">이후 ▶</a>
	</c:if>
	

	
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<div class="pagination-wrap">
		 
		  <!-- 크기조절 :  pagination-lg pagination-sm-->
		  <ul class="pagination" >
		    
		    <!--  <<== 좌측 nav -->
		  	<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		 		<li><a href="#"><i class="fa fa-chevron-left" aria-hidden="true"></i></a></li>
			</c:if>
			<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
				<li>
					<c:if test="${param.id == 'user'}">
				      <a href="javascript:fncGetUserList('${ resultPage.currentPage-1}')">
			      </c:if>
					<c:if test="${param.id == 'post'}">
					  <a href="javascript:fncGetPostList('${ resultPage.currentPage-1}')">
					</c:if>
					<c:if test="${param.id == 'product'}">
					  <a href="javascript:fncGetProductList('${ resultPage.currentPage-1}')">
					</c:if>
					<c:if test="${param.id == 'salesProd'}">
					  <a href="javascript:fncGetSalesProdList('${ resultPage.currentPage-1}')">
					</c:if>
						<c:if test="${param.id == 'transaction'}">
					  <a href="javascript:fncGetTransactionList('${ resultPage.currentPage-1}')">
					</c:if>
					<c:if test="${param.id == 'dlvyTran'}">
					  <a href="javascript:fncGetDlvyTranList('${ resultPage.currentPage-1}')">
					</c:if>
					
			    	<c:if test="${param.id == 'player'}">
					  <a href="javascript:fncGetPlayerList('${ resultPage.currentPage-1}')">
					</c:if>
					<i class="fa fa-chevron-left" aria-hidden="true"></i></a>
				</li>
		   </c:if> 
		    <!--  중앙  -->
			<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
				
				<c:if test="${ resultPage.currentPage == i }">
					<!--  현재 page 가르킬경우 : active -->
				    <li class="active">
				    	<c:if test="${param.id == 'user'}">
				    		<a href="javascript:fncGetUserList('${ i }');">${ i }<span class="sr-only">(current)</span></a>
				    	</c:if>
				    	<c:if test="${param.id == 'post'}">
				    		<a href="javascript:fncGetPostList('${ i }');">${ i }<span class="sr-only">(current)</span></a>
				    	</c:if>
				    	
						<c:if test="${param.id == 'product'}">
				    		<a href="javascript:fncGetProductList('${ i }');">${ i }<span class="sr-only">(current)</span></a>
				    	</c:if>
				    	<c:if test="${param.id == 'salesProd'}">
				    		<a href="javascript:fncGetSalesProdList('${ i }');">${ i }<span class="sr-only">(current)</span></a>
				    	</c:if>
				    	<c:if test="${param.id == 'transaction'}">
				    		<a href="javascript:fncGetTransactionList('${ i }');">${ i }<span class="sr-only">(current)</span></a>
				    	</c:if>
				    	<c:if test="${param.id == 'dlvyTran'}">
				    		<a href="javascript:fncGetDlvyTranList'${ i }');">${ i }<span class="sr-only">(current)</span></a>
				    	</c:if>
				    	
				    	<c:if test="${param.id == 'player'}">
				    		<a href="javascript:fncGetPlayerList('${ i }');">${ i }<span class="sr-only">(current)</span></a>
				    	</c:if>
				    	
				    </li>
				</c:if>	
				
				<c:if test="${ resultPage.currentPage != i}">	
					<li>
						<c:if test="${param.id == 'user'}">
							<a href="javascript:fncGetUserList('${ i }');">${ i }</a>
						</c:if>
						<c:if test="${param.id == 'post'}">
							<a href="javascript:fncGetPostList('${ i }');">${ i }</a>
						</c:if>
						<c:if test="${param.id == 'product'}">
							<a href="javascript:fncGetProductList('${ i }');">${ i }</a>
						</c:if>
						<c:if test="${param.id == 'salesProd'}">
							<a href="javascript:fncGetSalesProdList('${ i }');">${ i }</a>
						</c:if>
							<c:if test="${param.id == 'transaction'}">
							<a href="javascript:fncGetTransactionList('${ i }');">${ i }</a>
						</c:if>
						<c:if test="${param.id == 'dlvyTran'}">
							<a href="javascript:fncGetDlvyTranList('${ i }');">${ i }</a>
						</c:if>
						
						<c:if test="${param.id == 'player'}">
							<a href="javascript:fncGetPlayerList('${ i }');">${ i }</a>
						</c:if>
					</li>
				</c:if>
			</c:forEach>
		    
	     <!--  우측 nav==>> -->
	     <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
	  			<li><a href="#"><i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
			</c:if>
			<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<li>
			      <c:if test="${param.id == 'user'}">
			      	<a href="javascript:fncGetUserList('${resultPage.endUnitPage+1}')">
			      </c:if>  
			      <c:if test="${param.id == 'post'}">
			        <a href="javascript:fncGetPostList('${resultPage.endUnitPage+1}')" >
			      </c:if>
			      <c:if test="${param.id == 'product'}">
			        <a href="javascript:fncGetProductList('${resultPage.endUnitPage+1}')">
			      </c:if>
			      <c:if test="${param.id == 'salesProd'}">
			        <a href="javascript:fncGetSalesProdList('${resultPage.endUnitPage+1}')">
			      </c:if>
			      <c:if test="${param.id == 'Transaction'}">
			        <a href="javascript:fncGetTransactionList('${resultPage.endUnitPage+1}')">
			      </c:if>
			      <c:if test="${param.id == 'dlvyTran'}">
			        <a href="javascript:fncGetDlvyTranList('${resultPage.endUnitPage+1}')">
			      </c:if>
			      
			      <c:if test="${param.id == 'player'}">
			        <a href="javascript:fncGetPlayerList('${resultPage.endUnitPage+1}')">
			      </c:if>
			    <i class="fa fa-chevron-left" aria-hidden="true"></i></a>
				</li>
		    </c:if>
		  </ul>
		
</div>

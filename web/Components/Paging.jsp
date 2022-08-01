<%-- 
    Document   : Paging
    Created on : Jun 6, 2022, 10:24:10 AM
    Author     : Pham Minh Giang
--%>
<style>
    .active{
        background-color: gray;
        color: red;
    }
</style>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="clearfix">
    <ul class="pagination">
        <c:if test="${requestScope.index>1}">
            <li class="page-item"><a href="product?index=${index-1}" class="page-link">Previous</a></li>
        </c:if>
        <c:forEach begin="1" end="${requestScope.page}" var="i">
            <li class="page-item" class="${i==index?"active":""}"><a href="product?index=${i}" class="page-link">${i}</a></li>
        </c:forEach>
        <c:if test="${requestScope.index < requestScope.page}">
            <li class="page-item"><a href="product?index=${index+1}" class="page-link">Next</a></li>
        </c:if>
    </ul>
</div>

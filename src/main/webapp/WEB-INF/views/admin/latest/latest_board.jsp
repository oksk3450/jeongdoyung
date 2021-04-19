<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:if test="${fn:length(latest_list) == 0}">
<tr><td colspan="4" class="text-center">조회된 값이 없습니다.</td></tr>
</c:if>
<c:forEach items="${latest_list}" var="latestVO">
<tr>
  <td><a href="/admin/board/board_view?page=1&board_type=${latestVO.board_type}&bno=${latestVO.bno}">${latestVO.title}</a></td>
  <td>${latestVO.writer}</td>
  <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${latestVO.reg_date}" /></td>
  <td><span class="badge badge-success">
  <c:if test="${ empty latestVO.view_count }">
  0
  </c:if>
  <c:if test="${ not empty latestVO.view_count }">
  ${latestVO.view_count}
  </c:if>
  </span></td>
</tr>
</c:forEach>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal" var="principal" />
<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
<aside id="colorlib-aside" role="complementary"
	class="js-fullheight text-center">
	<h1 id="colorlib-logo">
		<a href="${pageContext.request.contextPath }/blog/01/rest4TripBlog?id=${blog.blogId}">${blog.blogName }<span>.</span></a>
	</h1>
	<nav id="colorlib-main-menu" role="navigation">
		<ul>
			<li><a href="${pageContext.request.contextPath }/blog/01/rest4TripBlog?id=${blog.blogId}">Home</a></li>
			<c:forEach var="category" items="${blog.category }">
				<li><a href="${pageContext.request.contextPath }/blog/01/blogCategoryList?id=${blog.blogId }&cate=${category.bcateNum}">${category.bcateName }</a></li>
			</c:forEach>
			<c:if test="${blog.blogId eq principal.realUser.accId }">
				<li><a href="${pageContext.request.contextPath }/blogSet/setting?id=${blog.blogId}">Setting</a></li>
			</c:if>
		</ul>
	</nav>
</aside>
<!--END COLORLIB-ASIDE -->
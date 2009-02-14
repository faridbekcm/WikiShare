<%@ include file="include.jsp" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="html_head.jsp" %>

<!-- TinyMCE -->
<script type="text/javascript" src="/WikiShare/public/wiki/js/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
	tinyMCE.init({
		mode : "textareas",
		theme : "advanced",
		elements : "content",
		relative_urls : false
	});
</script>
<!-- /TinyMCE -->

<% String formSubmitText = "Create"; %>


<form:form method="post" commandName="wikipage">
<c:set var="wikipageId" value="${wikipage.id}"></c:set>
<% 
	if( request.getParameter("action") != null && 
			request.getParameter("action").equals("update") ) { 
		formSubmitText = "Update";	
%>
		<input type="hidden" name="action" value="update"/>
<% } %>
	
	<div class="left_col">
	   <form:input path="title" size="80" cssClass="page_title" /></div>
	   <br/>
	   <form:textarea path="content" id="content" cols="80" rows="20" />
		<!--  <form:errors path="title" />-->
	</div>
		
	<div class="right_col">
	   <form:checkbox path="frontPage"/> Show on Frontpage
	   <%
	    if( request.getParameter("action") != null && 
				request.getParameter("action").equals("update") ) {
	   %>
		<br/>
		<form:checkbox path="skipNewVersionFlag"/> Override current version
	   <% } %>
	   <br/>
	   <a href="#" onclick="document.getElementById( 'wikipage' ).submit(); return;"><%= formSubmitText %></a>
	   <br/>
	   <a href="<%= W_PREFIX %>wikipage/${wikipageId}" title="Cancel">Cancel</a>
    </div>
</form:form>
<div style="clear:both;">&nbsp;</div>

<%@ include file="html_footer.jsp" %>
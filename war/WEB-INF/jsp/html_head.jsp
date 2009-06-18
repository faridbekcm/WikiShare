<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="com.amb.wikishare.domain.User"%>
<%@page import="com.amb.wikishare.helper.WikiShareHelper"%>
<%@page import="com.amb.wikishare.service.UserService"%>
<%
  // Remote user representaion
  User USER = UserService.getSessionUser(request);

  // Application context parameter, something like /WikiShare/wiki/
  String W_PREFIX = request.getContextPath() +
     getServletContext().getInitParameter("webappPrefix");

  // Search text parameter
  String searchText = request.getParameter("search_text");
  if( searchText == null) {
    searchText = "";
  }
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title><fmt:message key="webapp" /></title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="description" content="WikiShare 0.1" />
  <meta name="author" content="Adam Musial-Bright" />
  <link href="<%= request.getContextPath() %>/public/wiki/css/wikishare.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="/WikiShare/public/wiki/js/prototype.js"></script>
  <script type="text/javascript" src="/WikiShare/public/wiki/js/scriptaculous/scriptaculous.js"></script>
  <script type="text/javascript" src="/WikiShare/public/wiki/js/text.js"></script>
</head>

<body>
<div id="container">

  <div id="header">

      <div id="pageHeader">
          <h1><span>WikiShare</span></h1>
          <h2>
            2009 by Adam Musial-Bright
          </h2>
      </div>

      <div id="infoBox">
        <p class="p1">
          <a href="<%= W_PREFIX %>frontpage">Frontpage</a>
          <% if(USER != null) {  %>
            | <a href="<%= W_PREFIX %>wikipage_create">New Page</a> |
            <a href="<%= W_PREFIX %>wikipages">Wikipages</a> |
            <a href="<%= W_PREFIX %>files">Files</a> |
            <a href="<%= W_PREFIX %>users">Users</a>
            &nbsp;&nbsp;&nbsp; <a style="padding:0;" href="<%= W_PREFIX %>frontpage?action=logout">logout</a>
            <%= USER.getUsername() %>
          <% } %>
        </p>
        <% if(USER != null) {  %>
        <p class="p2">
            <form class="search_form" action="<%= W_PREFIX %>search" method="get">
                <input type="text" id="search_text" name="search_text" value="<%= searchText %>" autocomplete="off"/>
            </form>
            <div id="ajax_search_indicator" style="display:none;position:absolute;left:500px;">Searching ...</div>
            <div id="ajax_search_result_box" style="display:none;border:1px solid black;background-color:white;position:absolute;left:500px;width:300px !important;z-index:2;"></div>
            <script type="text/javascript" language="javascript" charset="utf-8">
              // <![CDATA[
                new Ajax.Autocompleter('search_text','ajax_search_result_box','<%= W_PREFIX %>ajax_search',
                    {tokens: ',', indicator: 'ajax_search_indicator', select:'selectme'} );
              // ]]>
            </script>
        </p>
        <% } %>
      </div>

  </div>
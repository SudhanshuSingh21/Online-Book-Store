<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<style>
h2{color:whitesmoke;font:700 20pt arial;
padding:10px;
text-align: center;
text-transform:uppercase;}
h4 {color:brwon;font:700 11pt verdana}
td {font:10pt verdana}
a {font:12pt verdana;color:whitesmoke;}
body{
background: url("https://images.unsplash.com/photo-1604742496374-8aba83957a9b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80");
background-repeat:no-repeat;
background-size:cover;
color:whitesmoke;}
table{
border-spacing:10px;}


</style>

<body bgcolor="beige">

<h2>Browse Available Books</h2>
<hr>
<form action="browsebooks.jsp" method="post" >
Select Category : 
<select name="cat">
<option value="all">All Categories
<option value="oracle">Oracle
<option value="novel">Novel
<option value=".net">.NET 
<option value="java">Java 
</select>
<input type=submit value="Browse">
<br>
<br>
<a class="button" href="querybooks.jsp">Query Books </a> &nbsp;&nbsp;<br><br><a class="button" href="gohome.jsp">Home </a>

</form>

<%
 String cat = request.getParameter("cat");
 if ( cat == null)
    request.setAttribute("cond","1=1");
else
  if (!cat.equals("all") )
   request.setAttribute("cond", "cat='" + cat + "'");

%>
 
<jsp:include  page="listbooks.jsp" flush="true"/>


</body>
</html>   
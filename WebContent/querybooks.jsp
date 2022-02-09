<html>

<style>
*{
margin:0;padding:0}
h2{color:whitesmoke;font:700 25pt arial;padding:16px;text-align:center;text-transform:uppercase;}
h4 {color:brwon;font:700 11pt verdana}
td {font:700 10pt arial}
a {font:700 10pt arial;color:whitesmoke;}
div{
padding:20px 0px;
}
div a{
font-size:15px;}
body{
background: url("https://images.unsplash.com/photo-1604742496374-8aba83957a9b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80");
background-repeat:no-repeat;
background-size:cover;
color:whitesmoke;
padding-left:17px;}
table tr td{
font-size:17px;
}
table{border-spacing:5px;}
table tr td{
padding:8px;
font:700 15pt arial;}

</style>

<body>

<h2>Search books</h2>
<hr>
<form action="querybooks.jsp" method="post" >
<table>
	<tr>
		<td>Category
		<select name="cat">
			<option value="all">All Categories
			<option value="novel">Novel
			<option value="oracle">Oracle
			<option value=".net">.NET 
			<option value="java">Java 
		</select>
		
	</tr>
	<tr><td>Title Contains <input type=text name=title size=20></tr>
	<tr>
		<td>
		Author Name Contains
		<input type=text size=20 name=author>
	</tr>
	<tr>
		<td>Price From
		<input type=text name=fromprice size=10>
		To
		<input type=text name=toprice size=10>
	</tr>
</table>
<br>
<input class="queryy" type=submit value="Query">
<br>
<div><a href="gohome.jsp">Home Page </a></div>


</form>

<%
 String cat = request.getParameter("cat");
 if ( cat == null)
  return;

 String cond = "1=1";

 if (!cat.equals("all") )
     cond = cond + " and cat = '" + cat + "'";

 String title = request.getParameter("title");

 if ( !title.equals(""))
    cond = cond + " and title like '%" + title + "%'";


 String author = request.getParameter("author");

 if ( !author.equals(""))
    cond = cond + " and author like '%" + author + "%'";


 String fromprice = request.getParameter("fromprice");

 if ( !fromprice.equals(""))
    cond = cond + " and price >= " + fromprice;

 String toprice = request.getParameter("toprice");

 if ( !toprice.equals(""))
    cond = cond + " and price <= " + toprice;

 request.setAttribute("cond", cond);

%>
 
<jsp:include  page="listbooks.jsp" flush="true"/>

</body>
</html>   
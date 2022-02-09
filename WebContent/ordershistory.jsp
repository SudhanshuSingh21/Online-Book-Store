<jsp:useBean id="user"  scope="session"  class="obs.User"/>
<%@page import="java.sql.*"%>

<html>
<style>
h1{
text-align:center;
text-transform:uppercase;}
a.topic {font:700 11pt arial;color:whitesmoke}
td {font:10pt verdana}
th {font:700 10pt arial;color:whitesmoke}
body{
background: url("https://images.unsplash.com/photo-1604742496374-8aba83957a9b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80");
background-repeat:no-repeat;
background-size:cover;
color:whitesmoke;}
table tr th{
font:700 15pt arial;
padding:10px;}
</style>

<body>
<h1>Order History </h1>
<hr>


<%
  String type = request.getParameter("type");
  String  cmd = "select ordid, orddate, userid,totamt,status,isbn from orders where userid = " + user.getUserid();
   
  if ( type != null)
  {

  if ( type.equals("n"))
     cmd += " and status = 'n'";
  else
    if ( type.equals("p"))
      cmd += " and status = 'p'";
  else
    if ( type.equals("d"))
      cmd += " and status = 'd'";
    else
      if ( type.equals("c"))
         cmd +=  " and status = 'c'";

  }

  
  Connection con = user.getConnection();
  Statement st = con.createStatement();

  ResultSet rs = st.executeQuery(cmd);

%>

<p>


<table width="100%" cellpadding=2 border=1>
<tr>
<th> Order Id
<th> Order Date
<th> Total Amount
<th> Status
</tr>

<%
   while ( rs.next())
   {
%>

<tr>
<td> <a href="orderitems.jsp?ordid=<%=rs.getInt(1)%>&status=<%=rs.getString(5)%>"> <%=rs.getInt(1)%> </a>
<td> <%= rs.getString(2)%>
<td> <%= rs.getInt(3)%>
<td> <%= rs.getString(4)%>
</tr>

<%
  }

  rs.close();
  st.close();
  con.close();

%>

  
</table>
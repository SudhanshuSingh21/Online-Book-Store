
<jsp:useBean id="user" scope="session"  class="obs.User" />
<jsp:useBean id="cart" scope="session"  class="obs.Cart" />


<%@ page import="java.util.*"%>

<style>
*{
margin:0;
padding:0;}
td {font:10pt arial}
th {font:700 10pt arial}
h2 {font:700 16pt arial}
a {font:700 10pt arial;color:whitesmoke;padding:2px;}
body{
background: url("https://images.unsplash.com/photo-1604742496374-8aba83957a9b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80");
background-repeat:no-repeat;
background-size:cover;
color:whitesmoke;
padding:10px;}
.div1{
font:700 29pt arial;
color:whitesmoke;
padding-top:16px;}
.div2{
font:700 20pt arial;
padding-top:16px;
padding-bottom:10px;
color:whitesmoke;}
.top{
font:21pt arial;
padding:10px 0px;}
.buttons{
margin:15px;padding:3px;}
table{
border-spacing:3px;}
table tr th{
padding:10px;
font:700 20pt arial;}
table tr td{
padding:10px;
font: 700 13pt arial;}
</style>

<%
  
%>



<html>
<body>
<div class="div1">Welcome <b><jsp:getProperty name="user" property="uname"/> </b> </div>
<div class="div2">Shopping Cart</div>



<form action="home.jsp" method="get">
		<table class="table2" border=1" width="100%">  
			<tr>
				<th>Book Title
				<th>Price
				<th>Quantity
				<th>Amount
				<th>&nbsp;
			</tr>

			<%
			 obs.Item item;
			 
			 ArrayList items = cart.getItems();
			 Iterator  itr = items.iterator();
			 int total = 0;
			
			 while (  itr.hasNext())
			 {
			    item = (obs.Item) itr.next();
			    total += item.getQty() * item.getPrice();
			%>

			<tr>
				<td>
				<input type=hidden value=<%=item.getIsbn()%> name=isbn>
				<%= item.getTitle()%>
				<td align="right"><%= item.getPrice()%>
				<td align="center"><input type=text name=qty  size=5 value=<%=item.getQty()%>>
				<td align="right"><%=item.getQty() * item.getPrice()%>
				<td align="center"><a href=home.jsp?act=remove&isbn=<%=item.getIsbn()%>>Remove</a>
			</tr>

			<%
			 }
			 String act = request.getParameter("act");
				
			 if ( act != null )
			 {
			  if( act.equals("Finalize Order"))
			  {
			    boolean orderid;
			    String isb[] = (String []) request.getParameterValues("isbn");
			   	
			     orderid =  cart.finalizeOrder(user.getUserid(),total );
			     if ( orderid == false)
			     {
			    	 //out.println(item.getIsbn());
			   	  out.println("Sorry! Order Cannot be finalized.");
			        return;
			     }
			     else
			     {
			        out.println("Order Has Been Finalized. Order id : " + orderid );
			        //out.println(isb);
			        out.println("<a href=home.jsp>Continue...</a>");
			        cart.clearAll();
			        return;
			     }
			
			      
			  }   
			
			  if ( act.equals("remove"))
			  {
			   cart.removeItem( request.getParameter("isbn"));
			  }
			  else 
			   if ( act.equals("Update Cart"))
			   {
			 
			     String isbn[] = (String []) request.getParameterValues("isbn");
			     String qty[] = (String []) request.getParameterValues("qty");
			
			     for (int i = 0 ;i < isbn.length ;i ++)
			        cart.updateQty(isbn[i], Integer.parseInt( qty[i]));
			
			   }
			   else
			    if ( act.equals("Clear Cart"))
			         cart.clearAll();
			  } // end of outer if
			
			
			%>
			<tr>
			<td colspan=5 style="text-align:center;font:700 12pt arial;color:whitesmoke">
			Total Amount : <%=total%>
			</tr>


	</table>


<input class="buttons" style="margin-left:0px;" type=submit value="Update Cart"  name="act">

<input class="buttons" type=submit value="Clear Cart"  name="act">

<input class="buttons" type=submit value="Finalize Order"  name="act">

</form>
  

<tr>
<td>
[<a href="changeprofile.jsp">Change User Details</a>] &nbsp;&nbsp;
[<a href="browsebooks.jsp">Browse Books</a>] &nbsp;&nbsp;
[<a href="querybooks.jsp">Query Books</a>] &nbsp;&nbsp;
[<a href="ordershistory.jsp" target="_main">Orders History</a>] &nbsp;&nbsp;
[<a href=logout.jsp> Logout </a>]
</td>
</tr>


</body>
</html>

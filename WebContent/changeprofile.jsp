<jsp:useBean id="user"  scope="session"  class="obs.User"/>

<jsp:setProperty name="user" property="*" />

<%
   if (!user.isLogged())
      response.sendRedirect("Login.html");

%>

<html>
<style>
h2{color:bottlegreen;font:700 16pt arial}
h3{color:whitesmoke;font:700 12pt arial}
td {font:10pt verdana}
a {font:10pt verdana;color:bottlegreen}
body{
background: url("https://images.unsplash.com/photo-1604742496374-8aba83957a9b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80");
background-repeat:no-repeat;
background-size:cover;
color:whitesmoke;}
.homepg{
color:whitesmoke;}
.changeprofile{
margin: auto;
  width: 30%;
  height:92vh;
  border: 3px solid whitesmoke;
  float:left;
  padding: 10px;}

</style>

<body>
<div class=changeprofile>
<h2>Change Profile </h2>
<form action="changeprofile.jsp" method="post">
<h3>Personal Details </h3>
<table>
<tr>
<td>
Email Address
<td>
<input type=text name=email size=30 value=<%=user.getEmail()%>>
</tr>

<tr>
<td>Mailing Address
<td>
<textarea name="address" rows=3 cols=30><%=user.getAddress()%></textarea>
</td>
</tr>

<tr>
<td>
Phone Number
<td>
<input type=text  name=phone  size=30 value='<%=user.getPhone()%>'>
</tr>
</table>

<h3>Password </h3>

<table>
<tr>
<td>
New Password
<td>
<input type=password name=pwd size=20>
</tr>
<tr>
<td>
Confirm Password
<td>
<input type=password name=pwd2 size=20>
</tr>

</table>

<p>


<input type=submit value="Update Profile">
<input type=reset value="Reset"> <a class="homepg" href="home.jsp">Home Page</a>
</form>
<%
  // do it if any invoked by itself
  if ( request.getParameter("email") == null)
    return;

  String res = user.updateProfile( request.getParameter("pwd") );
    
  if ( res == null)
      out.println("Profile Updated Successfully.");
  else
      out.println("Error : " + res);
 
  out.println("Click <a href=home.jsp>here</a> to continue...");  

%>

</div>
</body>
</html>   
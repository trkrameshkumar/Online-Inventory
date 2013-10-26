<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home || Online Inventory</title>
	<link href="css/bootstrap.css" rel="stylesheet">
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
    <script>
	$(function(){
	$('.dropdown-toggle').dropdown()
	});
	</script>
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->
</head>
<%@page import="java.sql.*"%>
<%
String submit=null;
submit=request.getParameter("submit");
if(submit!=null)
{
	
String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");
try{
	Connection con=null;		//Create Connection Object
	PreparedStatement pst=null;
	ResultSet result=null;	
		//Create ResultSet Object
	try{						//try block begins
	Class.forName("com.mysql.jdbc.Driver");//Pass the Drive class name(ex.Mysql) in parameter of Class.forName
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/msme","root","root");
	pst=con.prepareStatement("select * from user_login where username='"+uname+"' and password='"+pwd+"'");
	result=pst.executeQuery();
	if(result.next()){
	  session.setAttribute("user", uname);
		response.sendRedirect("listitem.jsp");
	}
	else
		response.sendRedirect("index.jsp");
		
	}
	catch(ClassNotFoundException e){
		out.println("<b>Driver Class not found Exception: </b>"+e.getMessage());
		
	}
	catch(SQLException e){
		out.println("<b>SQL EXception:</b>"+e.getMessage());
	}
	finally{
		try{
	if(con!=null)
		con.close();
		}
		catch(SQLException e){
			out.println("<br>Connection Closing Exception: </b>"+e.getMessage());
			
		}
	}
}
catch(Exception e){
	
	out.println("error"+e.getMessage());
	
}
}
%>
<body>

		<div class="container">
       
                 <a class="brand" href="#"></a>
          <h3>Online Inventory</h3>
				 		  
		  <div class="tabbable tabs-below">
			<ul class="nav nav-tabs">
		      <li class="active"><a href="#">Home</a></li>
              <li><a href="additem.jsp">Add Item</a></li>
              <li><a href="update_item.jsp">Update Item</a></li>
              <li><a href="add_category.jsp">Add Category</a></li>
              <li><a href="add_supplier.jsp">Add Supplier</a></li>
              <li><a href="add_location.jsp">Add Location</a></li>
              <li><a href="listitem.jsp">Summary</a></li>
                        <%
              String session_user=(String)session.getAttribute("user");
              try{
              if(session_user!=null)
              {
             %>
             <li><button class="btn btn-primary" onclick="window.location.href='logout.jsp'">Logout</button></li>
             <%
              }
              }
              catch(Exception e)
              {
            	  out.println(e.getMessage());
              }
              %>
              
			</ul>
           	
			<ul class="nav nav-list">
            <li class="nav-header"></li>
            <li class="active"><a href="#"></a></li>
            <li><a href="#"></a></li>
            </ul>
          
	
      

    

		  
		 









		 </div><!--/.nav-collapse -->
        </div>
      <div class="container">
    </div>
      
     <div class="navbar navbar-inverse navbar-fixed-bottom">
  <div class="navbar-inner">
     <div class="container">
     <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="active" href="#">Support@OnlinveInventory.com</a>
    </div>
  </div>
</div>

<!-- Wrap all page content here -->
<div id="wrap">
  <div class="container">
 
    <p>Welcome to Online Inventory Management System</p>
    <%
              try{
              if(session_user==null)
              {
             %>
   
   <p><font color="red">Login:</font></p>
   <form action="index.jsp" method="post">
   <p>User Name:<input type="text" name="uname"></p>
   <p>Password:<input type="text" name="pwd"></p>
   <p><input type="submit" name="submit" value="Submit"> </p>
   </form>
   
             <%
              }
              }
              catch(Exception e)
              {
            	  out.println(e.getMessage());
              }
              %>
    
    
  </div> <!-- /container -->
</div> <!-- /wrap -->
      
<div id="footer">
      <div class="container">
        <p class="muted credit"></p>
      </div>
</div>
</body>
</html>
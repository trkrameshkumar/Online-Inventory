<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Supplier || Online Inventory</title>
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
<body>

		<div class="container">
       
                 <a class="brand" href="#"></a>
          <h3>Online Inventory</h3>
				 		  
		  <div class="tabbable tabs-below">
			<ul class="nav nav-tabs">
		      <li ><a href="index.jsp">Home</a></li>
              <li><a href="additem.jsp">Add Item</a></li>
              <li><a href="update_item.jsp">Update Item</a></li>
              <li><a href="add_category.jsp">Add Category</a></li>
              <li class="active"><a href="add_supplier.jsp">Add Supplier</a></li>
              <li><a href="add_location.jsp">Add Location</a></li>
              <li><a href="listitem.jsp">Summary</a></li>
              <li><button class="btn btn-primary" onclick="window.location.href='logout.jsp'">Logout</button></li>
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
 
<%@page import="java.sql.*" %>
<% 
String session_user=(String)session.getAttribute("user");
try{
if(session_user!=null)
{
String submit=null;
submit=request.getParameter("submit");
if(submit!=null)
{
	String name=request.getParameter("name");
	String Company_name=request.getParameter("company");
	String Phone=request.getParameter("phone");
	String Email=request.getParameter("email");
	String Address=request.getParameter("address");
	out.println("Success fully added");
	Connection con=null;		
	PreparedStatement pstInsertItem=null;
	ResultSet resultInsertItem=null;		
	try{						
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/msme","root","root");
	String	sqlInsertItem="insert into supplier(name,email,phone,company,address) values('"+name+"','"+Company_name+"','"+Phone+"','"+Email+"','"+Address+"')";
	pstInsertItem=con.prepareStatement(sqlInsertItem);
	pstInsertItem.executeUpdate();
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
}
else
	response.sendRedirect("index.jsp");
}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>
<p>Enter Supplier Details:</p>
<form action="add_supplier.jsp">
<p>Person Name:<input type="text" name="name"></p>
<p>Company Name:<input type="text" name="company"></p>
<p>Phone:<input type="text" name="phone"></p>
<p>Email:<input type="text" name="email"></p>
<p>Address:<input type="text" name="address"></p>
<input type="submit" value="Submit" name="submit">
</form>
    
  </div> <!-- /container -->
</div> <!-- /wrap -->
      
<div id="footer">
      <div class="container">
        <p class="muted credit"></p>
      </div>
</div>

</body>
</html>
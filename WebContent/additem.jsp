<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Item || Online Inventory</title>
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
              <li class="active"><a href="additem.jsp">Add Item</a></li>
              <li><a href="update_item.jsp">Update Item</a></li>
              <li><a href="add_category.jsp">Add Category</a></li>
              <li><a href="add_supplier.jsp">Add Supplier</a></li>
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
 
<p>Enter Item Details:</p>
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
String item_name=request.getParameter("item_name");
String item_discription=request.getParameter("item_discription");
String item_category=request.getParameter("item_category");
String item_quantity=request.getParameter("item_quantity");
String item_location=request.getParameter("item_location");
String item_supplier=request.getParameter("item_supplier");
Connection con=null;		
PreparedStatement pstInsertItem=null;
ResultSet resultInsertItem=null;		
try{						
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/msme","root","root");
String	sqlInsertItem="insert into item_details(item_name,category_id,item_quantity,supplier_id,location_id,item_description) values('"+item_name+"','"+item_category+"','"+item_quantity+"','"+item_supplier+"','"+item_location+"','"+item_discription+"')";
out.println(sqlInsertItem);
pstInsertItem=con.prepareStatement(sqlInsertItem);
pstInsertItem.executeUpdate();
out.println("Item Success fully added");
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
out.println(item_name+item_discription+item_category+item_quantity+item_location+item_supplier);
}
%>
<%
Connection con=null;		
PreparedStatement pstLocation=null;
PreparedStatement pstSupplier=null;
PreparedStatement pstCategory=null;
ResultSet resultLocation=null;
ResultSet resultSupplier=null;
ResultSet resultCategory=null;
try{						
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/msme","root","root");
pstLocation=con.prepareStatement("select location_id,location_name from location");
pstSupplier=con.prepareStatement("select supplier_id,name from supplier");
pstCategory=con.prepareStatement("select category_id,name from category");
resultLocation=pstLocation.executeQuery();
resultSupplier=pstSupplier.executeQuery();
resultCategory=pstCategory.executeQuery();

}
catch(ClassNotFoundException e){
	out.println("<b>Driver Class not found Exception: </b>"+e.getMessage());
	
}
catch(SQLException e){
	out.println("<b>SQL EXception:</b>"+e.getMessage());
}
%>
<form action="additem.jsp" method="get">
<p>Item Name:<input type="text" name="item_name"></p>
<p>Item Discription:<input type="text" name="item_discription"></p>
<p>Item Quantity:<input type="text" name="item_quantity"></p>
<p>Item Category:
<select name="item_category">
<%
try{
while(resultCategory.next())
{
out.println("<option value='"+resultCategory.getString("category_id")+"'>"+resultCategory.getString("name")+"</option>");	
}
}
catch(SQLException e){
	System.out.println(e.getMessage());
}
%>
</select></p>
<p>Location:
<select name="item_location">
<%
try{
while(resultLocation.next())
{
	out.println("<option value='"+resultLocation.getString("location_id")+"'>"+resultLocation.getString("location_name")+"</option>");
}
}
catch(SQLException e){
	System.out.println(e.getMessage());
}
%>
</select></p>
<p>Supplier:<select name="item_supplier">
<%
try{
while(resultSupplier.next())
{
	out.println("<option value='"+resultSupplier.getString("supplier_id")+"'>"+resultSupplier.getString("name")+"</option>");
}
}
catch(SQLException e){
	System.out.println(e.getMessage());
}
}
else{
	out.println("<script>alert('please login')</script>");
	response.sendRedirect("index.jsp");
}
}
catch(Exception e){
	out.println(e.getMessage());
}
%>
</select></p>

<p><input type="submit" value="Submit" name="submit"></p>
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
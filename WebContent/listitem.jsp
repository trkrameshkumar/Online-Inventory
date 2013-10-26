<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Summary || Online Inventory</title>
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
<%
String session_user=(String)session.getAttribute("user");
try{
if(session_user!=null)
{	
%>
		<div class="container">
       
                 <a class="brand" href="#"></a>
          <h3>Online Inventory</h3>
				 		  
		  <div class="tabbable tabs-below">
			<ul class="nav nav-tabs">
		      <li ><a href="index.jsp">Home</a></li>
              <li><a href="additem.jsp">Add Item</a></li>
              <li><a href="update_item.jsp">Update Item</a></li>
              <li><a href="add_category.jsp">Add Category</a></li>
              <li><a href="add_supplier.jsp">Add Supplier</a></li>
              <li><a href="add_location.jsp">Add Location</a></li>
              <li class="active"><a href="listitem.jsp">Summary</a></li>
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
 
<p>Summary of Available Item</p>
<%@page import="java.sql.*"%>
<table border=1>
<th>Id</th>
<th>Name</th>
<th>Type</th>
<th>Quantity</th>
<th>Supplier</th>
<th>Location</th>
<th>Discription</th>
<%
Connection con=null;		//Create Connection Object
PreparedStatement pst=null;
ResultSet result=null;	
PreparedStatement pstCategoryId=null;
ResultSet resultCategory=null;
PreparedStatement pstSupplierId=null;
ResultSet resultSupplier=null;
PreparedStatement pstLocationId=null;
ResultSet resultLocation=null;
	//Create ResultSet Object
try{						//try block begins
Class.forName("com.mysql.jdbc.Driver");//Pass the Drive class name(ex.Mysql) in parameter of Class.forName
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/msme","root","root");
pst=con.prepareStatement("select * from item_details ");
result=pst.executeQuery();
while(result.next())
{	
pstCategoryId=con.prepareStatement("select name from category where category_id='"+result.getString("category_id")+"'");
resultCategory=pstCategoryId.executeQuery();
pstSupplierId=con.prepareStatement("select name from supplier where supplier_id='"+result.getString("supplier_id")+"'");
resultSupplier=pstSupplierId.executeQuery();
pstLocationId=con.prepareStatement("select location_name from location where location_id='"+result.getString("location_id")+"'");
resultLocation=pstLocationId.executeQuery();

String Category_id=null;
String Supplier_id=null;
String Location_id=null;
try{
	while(resultCategory.next()) {
      Category_id= resultCategory.getString("name");
	}
	while(resultSupplier.next()) {
	      Supplier_id= resultSupplier.getString("name");
		}
	while(resultLocation.next()) {
	      Location_id= resultLocation.getString("location_name");
		}
}
catch(SQLException ex)
{
out.println("Inside while SQLException: "+ex.getMessage());
}
out.println("<tr><td>"+result.getString("item_id")+"</td><td>"+result.getString("item_name")+"</td><td> "+Category_id+"</td><td> "+result.getString("item_quantity")+"</td><td> "+Supplier_id+"</td><td> "+Location_id+"</td><td> "+result.getString("item_description")+"</td></tr>");	
}
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
else
	response.sendRedirect("index.jsp");
}
catch(Exception e)
{
	out.println(e.getMessage());
}

%>
</table>
    
  </div> <!-- /container -->
</div> <!-- /wrap -->
      
<div id="footer">
      <div class="container">
        <p class="muted credit"></p>
      </div>
</div>


</body>
</html>
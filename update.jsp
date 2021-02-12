<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="code.microsystem.connectionD.DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="include/adminHeader.jsp">
<c:param name="title" value="Employee Update page"></c:param>
</c:import>

<div class="container mtb">
<div class="row">
<div class="col-lg-6">
<h3>Update Employee</h3>
<%!
ResultSet rs = null;
%>
<%
String msg = (String)request.getAttribute("msg");
%>
<%
if(msg!=null){
%>
<p style="color:red;"><%=msg %></p>
<%}

int id = Integer.parseInt(request.getParameter("id"));
String sql = "select * from emp where id = ?";
try
{
	Connection con = DAO.getCon();
	PreparedStatement pst = con.prepareStatement(sql);
	pst.setInt(1, id);
	rs = pst.executeQuery();
	if(rs.next()){
	
%>
<form action="AdminController?page=empEdit" method="post">
<div class="form-group">
    <label for="exampleInputName1">Employee Id</label>
    <input type="text" class="form-control" id="id" name="id" readonly="readonly" value="<%=rs.getInt("id")%>">  
  </div>
<div class="form-group">
    <label for="exampleInputName1">Employee Name</label>
    <input type="text" class="form-control" id="name" name="name" value="<%=rs.getString("name")%>">  
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Employee Email address</label>
    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" value="<%=rs.getString("email")%>">
    
  </div>
  <div class="form-group">
    <label for="exampleInputMobile1">Employee Mobile No.</label>
    <input type="text" class="form-control" id="mobile" name="mobile" value="<%=rs.getString("mobile")%>">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Employee Password</label>
    <input type="password" class="form-control" id="password" name="password" value="<%=rs.getString("password")%>">
  </div>
  <div class="form-group">
    <label for="exampleInputGender">Gender</label>
    <input type="radio"  id="gender" name="gender" value="Male">Male
    <input type="radio" id="gender" name="gender" value="Female">Female
  </div>
  <button type="submit" class="btn btn-danger">Update Employee</button>
</form>
<%
	}
}
catch(Exception e)
{
	System.out.println(e);
}
%>

</div>
</div>
</div>

<c:import url="include/footer.jsp"></c:import>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="code.microsystem.connectionD.DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="include/userHeader.jsp">
<c:param name="title" value="Employee Leave page"></c:param>
</c:import>

<div class="container mtb">
<div class="row">
<div class="col-lg-6">
<h3>Employee Application</h3>
<%!
ResultSet rs = null;
%>
<%
String email = (String)session.getAttribute("email");
String msg = (String)request.getAttribute("msg");
%>
<p style="color:blue; bolder">Welcome <%=email %></p>
<%
if(msg!=null){
%>
<p style="color:red;"><%=msg %></p>
<%}

String sql = "select * from emp where email = ?";
try
{
	Connection con = DAO.getCon();
	PreparedStatement pst = con.prepareStatement(sql);
	pst.setString(1, email);
	rs = pst.executeQuery();
	if(rs.next()){
	
%>
<form action="UserController?page=empLeave" method="post">
<div class="form-group">
    <label for="exampleInputName1">Employee Id</label>
    <input type="text" class="form-control" id="id" name="id" readonly="readonly" value="<%=rs.getInt("id")%>">  
  </div>
<div class="form-group">
    <label for="exampleInputName1">Employee Name</label>
    <input type="text" class="form-control" id="name" name="name" readonly="readonly" value="<%=rs.getString("name")%>">  
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Employee Email address</label>
    <input type="email" class="form-control" id="email" name="email" readonly="readonly" aria-describedby="emailHelp" value="<%=rs.getString("email")%>">
    
  </div>
  <div class="form-group">
    <label for="exampleInputMobile1">Employee Mobile No.</label>
    <input type="text" class="form-control" id="mobile" name="mobile" readonly="readonly" value="<%=rs.getString("mobile")%>">
    
  </div>
  <div class="form-group">
    <label for="exampleInputGender">Gender</label>
    <input type="radio"  id="gender" name="gender" value="Male" readonly="readonly">Male
    <input type="radio" id="gender" name="gender" value="Female" readonly="readonly">Female
  </div>
  <div class="form-group">
    <label for="reason">Reason for Leave Application</label>
    <textarea rows="10" cols="75" name="reason" id="reason"></textarea>
  </div>
  <div class="form-group">
    <label for="fromdate">From leave Date</label>
    <input type="date"  id="fdate" name="fdate">
  </div>
   <div class="form-group">
    <label for="todate">To leave Date</label>
    <input type="date"  id="tdate" name="tdate">
  </div>
   
  <button type="submit" class="btn btn-danger">Submit</button>
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
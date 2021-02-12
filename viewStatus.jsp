<%@page import="code.microsystem.connectionD.DAO"%>
<%@page import="code.microsystem.Entity.Employee"%>
<%@page import="code.microsystem.Service.AdminService"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="include/userHeader.jsp">
<c:param name="title" value="View Application status page"></c:param>
</c:import>
<%@page import="java.sql.*" %>
<div class="container mtb">
<div class="row">
<div class="col-lg-6">
<%! 
Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;
%>
<h4>All Employee Details</h4>
<hr>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Application Id</th>
      <th scope="col">Employee Name</th>
      <th scope="col">Leave Date</th>
      <th scope="col">Leave UpTo Date</th>
      <th scope="col">Reason for Leave</th>
       <th scope="col">Date of Application</th>
       <th scope="col">Status</th>
    </tr>
  </thead>
<tbody>
<%
String email = (String)session.getAttribute("email");
String sql = "select * from empleave where email=?";
try
{
	con = DAO.getCon();
	pst = con.prepareStatement(sql);
	pst.setString(1, email);
	rs = pst.executeQuery();
	while(rs.next()){		
	%>
		<tr>

<th scope="row"><%=rs.getInt("id")%></th>
<td scope="row"><%=rs.getString("name") %></td>
<td scope="row"><%=rs.getString("fdate") %></td>
<td scope="row"><%=rs.getString("tdate") %></td>
<td scope="row"><%=rs.getString("reason") %></td>
<td scope="row"><%=rs.getString("created") %></td>
<td scope="row"><%=rs.getString("status") %></td>
		</tr>
		
		<%
	}
		}
		catch(Exception e)
		{
		System.out.println(e);
		}
		%>
</tbody>
</table>
</div>
</div>
</div>

<c:import url="include/footer.jsp"></c:import>
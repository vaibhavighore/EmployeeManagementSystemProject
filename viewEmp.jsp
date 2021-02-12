<%@page import="code.microsystem.Entity.Employee"%>
<%@page import="code.microsystem.Service.AdminService"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="include/adminHeader.jsp">
<c:param name="title" value="view All page"></c:param>
</c:import>

<div class="container mtb">
<div class="row">
<div class="col-lg-6">
<%
List<Employee> empList = AdminService.viewAllEmp();
int sno = 1;
%>
<c:set var="emp" value="<%=empList %>"></c:set>
<h4>View All Employee Details</h4>
<hr>
<table class="table table-striped">
  <thead>
    <tr>
     <th scope="col">Sr. No.</th>
      <th scope="col">Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Mobile</th>
       <th scope="col">Password</th>
      <th scope="col">Gender</th>
      <th scope="col">Created</th>
       <th scope="col">Update</th>
      <th scope="col">Remove</th>
    </tr>
  </thead>
<tbody>

<c:forEach var="e" items="<%=empList %>">
<tr>
<th scope="row"><%=sno++ %></th>
<th scope="row">${e.id}</th>
<td scope="row">${e.name}</td>
<td scope="row">${e.email}</td>
<td scope="row">${e.mobile}</td>
<td scope="row">${e.password}</td>
<td scope="row">${e.gender}</td>
<td scope="row">${e.created}</td>
<th><a href="update.jsp?id=${e.id }">Edit</a></th>
<th><a href="AdminController?page=empDelete&id=${e.id }" onclick="if(!(confirm('Are you sure you want to delete this record'))) return false">Delete</a></th>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
</div>

<c:import url="include/footer.jsp"></c:import>
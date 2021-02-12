<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="include/adminHeader.jsp">
<c:param name="title" value="Change status page"></c:param>
</c:import>

<div class="container mtb">
<div class="row">
<div class="col-lg-6">
<h3>Update Status of Employee</h3>
<%
String email = (String)session.getAttribute("email");
int id = Integer.parseInt(request.getParameter("id"));
%>
<h1>Welcome <%=email %></h1>
<form action="AdminController?page=changeStatus" method="post">
  <div class="form-group">
    <label for="id">Employee ID</label>
    <input type="text" class="form-control" id="id" name="id" value="<%=id %>" readonly="readonly" />
    
  </div>
 <div class="form-group">
    <label for="status">Status</label>
   <select class="form-control" id="status" name="status">
      <option value="Approved">Approved</option>
      <option value="Rejected">Rejected</option>
      <option value="Pending">Pending</option>
    </select>
  </div>
  <button type="submit" class="btn btn-danger">Submit</button>
</form>
</div>
</div>
</div>

<c:import url="include/footer.jsp"></c:import>
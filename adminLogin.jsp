<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="include/header.jsp">
<c:param name="title" value="Admin Login page"></c:param>
</c:import>

<div class="container mtb">
<div class="row">
<div class="col-lg-6">
<h3>Admin Login</h3>
<%
String msg = (String)request.getAttribute("msg");
if(msg!=null){
%>
<p style="color:red;"><%=msg %></p>
<%} %>
<form action="AdminController?page=alogin" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="password" name="password">
  </div>
  
  <button type="submit" class="btn btn-danger">Submit</button>
</form>
</div>
</div>
</div>

<c:import url="include/footer.jsp"></c:import>
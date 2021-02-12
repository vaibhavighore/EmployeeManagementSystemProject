<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="include/adminHeader.jsp">
<c:param name="title" value="Employee Registration page"></c:param>
</c:import>

<div class="container mtb">
<div class="row">
<div class="col-lg-6">
<h3>Employee Registration</h3>
<%
String msg = (String)request.getAttribute("msg");
if(msg!=null){
%>
<p style="color:red;"><%=msg %></p>
<%} %>
<form action="AdminController?page=empReg" method="post">
<div class="form-group">
    <label for="exampleInputName1">Employee Name</label>
    <input type="text" class="form-control" id="name" name="name">
    
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Employee Email address</label>
    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp">
    
  </div>
  <div class="form-group">
    <label for="exampleInputMobile1">Employee Mobile No.</label>
    <input type="text" class="form-control" id="mobile" name="mobile">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Employee Password</label>
    <input type="password" class="form-control" id="password" name="password">
  </div>
  <div class="form-group">
    <label for="exampleInputGender">Gender</label>
    <input type="radio"  id="gender" name="gender" value="Male">Male
    <input type="radio" id="gender" name="gender" value="Female">Female
  </div>
  <button type="submit" class="btn btn-danger">Submit</button>
</form>
</div>
</div>
</div>

<c:import url="include/footer.jsp"></c:import>
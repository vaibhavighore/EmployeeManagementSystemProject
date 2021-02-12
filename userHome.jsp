<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="include/userHeader.jsp">
<c:param name="title" value="User Home page"></c:param>
</c:import>

<div class="container mtb">
<div class="row">
<div class="col-lg-6">
<%
String email = (String)session.getAttribute("email");
%>
<h1>Welcome <%=email %></h1>
</div>
</div>
</div>

<c:import url="include/footer.jsp"></c:import>
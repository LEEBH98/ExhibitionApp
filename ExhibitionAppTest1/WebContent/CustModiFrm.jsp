<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<%
String chkcustid = request.getParameter("UIDChk");
String rscustid = "";
String email = "";
String rscustname = "";
String phone= "";
String custpwd = "";

String sql = "select * from customers where custid = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, chkcustid);
rs = pstmt.executeQuery();

if(rs.next()){
	email = rs.getString("email");
	rscustname = rs.getString("custname");
	phone= rs.getString("phone");
}
%>
<section class="row">
	<div class="col-md-12">
<br/><br/>
<h2 class="text-center"> "<span class="text-primary"> <%=rscustname %> </span>"  님 정보 수정</h2>
<form action="CustModiProc.jsp" method="post">
<table class="table table-striped table-condensed">
	<tr>
		<th>아이디</th>
		<td>
		<input type="text" class="form-control" value="<%=chkcustid %>" disabled/>
		<input type="hidden" class="form-control" name="custid"  value="<%=chkcustid %>"/>
		
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" class="form-control" value="*******"  name="pwd" disabled/></td> 
	</tr>
	<tr>
		<th>이 름</th>
		<td><input type="text" class="form-control" name="custname"value="<%=rscustname %>"/></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
		<input type="email" class="form-control" name="email" value="<%=email %>"/></td>
	</tr>
	<tr>
		<th>휴대폰번호</th>
		<td><input type="text" maxlength="13" name="phone"  class="form-control"  value="<%=phone %>"/>
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="정 보 수 정" class="btn btn-success btn-block" />
		</th>
	</tr>
</table>
</form>
</div>
</section>
<%@ include file="./include/Footer.jsp" %>
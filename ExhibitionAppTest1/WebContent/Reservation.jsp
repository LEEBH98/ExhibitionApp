<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<h2 class="text-center text-primary">관람권 구매</h2>
<section class="row">
<%	 String sql = "select * from exhibition order by exidx";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
if(rs.next()){
	do{
		String exidx = rs.getString("exidx");
		String extitle = rs.getString("extitle");
		String genre = rs.getString("genre");
		String author = rs.getString("author");
		String rating = rs.getString("rating");
		String texts = rs.getString("texts");
		String placename = rs.getString("placename");
		int exprice = rs.getInt("exprice");
		String sdate = rs.getString("sdate");
		String edate = rs.getString("edate");
		String docent = rs.getString("docent");
		%>
<div class="col-md-3">
<div class="form_wrap">
	<form action="ReservationInsertProc.jsp" method="get" name="ResFrm" id="ResFrm">
		<h4 class="text-primary"><%=exidx %></h4>
		<p>영화코드 : <%=exidx %></p>
		<input type="date" value="<%=exidx%>" name="exidx" id="chkDate"  class="form-control"/>
		<select name="tk_cnt" class="form-control">
			<option value="1">1 매</option>
			<option value="2">2 매</option>
			<option value="3">3 매</option>
			<option value="4">4 매</option>
			<option value="5">5 매</option>
			<option value="6">6 매</option>
			<option value="7">7 매</option>
			<option value="8">8 매</option>
		</select><br/>
		<input type="hidden" value="<%=exidx%>" name="exidx"/>
		<input type="hidden" value="<%=exidx%>" name="exidx"/>
		<input type="hidden" value="<%=exidx%>" name="exidx"/>
		<input type="submit" class="btn btn-success btn-block"  value="바로예약"/>
	</form>	
	<br/>
	
</div>
</div>		
		<%
	}while(rs.next());
}

else{out.println("조회실패");}
 	
 	
try{
	pstmt.close();
	conn.close();
	rs.close();
}catch(Exception e){
	e.printStackTrace();
	out.println("오류 메세지 : " + e.getMessage());
}
 	
%>

</section>




<%@ include file="./include/Footer.jsp" %>
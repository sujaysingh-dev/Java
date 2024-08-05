
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %> 
<%@ page import="javax.swing.*"%> 
<%
    String btnval=request.getParameter("b1");
	if(btnval.equalsIgnoreCase("save"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		String t6=request.getParameter("t6");
	  	int m=0;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "medanta","medanta");
			Statement smt=conn.createStatement();
			ResultSet rs=smt.executeQuery("select appoint_id from appoint");
			while(rs.next())
			{
				if(rs.getString(1).equals(t1))
				{
					m=1;
					break;
				}
			}
			if(m==1)
			{
				out.println("<script>alert('ID Already Exist')</script>");
			}
			else
			{
				PreparedStatement psmt=conn.prepareStatement("insert into appoint values(?,?,?,?,?,?)");
				psmt.setString(1,t1);
				psmt.setString(2,t2);
				psmt.setString(3,t3);
				psmt.setString(4,t4);
				psmt.setString(5,t5);
				psmt.setString(6,t6);
				psmt.executeQuery();
				out.println("<script>alert('Record Saved......')</script>");
			}
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of save
	
	if(btnval.equalsIgnoreCase("update"))
	{
		
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		String t6=request.getParameter("t6");
	  	try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "medanta","medanta");
			PreparedStatement psmt=conn.prepareStatement("update appoint set APPOINT_NUMBER=?, APPOINT_TYPE=?,  APPOINT_DESCRIB=?, 	APPOINT_DATE=?, APPOINT_DOCTOR=? where  APPOINT_ID=? ");
			psmt.setString(6,t1);
			psmt.setString(1,t2);
			psmt.setString(2,t3);
			psmt.setString(3,t4);
			psmt.setString(4,t5);
			psmt.setString(5,t6);
			psmt.executeQuery();
			out.println("<script>alert('Record Update......')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of update
	
	if(btnval.equalsIgnoreCase("delete"))
	{
		String t1=request.getParameter("t1");
	  	try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "medanta","medanta");
			PreparedStatement psmt=conn.prepareStatement("delete from appoint where appoint_id=?");
			psmt.setString(1,t1);
			psmt.executeQuery();
			out.println("<script>alert('Record delete......')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of delete
	
	if(btnval.equalsIgnoreCase("Allsearch"))
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "medanta","medanta");
			Statement smt=conn.createStatement();
			ResultSet rs=smt.executeQuery("select * from appoint");
		%><center>
		<table border=1 bgcolor=#83F47D>
		<tr>
		    <th bgcolor=#C8A7FA><font size=6>Appoint ID</th>
		    <th bgcolor=#C8A7FA><font size=6>Appoint Number</th>
		    <th bgcolor=#C8A7FA><font size=6>Appoint Type</th>
		    <th bgcolor=#C8A7FA><font size=6>Appoint Describe</th>
		    <th bgcolor=#C8A7FA><font size=6>Appoint Date</th>
		    <th bgcolor=#C8A7FA><font size=6>Appoint Doctor</th>
		</tr></center>
	   <%
	   while(rs.next())
	   {
		%>
		   <tr>
		       <th><%=rs.getString(1)%></th>
		       <th><%=rs.getString(2)%></th>
		       <th><%=rs.getString(3)%></th>
		       <th><%=rs.getString(4)%></th>
		       <th><%=rs.getString(5)%></th>
		       <th><%=rs.getString(6)%></th>
		       

		  </tr>
		  <%}%>
		         <input type=button value="Print" onclick="window.print()">
		  </table>
	<%}	  
	catch(Exception e)
    {
    	out.println(e.toString());
    }
		
	}//End of Allsearch
	
	if(btnval.equalsIgnoreCase("psearch"))
	{
		String t1=request.getParameter("t1");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "medanta","medanta");
			Statement smt=conn.createStatement();
			ResultSet rs=smt.executeQuery("select * from appoint where appoint_id='"+t1+"' ");
		%><center>
		<table border=1 bgcolor=#83F47D>
		<tr>
		    <th bgcolor=#C8A7FA><font size=6>Appoint ID</th>
		    <th bgcolor=#C8A7FA><font size=6>Appoint Number</th>
		    <th bgcolor=#C8A7FA><font size=6>Appoint Type</th>
		    <th bgcolor=#C8A7FA><font size=6>Appoint Describe</th>
		    <th bgcolor=#C8A7FA><font size=6>Appoint Date</th>
		    <th bgcolor=#C8A7FA><font size=6>Appoint Doctor</th>
		</tr></center>
	   <%
	   while(rs.next())
	   {
		%>
		   <tr>
		       <th><%=rs.getString(1)%></th>
		       <th><%=rs.getString(2)%></th>
		       <th><%=rs.getString(3)%></th>
		       <th><%=rs.getString(4)%></th>
		       <th><%=rs.getString(5)%></th>
		       <th><%=rs.getString(6)%></th>
		       

		  </tr>
		  <%}%>
		          <input type=button value="Print" onclick="window.print()">
		  </table>
	<%}	  
	catch(Exception e)
    {
    	out.println(e.toString());
    }
}//End of psearch
%>
</body>
</html>
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
		int m=0;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "medanta", "medanta");
			Statement smt=conn.createStatement();
			ResultSet rs=smt.executeQuery("select doctors_id from doctors");
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
				PreparedStatement psmt=conn.prepareStatement("insert into doctors values(?,?,?,?,?)");
				psmt.setString(1,t1);
				psmt.setString(2,t2);
				psmt.setString(3,t3);
				psmt.setString(4,t4);
				psmt.setString(5,t5);
				psmt.executeQuery();
				out.println("<script>alert('Record Saved......')</script>");
			}
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of save
	
	if(btnval.equalsIgnoreCase("update"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
	  	try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "medanta", "medanta");
			PreparedStatement psmt=conn.prepareStatement("update doctors set  DOCTORS_NAME=?, DOCTORS_MOBILE=?, DOCTORS_EMAIL=?,DOCTORS_ADDRESS=? WHERE DOCTORS_ID=?");
			psmt.setString(5,t1);
			psmt.setString(1,t2);
			psmt.setString(2,t3);
			psmt.setString(3,t4);
			psmt.setString(4,t5);
			psmt.executeQuery();
			out.println("<script>alert('Record Update......')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of update
	
	if(btnval.equalsIgnoreCase("delete"))
	{
		String t1=request.getParameter("t1");
	  	try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "medanta", "medanta");
			PreparedStatement psmt=conn.prepareStatement("delete from doctors where doctors_id=?");
			psmt.setString(1,t1);
			psmt.executeQuery();
			out.println("<script>alert('Record delete......')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of delete
	
	if(btnval.equalsIgnoreCase("Allsearch"))
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "medanta", "medanta");
			Statement smt=conn.createStatement();
			ResultSet rs=smt.executeQuery("select * from doctors");
		%>
		<center>
		<table border=1 bgcolor=#83F47D>
		<tr>
		    <th bgcolor=#C8A7FA><font size=4>Doctor ID</font></th>
		    <th bgcolor=#C8A7FA><font size=4>Doctor Name</font></th>
		    <th bgcolor=#C8A7FA><font size=4>Doctor Mobile</font></th>
		    <th bgcolor=#C8A7FA><font size=4>Doctor Email</font></th>
		    <th bgcolor=#C8A7FA><font size=4>Doctor Address</font></th>
		</tr>
		</center>
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
		  </tr>
		  <%}%>
		         <input type="button" value="Print" onclick="window.print()">
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
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "medanta", "medanta");
			Statement smt=conn.createStatement();
			ResultSet rs=smt.executeQuery("select * from doctors where doctors_id='"+t1+"' ");
		%>
		<center>
		<table border=1 bgcolor=#83F47D>
		<tr>
		    <th bgcolor=#C8A7FA><font size=4>Doctor ID</font></th>
		    <th bgcolor=#C8A7FA><font size=4>Doctor Name</font></th>
		    <th bgcolor=#C8A7FA><font size=4>Doctor Mobile</font></th>
		    <th bgcolor=#C8A7FA><font size=4>Doctor Email</font></th>
		    <th bgcolor=#C8A7FA><font size=4>Doctor Address</font></th>   
	   </tr>
	   </center>
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
		  </tr>
		  <%}%>
		         <input type="button" value="Print" onclick="window.print()">
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
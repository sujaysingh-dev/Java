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
		String t7=request.getParameter("t7");
		String t8=request.getParameter("t8");
		String t9=request.getParameter("t9");
		String t10=request.getParameter("t10");
		String t11=request.getParameter("t11");
		String t12=request.getParameter("t12");
		String t13=request.getParameter("t13");
		String t14=request.getParameter("t14");
		int m=0;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "medanta", "medanta");
			Statement smt=conn.createStatement();
			ResultSet rs=smt.executeQuery("select p_id from patient");
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
				PreparedStatement psmt=conn.prepareStatement("insert into patient values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				psmt.setString(1,t1);
				psmt.setString(2,t2);
				psmt.setString(3,t3);
				psmt.setString(4,t4);
				psmt.setString(5,t5);
				psmt.setString(6,t6);
				psmt.setString(7,t7);
				psmt.setString(8,t8);
				psmt.setString(9,t9);
				psmt.setString(10,t10);
				psmt.setString(11,t11);
				psmt.setString(12,t12);
				psmt.setString(13,t13);
				psmt.setString(14,t14);
				
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
		String t6=request.getParameter("t6");
		String t7=request.getParameter("t7");
		String t8=request.getParameter("t8");
		String t9=request.getParameter("t9");
		String t10=request.getParameter("t10");
		String t11=request.getParameter("t11");
		String t12=request.getParameter("t12");
		String t13=request.getParameter("t13");
		String t14=request.getParameter("t14");
	  	try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "medanta","medanta");
			PreparedStatement psmt=conn.prepareStatement("update patient set FNAME=?, LNAME=?,GENDER=?,AGE=?, DOB=?, EMAIL=?,PASS=?,CPASS?, PNUM=?, ADDRESS=?,STATE=?,UPHOTO=?, DECLARE=? where P_ID=? ");
			psmt.setString(14,t1);
			psmt.setString(1,t2);
			psmt.setString(2,t3);
			psmt.setString(3,t4);
			psmt.setString(4,t5);
			psmt.setString(5,t6);
			psmt.setString(6,t7);
			psmt.setString(7,t8);
			psmt.setString(8,t9);
			psmt.setString(9,t10);
			psmt.setString(10,t11);
			psmt.setString(11,t12);
			psmt.setString(12,t13);
			psmt.setString(13,t14);
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
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "medanta","medanta");
			PreparedStatement psmt=conn.prepareStatement("delete from patient where P_ID=?");
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
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "medanta","medanta");
			Statement smt=conn.createStatement();
			ResultSet rs=smt.executeQuery("select * from patient");
		%>
		<center>
		<table border=1 bgcolor=#83F47D>
		<tr>
		    <th bgcolor=#C8A7FA><font size=3>P ID</font></th>
		    <th bgcolor=#C8A7FA><font size=3>F NAME</font></th>
		    <th bgcolor=#C8A7FA><font size=3>L NAME</font></th>
		    <th bgcolor=#C8A7FA><font size=3>GENDER</font></th>
		    <th bgcolor=#C8A7FA><font size=3>AGE</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>DOB</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>EMAIL</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>PASSWORD</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>C PASSWORD</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>P NUM</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>ADDRESS</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>STATE</font></th>
		    <th bgcolor=#C8A7FA><font size=3>UPHOTO</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>DECLARE</font></th>     
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
		       <th><%=rs.getString(6)%></th>
		       <th><%=rs.getString(7)%></th>
		       <th><%=rs.getString(8)%></th>
		       <th><%=rs.getString(9)%></th>
		       <th><%=rs.getString(10)%></th>
		       <th><%=rs.getString(11)%></th>
		       <th><%=rs.getString(12)%></th>
		       <th><%=rs.getString(13)%></th>
		       <th><%=rs.getString(14)%></th>
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
	
	if(btnval.equalsIgnoreCase("Psearch"))
	{
		String t1=request.getParameter("t1");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "medanta","medanta");
			Statement smt=conn.createStatement();
			ResultSet rs=smt.executeQuery("select * from patient where P_ID='"+t1+"'");
		%>
		<center>
		<table border=1 bgcolor=#83F47D>
		<tr>
		     <th bgcolor=#C8A7FA><font size=3>P ID</font></th>
		    <th bgcolor=#C8A7FA><font size=3>F NAME</font></th>
		    <th bgcolor=#C8A7FA><font size=3>L NAME</font></th>
		    <th bgcolor=#C8A7FA><font size=3>GENDER</font></th>
		    <th bgcolor=#C8A7FA><font size=3>AGE</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>DOB</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>EMAIL</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>PASSWORD</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>C PASSWORD</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>P NUM</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>ADDRESS</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>STATE</font></th>
		    <th bgcolor=#C8A7FA><font size=3>UPHOTO</font></th> 
		    <th bgcolor=#C8A7FA><font size=3>DECLARE</font></th>       
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
		       <th><%=rs.getString(6)%></th>
		       <th><%=rs.getString(7)%></th>
		       <th><%=rs.getString(8)%></th>
		       <th><%=rs.getString(9)%></th>
		       <th><%=rs.getString(10)%></th>
		       <th><%=rs.getString(11)%></th>
		       <th><%=rs.getString(12)%></th>
		       <th><%=rs.getString(13)%></th>
		       <th><%=rs.getString(14)%></th>
		   </tr>
		  <%}%>
		         <input type="button" value="Print" onclick="window.print()">
		  </table>
	<%}	  
	catch(Exception e)
    {
    	out.println(e.toString());
    }
}//End of Psearch
%>
</body>
</html>
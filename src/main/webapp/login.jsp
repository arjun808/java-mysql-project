<%@ page import="java.sql.*"%>

<%
 String userName = request.getParameter("userName"); 
 
 String password = request.getParameter("password"); 
 
Class.forName ("com.mysql.jdbc.Driver"); 
String dburl = System.getenv("dburl");
String user = System.getenv("dbuser");	String dbuser = System.getenv("dbuser");
String password = System.getenv("dbpassword");	String dbpassword = System.getenv("dbpassword");
Connection con = DriverManager.getConnection(dburl, dbuser, dbpassword);

Statement st = con.createStatement(); 
 ResultSet rs; 
 rs = st.executeQuery("select * from USER where username='" + userName + "' and password='" + password + "'");
	if (rs.next()) 
		{ 
			session.setAttribute("userid", userName); 
			response.sendRedirect("success.jsp"); 
		} 
	else 
		{ 
			out.println("Invalid password <a href='index.jsp'>try again</a>"); 
} 
%>

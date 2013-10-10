<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BEGL",
            "root", "enitmysql");
    Statement st = con.createStatement();
    ResultSet rs;
    // Authentification 9ach
    Statement st1 = con.createStatement();
    ResultSet rs1;
    
    
    rs = st.executeQuery("select * from acteur_chaine_instruction where login='" + userid + "' and passwd='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
    // Verifie si le login
    boolean isEmpty =  ! rs.first();
    if (isEmpty) {rs1 = st1.executeQuery("select * from enseignant_chercheur where login='" + userid + "' and passwd='" + pwd + "'");
    					if (rs1.next()) {
       					 session.setAttribute("userid", userid);
        				//out.println("welcome " + userid);
        				//out.println("<a href='logout.jsp'>Log out</a>");
        				response.sendRedirect("success.jsp");
   						 } else {
       						 out.println("Invalid password <a href='index.jsp'>try again</a>");
    					}
    			}
    
    
%>
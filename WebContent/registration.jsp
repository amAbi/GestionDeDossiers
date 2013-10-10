<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String departement = request.getParameter("departement");
    String etablissement = request.getParameter("etablissement");
    String cin = request.getParameter("cin");
    int NCIN= Integer.parseInt(cin);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BEGL",
            "root", "enitmysql");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into enseignant_chercheur(PRENOM,NOM,LOGIN,PASSWD,CIN,DEPARTEMENT,ETABLISSEMENT) values ('" + lname + "','" + fname + "','"  + user + "','" + pwd +"','"+NCIN+ "','"+departement+"','"+etablissement+ "')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
%>
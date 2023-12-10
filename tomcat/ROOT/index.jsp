<html>
        <head>
        <title>MariaDB connection test </title>
        </head>

        <body>
        <%@ page contentType="text/html" language="java"%>
        <%@ page import="java.sql.*"%>

        <%
        Connection con = null;
        PreparedStatement PS = null;
        ResultSet RS = null;

        try{


        String MARIADB_SERVER = "petclinic-db.default.svc.cluster.local:3306";
        String MARIADB_SERVER_USERNAME = "root";
        String MARIADB_SERVER_PASSWORD = "petclinic";
        String MARIADB_DATABASE = "testDB";
        String URL = "jdbc:mysql://"+ MARIADB_SERVER + "/" + MARIADB_DATABASE;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(URL, MARIADB_SERVER_USERNAME, MARIADB_SERVER_PASSWORD);

        %>
        <%
        String query = "select * from test";
        PS = con.prepareStatement(query);
        RS = PS.executeQuery();        
        int count=0;
        while(RS.next()){
        String name = RS.getString("name");
        %>
        <p>Name : <%=name%></p>
        <%
        count++;
        }
        }catch(Exception ErrMsg) {
        ErrMsg.printStackTrace();
        out.println("Unfortunately, Database connection failed");
        }

        %>
        </body>
        </html>


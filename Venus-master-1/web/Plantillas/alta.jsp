<%-- 
    Document   : alta
    Created on : 29-oct-2017, 13:42:02
    Author     : rodri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*,java.io.*" %>
        <%
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellido");
            String nombreCompleto = (nombre + " "  + apellidos);
            String correo = request.getParameter("correo");
            String username = request.getParameter("username");
            String contra = request.getParameter("contrasenia");

            Connection con = null;
            Statement sta = null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/venus", "root", "n0m3l0");
                sta = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }

            try {
                sta.executeUpdate("insert into Usuario(Nombre_Usuario, Apellido_Usuario, Correo_Usuario, Username_Usuario, Contrasenia_Usuario)"
                        + "values('" + nombre + "','" + apellidos + "','" + correo + "', '" + username + "','" + contra + "');");
                out.println("<script>alert('Registrado con éxito');window.location.href = 'http://localhost:8080/Venus-master/Plantillas/Ingresar.html';</script>");
                con.close();
            } catch (SQLException error) {
                out.println("<script>alert('Ha ocurrido un error con tu alta');window.location.href = 'http://localhost:8080/Venus-master/Plantillas/Inicio.html';</script>");
            }
            con.close();
        %>
    </body>
</html>

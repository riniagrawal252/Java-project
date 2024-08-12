<%-- 
    Document   : login
    Created on : 16 May, 2024, 7:36:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <h1 align="center">Login  Form</h1>
      <form action="LoginControl.jsp" method="post">
            <table bgcolor="cyan" align="center">
               
               
                <tr>
                    <td>UserName : </td>
                    <td><input type="text" name="un"></td>
                </tr>
                <tr>
                    <td>Password : </td>
                    <td><input type="password" name="ps"></td>
                </tr>
                <tr>
                    <td>&nbsp; </td>
                    <td><input type="submit" value="Login Here"></td>
                </tr>
            </table>
        </form>
    </body>
</html>

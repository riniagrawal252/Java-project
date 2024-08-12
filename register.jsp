<%-- 
    Document   : register
    Created on : 16 May, 2024, 7:26:49 PM
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
       <h1 align="center">Registration Form</h1>
        <form action="RegControl.jsp">
            <table bgcolor="cyan" align="center">
               
                <tr>
                    <td>Name : </td>
                    <td><input type="text" name="name"></td>
                </tr>
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
                    <td><input type="submit" value="Register User"></td>
                </tr>
            </table>
        </form>
    </body>
</html>

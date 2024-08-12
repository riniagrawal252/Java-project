<%-- 
    Document   : a1
    Created on : 20 May, 2024, 6:51:22 PM
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
        <h1 align="center">Student Registration Form</h1>
        <form  action="b.jsp">
            <table bgcolor="cyan" align="center">
                <tr>
                    <td>ID : </td>
                    <td><input type="text" name="id"></td>
                </tr>
                <tr>
                    <td>Name : </td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>Enrollment : </td>
                    <td><input type="text" name="enroll"></td>
                </tr>
                <tr>
                    <td>Percentage : </td>
                    <td><input type="text" name="per"></td>
                </tr>
                <tr>
                    <td>&nbsp; </td>
                    <td><input type="submit" value="submit"></td>
                </tr>
            </table>
        </form>
    </body>
</html>

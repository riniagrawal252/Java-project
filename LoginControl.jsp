<%-- 
    Document   : LoginControl
    Created on : 16 May, 2024, 7:37:36 PM
    Author     : Admin
--%>

<%@page import="com.ram.dao.UsersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String userName = request.getParameter("un");
            String password = request.getParameter("ps");
            String str = "";
            String str1 = "";
            UsersDAO ud = new UsersDAO();
            int r = ud.loginCheck(userName, password);
            if (r > 0) {
                session.setAttribute("user", userName);
                str = "Login Success";
                response.sendRedirect("addstudent.jsp");
            }
            else{
                str1="Invalid UserName and Pasword Please Try again....";
                RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                rd.include(request, response);
            }
        %>
        <h1><font color="red"><%=str1%></font></h1>
    </body>
</html>

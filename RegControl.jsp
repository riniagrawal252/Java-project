<%-- 
    Document   : RegControl
    Created on : 16 May, 2024, 7:28:03 PM
    Author     : Admin
--%>

<%@page import="com.ram.dao.UsersDAO"%>
<%@page import="com.ram.bean.UsersBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
String str="";
            if(request.getParameter("name")!=null && request.getParameter("un")!=null && request.getParameter("ps")!=null){
        String name=request.getParameter("name");
        String un=request.getParameter("un");
        String ps=request.getParameter("ps");
        
UsersBean ub=new UsersBean();
ub.setName(name);
ub.setUserName(un);
ub.setPassword(ps);

UsersDAO ud=new UsersDAO();
int r=0;

  r=ud.registerUser(ub);  


if(r>0){
    str="Registration Success";
}
            }
        %>
        <h1><font color="green"><%=str %></font></h1>
    </body>
</html>

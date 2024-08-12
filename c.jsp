<%-- 
    Document   : c
    Created on : 20 May, 2024, 7:03:48 PM
    Author     : Admin
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <hr color="red">
        <hr color="red">
        
        <h1>Welcome to Cybrom</h1>
        <%
       Cookie ck[]=request.getCookies();
       for(Cookie k:ck){
           out.println("Name of The Cookie : "+k.getName());
           out.println("Name of The Cookie : "+k.getValue());
           
       }
        
        %>
        
          <hr color="green">
        <hr color="green">
        
    </body>
</html>

<%-- 
    Document   : b
    Created on : 20 May, 2024, 6:52:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="s" class="com.ram.bean.StudentBean">
    <jsp:setProperty  name="s" property="*"></jsp:setProperty>


    <jsp:getProperty name="s" property="id"></jsp:getProperty>

    <jsp:getProperty name="s" property="name"></jsp:getProperty>

    <jsp:getProperty name="s" property="enroll"></jsp:getProperty>

    <jsp:getProperty name="s" property="per"></jsp:getProperty>
</jsp:useBean>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

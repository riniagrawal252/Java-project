<%-- 
    Document   : updatestudent
    Created on : 14 May, 2024, 6:41:48 PM
    Author     : Admin
--%>

<%@page import="com.ram.dao.StudentDAO"%>
<%@page import="com.ram.bean.StudentBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        int id=Integer.parseInt(request.getParameter("id"));
        StudentDAO sd=new StudentDAO();
        StudentBean  sb=sd.findById(id);
        
        if(request.getParameter("id")!=null&& request.getParameter("name")!=null && request.getParameter("enroll")!=null && request.getParameter("per")!=null){
            int idx=Integer.parseInt(request.getParameter("id"));
            String name=request.getParameter("name");
            String enroll=request.getParameter("enroll");
            float per=Float.parseFloat(request.getParameter("per"));
            sb.setId(idx);
            sb.setEnroll(enroll);
            sb.setName(name);
            sb.setPer(per);
            
            int r=sd.updateStudent(sb);
            if(r>0){
                response.sendRedirect("addstudent.jsp");
            }
           
        }
        
        %>
       
       <h1 align="center">Student Update Form</h1>
        <form>
            <table bgcolor="cyan" align="center">
                <tr>
                    <td>ID : </td>
                    <td><input type="text" name="id" value=<%=sb.getId() %>></td>
                </tr>
                <tr>
                    <td>Name : </td>
                    <td><input type="text" name="name" value=<%=sb.getName() %>></td>
                </tr>
                <tr>
                    <td>Enrollment : </td>
                    <td><input type="text" name="enroll" value=<%=sb.getEnroll() %>></td>
                </tr>
                <tr>
                    <td>Percentage : </td>
                    <td><input type="text" name="per" value= <%=sb.getPer() %>></td>
                </tr>
                <tr>
                    <td>&nbsp; </td>
                    <td><input type="submit" value="Update Student"></td>
                </tr>
            </table>
        </form>
    </body>
</html>

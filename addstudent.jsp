<%-- 
    Document   : addstudent
    Created on : 11 May, 2024, 7:23:45 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.ram.dao.StudentDAO"%>
<%@page import="com.ram.bean.StudentBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Registration Form</title>
    </head>
    <body>
        <h1 align="center">Student Registration Form</h1>
        <form>
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

        <%
            String u=(String)session.getAttribute("user");
            if(u==null){
                response.sendRedirect("login.jsp");
            }
            String str = "";
            String str1 = "";
            if (request.getParameter("id") != null & request.getParameter("name") != null && request.getParameter("enroll") != null && request.getParameter("per") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String enroll = request.getParameter("enroll");
                float per = Float.parseFloat(request.getParameter("per"));

                StudentBean sb = new StudentBean();
                sb.setEnroll(enroll);
                sb.setId(id);
                sb.setName(name);
                sb.setPer(per);
                StudentDAO sd = new StudentDAO();
                int r = sd.addStudent(sb);
                if (r > 0) {
                    str = "Registration Success";
                }
            }


        %>

        <h1 align='center'><font color='green'><%=str%></font></h1>
        <h1 align="right">Welcome : <%=u %></h1>
        <h1 align="center">All Students Data</h1>
        <table align="center" border="1">
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>Enrollment</th>
                <th>Percentage</th>
                <th>EDIT</th>
                <th>DELETE</th>
            </tr>
            <%
                StudentDAO sd = new StudentDAO();
                ArrayList<StudentBean> al = sd.findAll();
                for (StudentBean sb : al) {


            %>
            <tr>
                <td><%=sb.getId()%></td>
                <td><%=sb.getName()%></td>
                <td><%=sb.getEnroll()%></td>
                <td><%=sb.getPer()%></td>
                <td><a href="updatestudent.jsp?id=<%=sb.getId() %>">EDIT</a></td>
                <td><a href="addstudent.jsp?sid=<%=sb.getId()%>">DELETE</a></td> 
            </tr>
            <%
                }
            %>
        </table>
        <%
            if (request.getParameter("sid") != null) {
                int id = Integer.parseInt(request.getParameter("sid"));

                sd.deleteStudent(id);
                response.sendRedirect("addstudent.jsp");
            }

        %>
    </body>
</html>

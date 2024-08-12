package com.ram.dao;

import com.ram.bean.StudentBean;
import com.ram.utility.ConnectionPool;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class StudentDAO {
    
    static Connection conn;
    
    public int addStudent(StudentBean sb) {
        conn = ConnectionPool.connectDB();//step1 and step2
        //step3: write SQL Query
        String sql = "insert into student values('" + sb.getId() + "','" + sb.getName() + "','" + sb.getEnroll() + "','" + sb.getPer() + "')";
        //step4 Create Object of Statement via Connection
        Statement stmt;
        int r = 0;
        try {
            stmt = conn.createStatement();
            //step5 call exeuteUpdate method
            r = stmt.executeUpdate(sql);
            //step6: close the connection
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return r;
    }
    
    public int updateStudent(StudentBean sb) {
        conn = ConnectionPool.connectDB();//step1 step2
        //step3: Write SQL Query
        String sql = "update student set name='" + sb.getName() + "',enroll='" + sb.getEnroll() + "',per='" + sb.getPer() + "' where id='" + sb.getId() + "'";
        int r = 0;
        try {
            //step4: Create Object of Statement
            Statement stmt = conn.createStatement();
            //step5: call executeUpdate
            r = stmt.executeUpdate(sql);
            //step6: close the Connection
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }
    
    public int deleteStudent(int id) {
        conn = ConnectionPool.connectDB();//step1,step2
        //step3: Write SQL Query
        String sql = "delete  from student where id='" + id + "'";
        //step4: Create Object of Statement
        int r = 0;
        try {
            Statement stmt = conn.createStatement();
            //step5: call executeUpdate() method
            r = stmt.executeUpdate(sql);
            //step6: Close the Connection
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }
    
    public ArrayList<StudentBean> findAll() {
        conn = ConnectionPool.connectDB(); //step1,step2
        //step3 :Write SQL Query
        ArrayList<StudentBean> al = new ArrayList<>();
        String sql = "select * from student";
        try {
            //step4: Create Object of Statement
            Statement stmt = conn.createStatement();
            //step5: call executeQuery
            ResultSet rs = stmt.executeQuery(sql);
            //step6: Process Result
            while (rs.next()) {
                StudentBean sb = new StudentBean();
                sb.setId(rs.getInt("id"));
                sb.setName(rs.getString("name"));
                sb.setEnroll(rs.getString("enroll"));
                sb.setPer(rs.getFloat("per"));
                al.add(sb);
            }
            //step7: Close the Connections
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return al;
    }
    
    public StudentBean findById(int id) {
        conn = ConnectionPool.connectDB(); //step1,step2
        //step3 :Write SQL Query
        String sql = "select * from student where id='" + id + "'";
        StudentBean sb = new StudentBean();
        try {
            //step4: Create Object of Statement
            Statement stmt = conn.createStatement();
            //step5: call executeQuery
            ResultSet rs = stmt.executeQuery(sql);
            //step6: Process Result
            
            if (rs.next()) {
                
                sb.setId(rs.getInt("id"));
                sb.setName(rs.getString("name"));
                sb.setEnroll(rs.getString("enroll"));
                sb.setPer(rs.getFloat("per"));
            }
            //step7: Close the Connections
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sb;
        
    }
    
    public StudentBean findByEnrollment(String enroll) {
        conn = ConnectionPool.connectDB(); //step1,step2
        //step3 :Write SQL Query
        String sql = "select * from student where enroll='" + enroll + "'";
        StudentBean sb = new StudentBean();
        try {
            //step4: Create Object of Statement
            Statement stmt = conn.createStatement();
            //step5: call executeQuery
            ResultSet rs = stmt.executeQuery(sql);
            //step6: Process Result
            while (rs.next()) {

                //System.out.println(""+rs.getInt("id")+"\t"+rs.getString("name")+"\t"+rs.getString("enroll")+"\t"+rs.getFloat("per"));
                sb.setId(rs.getInt("id"));
                sb.setName(rs.getString("name"));
                sb.setEnroll(rs.getString("enroll"));
                sb.setPer(rs.getFloat("per"));
                
            }
            //step7: Close the Connections
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sb;
    }

    public static void main(String[] args) {
        StudentBean s = new StudentBean();
        s.setId(105);
        s.setName("XXXX");
        s.setEnroll("YYYY");
        s.setPer(1.0f);
        StudentDAO sd = new StudentDAO();
        //1. addStudent
//     int r=sd.addStudent(s);
//     if(r>0){
//         System.out.println("Student Added Success");
//     }else{
//         System.out.println("Student Not Added");
//     }
//2. call updateStudent() method
// int r=sd.updateStudent(s);
//     if(r>0){
//         System.out.println("Student updated Success");
//     }else{
//         System.out.println("Student Not updated");
//     }
//3. call deleteStudent() method
//int r=sd.deleteStudent(101);
//if(r>0){
//    System.out.println("Delete Student success");
//}else{
//    System.out.println("Student Not Deleted");
//}
//4. Call findAll method
//StudentDAO sd=new StudentDAO();
//sd.findAll();
//5. call findById method
//sd.findById(102);
//6. call findByEnrollment
       StudentBean ss=sd.findByEnrollment("0167CS181022");
        System.out.println(""+ss.getId()+"  \t"+ss.getName());
    }
}

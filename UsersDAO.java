package com.ram.dao;

import com.ram.bean.UsersBean;
import com.ram.utility.ConnectionPool;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UsersDAO {
    static Connection conn; 
    public int registerUser(UsersBean ub){
        int r=0;
        conn=ConnectionPool.connectDB();//step1,step2
        //step3: write SQL Query
        String sql="insert into users(name,username,password) values(?,?,?)";
        //step4: Call 
        try {
            //step4: Create Object of PreparedStatement
            PreparedStatement pstmt=conn.prepareStatement(sql);
            //step5: call executeUpdate() method
       
            pstmt.setString(1, ub.getName());
            pstmt.setString(2, ub.getUserName());
            pstmt.setString(3, ub.getPassword());
            r=pstmt.executeUpdate();
            //step6: Close the Connection 
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }
    
    public int  loginCheck(String un,String ps){
        conn=ConnectionPool.connectDB();//step1,step2
        int r=0;
        //step3: Write Sql Query
        String sql="select uid from users where username=? and password=?";
        try {
            //step4: Create Object of PreparedStatement
            PreparedStatement pstmt=conn.prepareStatement(sql);
            //step5: call executeQuery method
            pstmt.setString(1, un);
            pstmt.setString(2, ps);
            
            ResultSet rs=pstmt.executeQuery();
            //step6: Process the Result
            if(rs.next()){
                r=rs.getInt("uid");
            }
            //step7: Close the Connection
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }
    public static void main(String[] args) {
        UsersBean u=new UsersBean();
        u.setName("aman");
        u.setUserName("aman123");
        u.setPassword("2222");
        
        
        UsersDAO ud=new UsersDAO();
        //1. call userRegister Method
        int r=ud.registerUser(u);//actual Argument
        if(r>0){
            System.out.println("Registration Success");
        }else{
            System.out.println("Registration Fail");
        }
//2. call loginCheck Method
//int x=ud.loginCheck("Ram123", "1111");
//if(x>0){
//    System.out.println("Login Success");
//}else{
//    System.out.println("Login Fail");
//}
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ram.bean;

import java.util.Arrays;

/**
 *
 * @author Admin
 */
public class Test {                //silent     listen
   public boolean isAnagram(String s,String t){
      if(s.length()!=t.length()){
          return false;
      }
       int count[]=new int[26];
       for(char c1:s.toCharArray()){
           count[c1-'a']++;//116-97=[19]++
       }
        for(char c1:t.toCharArray()){
           count[c1-'a']--;//110-97=[4]--
       }
       
        for(int i=0;i<count.length;i++){
            if(count[i]!=0){
               return false;
            }
        }
        return true;
       }
    public static void main(String[] args) {
       Test t=new Test();
        System.out.println(""+t.isAnagram("rat", "car"));

}
}
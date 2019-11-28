/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Marcos
 */
public class Conexion {
    
    Connection con;
    
    public Conexion(){
    
    try{
    
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventario","root","");
    
    
    
    } catch(ClassNotFoundException | SQLException e){
    
    System.err.print("Error:"+e);
    
    }
    
 
    }

    /**
     *
     * @return
     */
    public Connection getConnection(){
        return con;
    }

   
    
}

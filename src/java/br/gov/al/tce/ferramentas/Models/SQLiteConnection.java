/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.gov.al.tce.ferramentas.Models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author guilhermeramalho
 */
public class SQLiteConnection {
 
    public Connection conectar()
    {
        Connection conn = null;
        
        //Path Local
        String dbPath = "C:\\Users\\guilhermeramalho\\Documents\\NetBeansProjects\\BuscaPDF\\buscapdf.sqlite";
        
        //Path Servidor
        //String dbPath = "C:\\Users\\guilhermeramalho\\Documents\\NetBeansProjects\\BuscaPDF\\buscapdf.sqlite";
        
        try 
        {
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection("jdbc:sqlite:"+dbPath);
            System.out.println("Conexão com a base de dados estabelecida com sucesso.");
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SQLiteConnection.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Conexão com o banco de dados falhou! Classe não encontrada.");
        } catch (SQLException ex) {
            Logger.getLogger(SQLiteConnection.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Conexão com o banco de dados falhou! Exceção SQL.");
        }
        
        return conn;
    }
    
    public void desconectar(Connection conn)
    {
        try
        {
            conn.close();
            System.out.println("Conexão com o banco de dados encerrada com sucesso!");
        } catch (SQLException ex) {
            Logger.getLogger(SQLiteConnection.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Erro ao desconectar do banco! Exceção SQL.");
        }
    }
    
    
}

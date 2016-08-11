/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.gov.al.tce.ferramentas.Models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kerchenn
 */
public class ConexaoBD {

    public static Connection criarConexao() {
        try 
        {
            // Carregando o JDBC Driver padrão  
            String driverName = "com.mysql.jdbc.Driver";
            Class.forName(driverName);
            // Configurando a nossa conexão com um banco de dados//  
            String serverName = "localhost";    //caminho do servidor do BD  
            String mydatabase = "buscadiarios";        //nome do seu banco de dados  
            String url = "jdbc:mysql://" + serverName + "/" + mydatabase;
            String username = "root";        //nome de um usuário de seu BD        
            String password = "";      //sua senha de acesso  
            Connection connection = (Connection) DriverManager.getConnection(url, username, password);
            System.out.println(connection);
            System.out.println("Conectou");

            return connection;

        }   
        
        catch (ClassNotFoundException ex) 
        {
            Logger.getLogger(ConexaoBD.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Classe não encontrada.");
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(ConexaoBD.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Exception SQL.");
        }
       
        return null;
    }

    public void tratarParametros() {
        Connection conn = ConexaoBD.criarConexao();

        try {
            String sql = "SELECT * FROM `parametro`";
            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            RenomearArquivos ra = new RenomearArquivos();
            BuscaParaRenomear pb = new BuscaParaRenomear();

            while (rs.next()) {
                System.out.println(rs.getString("chave"));
//                System.out.println(rs.getString("chave1"));
//                String buscaFinal = new String();
//                StringBuffer bf = new StringBuffer();
                String nomeAquivo = rs.getString("chave");

//              String nomeAquivo1 = rs.getString("teste");
//              bf.append(nomeAquivo);
//              bf.append("");
//              bf.append(nomeAquivo1);

//                buscaFinal = bf.toString();
                //buscaComParser(nomeAquivo)
                pb.buscaParaRenomear(nomeAquivo);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConexaoBD.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Exception!!!");
        }
    }
}

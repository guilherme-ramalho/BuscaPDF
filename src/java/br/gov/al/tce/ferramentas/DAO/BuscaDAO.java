/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.gov.al.tce.ferramentas.DAO;

import br.gov.al.tce.ferramentas.Controllers.FabricaObjetos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author guilhermeramalho
 */
public class BuscaDAO {
    
    FabricaObjetos fabrica = new FabricaObjetos();
    PreparedStatement statement = null;
    
    public void insereDados(String termoBuscado)
    {
        Connection c = fabrica.fabricaSQLiteConn();
        
        String sql = "INSERT INTO busca (termo_busca, date() ) VALUES(?, ?)";
        
        try
        {
            statement = c.prepareStatement(sql);
            
            statement.setString(1, termoBuscado);
            
            statement.executeQuery();
            
            System.out.println("Registro inserido com sucesso!");
            
        } catch (SQLException ex) {
            Logger.getLogger(BuscaDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Erro ao inserir registro!");
        }
        finally{
            try {
                c.close();
            } catch (SQLException ex) {
                Logger.getLogger(BuscaDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}

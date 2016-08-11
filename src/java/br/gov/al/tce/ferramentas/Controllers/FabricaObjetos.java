/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.gov.al.tce.ferramentas.Controllers;

import br.gov.al.tce.ferramentas.Models.SQLiteConnection;
import java.sql.Connection;

/**
 *
 * @author guilhermeramalho
 */
public class FabricaObjetos {
    
    public Connection fabricaSQLiteConn()
    {
        SQLiteConnection conn = new SQLiteConnection();
        System.out.println("Objeto 'SQLiteConnection' fabricado com sucesso.");
        
        return (Connection) conn;
    }
}

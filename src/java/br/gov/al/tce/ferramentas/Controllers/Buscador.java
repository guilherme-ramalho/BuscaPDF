package br.gov.al.tce.ferramentas.Controllers;

import br.gov.al.tce.ferramentas.Models.BuscaPalavras;
import br.gov.al.tce.ferramentas.Models.BuscaParaRenomear;
import br.gov.al.tce.ferramentas.Models.ConexaoBD;

/**
 *
 * @author 
 */
public class Buscador {

    public static void main(String[] args) {
//Conn Guilherme Relatório: [
        //        Connection c;
        //        
        //        SQLiteConnection liteConn = new SQLiteConnection();
        //        
        //        c = liteConn.conectar();
        //        liteConn.desconectar(c);
//].

// Teste de busca: [
        BuscaParaRenomear b = new BuscaParaRenomear();
//        String parametro = JOptionPane.showInputDialog("Parametro de Busca");
//        Param para diário de justiça        
        String parametro = ("");
        b.buscaParaRenomear(parametro);
//].

// Teste de busca para renomear: [
//        BuscaParaRenomear br = new BuscaParaRenomear();
//        String parametro = JOptionPane.showInputDialog("Parametro de Busca");
// Param para diário de justiça        
//        String parametror1 = ("tjal.jus.br");
// Param para Diário Eletrônico  
//        String parametro2 = ("CIII");
//        br.buscaComParser(parametror);
//        br.buscaComParser(parametror2);
//].
//Conn Banco get param e Renomeação de PDF's
//        System.out.println("MAIN");
//        
//        ConexaoBD conn = new ConexaoBD();
//        conn.tratarParametros();
    }

}

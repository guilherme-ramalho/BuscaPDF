/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.gov.al.tce.ferramentas.Models;

import java.io.File;

/**
 *
 * @author pedrohonorato
 */
public class RenomearArquivos {

    public void renomearArquivo(String nomeArquivo, String nomeFinal) {
        System.out.println("Arquivo de Entrada: " + nomeArquivo + " Modelo de Saida: " + nomeFinal);
        File caminhoInicial = new File("N://BuscaPDF//arquivos-ib//docs-amostra//" + nomeArquivo);
        File caminihoFinal = new File("N://BuscaPDF//arquivos-ib//docs-renomeados//" + nomeFinal +"_"+ nomeArquivo);

        //Se existir o arquivo rename
        if (caminhoInicial.exists()) {

            boolean sucesso = caminhoInicial.renameTo(caminihoFinal);
            if (sucesso) {
                System.out.println("Novo Nome: "
                    + caminihoFinal.getAbsolutePath());
                System.out.println("Renomeado com sucesso.");
            } else {
                System.out.println("Erro ao renomear.");
            }
            
        } else {
            System.out.println(caminhoInicial.getAbsolutePath()
                    + " Não Existe !");
        }

//        boolean sucesso = caminhoInicial.renameTo(caminihoFinal);
//        if(sucesso)
//        {
//            System.out.println("Renomeado com sucesso.");
//        }
//        else
//        {
//            System.out.println("Erro ao renomear.");
//        }
    }

}

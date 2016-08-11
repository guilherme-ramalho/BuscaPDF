/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.gov.al.tce.ferramentas.Models;

import java.io.File;

/**
 *
 * @author chaves
 */
public class Uteis {
    public void apagaIndices(File diretorio) {
    if (diretorio.exists()) {
        File arquivos[] = diretorio.listFiles();
        for (File arquivo : arquivos) {
            arquivo.delete();
        }
    }
    }
}

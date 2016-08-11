/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.gov.al.tce.ferramentas.Models;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author guilhermeramalho
 */
public class ClassificaDiario {
    
    private String tipoFinal;
    
    //Método de replace criado para não precisar repetir código.
    public String replace(String data)
    {
        String replace = data.replace("-", "/");
        
        return replace;
    }
    
    //Método que retorna uma String com o tipo do diário baseado na nomenclatura
    //Recebida pela lista de arquivos que vem da classe 'BuscaPalavras'.
    public String tipoDiario(List lista, int i)
    {
        String data="01/01/1900";
        String dataReplace;
        
        //Se o padrão reconhecido for Diário Municipal retorna a String personalizada.
        if (lista.get(i).toString().contains("Diário_AMA_Oficial-Municipal")) {
         
            data = lista.get(i).toString().substring(0, 10);
            dataReplace = replace(data);
            tipoFinal = "Diário Municipal AMA - "+dataReplace;
        }
        //Se o padrão reconhecido for Diário Oficial do TCE retorna a String personalizada.
        else if (lista.get(i).toString().contains("Diário_Oficial_TCE-AL_Eletrônico")) {
            
            data = lista.get(i).toString().substring(0, 10);
            dataReplace = replace(data);
            tipoFinal = "Diário Oficial Eletrônico TCE/AL - "+dataReplace;
            
        }
        //Se o padrão reconhecido for Diário Oficial dos Municípios retorna a String personalizada.
        else if (lista.get(i).toString().contains("Diário_Oficial-Municipal")) {
            
            data = lista.get(i).toString().substring(0, 10);
            dataReplace = replace(data);
            tipoFinal = "Diário Oficial dos Municípios - "+dataReplace;
        }
        //Se o padrão reconhecido for Diário Oficial do Poder Executivo retorna a String personalizada.
        else if (lista.get(i).toString().contains("Diário_Oficial_Poder-Executivo")) {
            
            data = lista.get(i).toString().substring(0, 10);
            dataReplace = replace(data);
            tipoFinal = "Diário Oficial do Poder Executivo - "+dataReplace;
        }
        //Se nenhuma condição for comtemplada retorna uma String com um nome padrão
        //para que caso haja algum erro o layout do usuário não seja impactado.
        else{
            dataReplace = replace(data);
            tipoFinal = "Diário Oficial do Estado de Alagoas - "+dataReplace;
        }
        
        //Retorna a String.
        return tipoFinal;
    }
    
    //Converte texto em data
    public Date textoToDate(String textoData)
    {
        Date utilDate = new Date();
        
        if(textoData.length() > 10)
        {
            String data = textoData.substring(0, 10);
            
            String novaData = data.replace("-", "/");
            
            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
            
            try 
            {
                utilDate = (Date) format.parse(novaData);
                System.out.println("Data convertida com sucesso!");
            } catch (ParseException ex) {
                Logger.getLogger(ClassificaDiario.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Erro ao converter a data!");
            }
        }
        
        return utilDate;
    }

}
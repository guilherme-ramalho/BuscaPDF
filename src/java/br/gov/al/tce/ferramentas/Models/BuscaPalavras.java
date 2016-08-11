 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.gov.al.tce.ferramentas.Models;

import br.gov.al.tce.ferramentas.DAO.BuscaDAO;
import java.io.File;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.br.BrazilianAnalyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.SimpleFSDirectory;
import org.apache.lucene.util.Version;

/**
 *
 * @author guilhermeramalho
 * @author pedrohonorato
 */
public class BuscaPalavras {

    //  dir server 
    private String diretorioDoIndice = "C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/BuscaPDF/arquivos-ib/docs-index";
    
    //  dir work 
    //private String diretorioDoIndice = "N:\\BuscaPDF\\arquivos-ib\\docs-index";
    
    //dir teste-produção
    //private String diretorioDoIndice = "N:\\BuscaPDF\\arquivos-ib\\docs-renomeados\\Docs-Server\\docs-index";

    private BuscaDAO buscaDAO = new BuscaDAO();
    private List lista = new ArrayList();
    private List buscalista = new ArrayList();
    private ClassificaDiario cd = new ClassificaDiario();
    private Date dataDiario = new Date();
    
    //public List buscaComParser(String parametro, long tempoBusca, int totalOcorrencias) {
    public static int totalDocs = 0;

    public List buscaComParser(String parametro, long tempoBusca) {
            System.out.println("String Usada: " + parametro);
        try {
            //Estabelece o diretório onde os índices serão procurados.
            Directory diretorio = new SimpleFSDirectory(new File(diretorioDoIndice));
            //Lê o diretório onde os índices estão.
            IndexReader leitor = DirectoryReader.open(diretorio);
            //Faz a busca de texto no diretório previamente lido pelo 'IndexReader'
            IndexSearcher buscador = new IndexSearcher(leitor);
            //Processa os dados do texto e os converte em tokens.
            Analyzer analisador = new StandardAnalyzer(Version.LATEST);
            //Analyzer analisador = new BrazilianAnalyzer();

            QueryParser parser = new QueryParser(Version.LATEST, "Texto", analisador);

//            parser.setDefaultOperator(QueryParser.Operator.AND);

            Query consulta = parser.parse(parametro);

            Highlighter highlighter = new Highlighter(new QueryScorer(consulta));

            long inicio = System.currentTimeMillis();

            TopDocs resultado = buscador.search(consulta, 10000);

            long fim = System.currentTimeMillis();

            totalDocs = resultado.totalHits;

            tempoBusca = fim - inicio;
//            totalOcorrencias = "Total de documentos encontrados: "+ totalOcorrencias;
//            tempoBusca = "Tempo total para buscar: "+(fim - inicio)+"ms";

            System.out.println("Total de documentos encontrados:" + totalDocs);
            //System.out.println("Tempo total para busca: " + tempoBusca);

            for (ScoreDoc sd : resultado.scoreDocs) {
                Document documento = buscador.doc(sd.doc);

                //System.out.println("Caminho:" + documento.get("Caminho"));
                
                dataDiario = cd.textoToDate(documento.get("Caminho"));
                System.out.println("Data diário: "+ dataDiario);
                
                String ultMod = documento.get("UltimaModificacao");
                String dia = ultMod.substring(6, 8);
                String mes = ultMod.substring(4, 6);
                String ano = ultMod.substring(0, 4);

                //System.out.println("Ultima modificacao: " + dia + "/" + mes + "/" + ano);
//              System.out.println("Score:" + sd.score);
                //System.out.println("Pagina" + documento.get("pag"));
                highlighter.setTextFragmenter(new SimpleFragmenter(1000));
                String text = highlighter.getBestFragment(analisador, "", documento.get("Texto"));
                //System.out.println("Fragmento " + text);

                //Só adiciona na lista se o fragmento recuperado for diferente de 'null'.
                if(text != null)
                {
                    lista.add(documento.get("Caminho"));
                    //lista.add("Última modificação: " + dia + "/" + mes + "/" + ano);
                    lista.add("<b><font color='#135edd'>Fragmento:</font></b> " + text);
                    lista.add(dataDiario);
                }

            }
            leitor.close();

            //TODO VERIFICAR O MOTIVO DE NÃO ESTAR SENDO SALVO NO BANCO.
            //Insere os dados da busca no banco.
            //buscaDAO.insereDados(parametro);
        } catch (Exception e) {
            out.println(e);
        }
        return lista;
    }

    //Método que faz as validações nos campos
    public String validacoes(String filtroChecks, String municipioCombo, String buscar) {
        String buscaFinal = new String();
        String buscaFinalToLowerCase = new String();

        //Se 'filtroCheck' não é nulo e 'municipioCheck' não é nulo.
        if (filtroChecks != null && municipioCombo != null) {
            System.out.println("Filtro check e combo selecionado!");

            //StringBuffer que faz a junção das palavras.
            StringBuffer bf = new StringBuffer();
            bf.append(buscar);
            bf.append(" ");
            bf.append(filtroChecks);
            bf.append(" ");
            bf.append(municipioCombo);
            //String 'buscaFinal' recebe o valor do StringBuffer 'br' convertido em String.
            buscaFinal = bf.toString();
            //Converte toda a String em minúsculas
            buscaFinalToLowerCase = buscaFinal.toLowerCase();

            System.out.println("String formada: " + buscaFinalToLowerCase);
        } //Se 'filtroCheck' não é nulo e 'municipioCheck' é nulo e contém o texto 'null'.
        else if (filtroChecks != null && (municipioCombo == null || municipioCombo.contains("null"))) {
            System.out.println("Filtro check selecionado!");

            //StringBuffer que faz a junção das palavras.
            StringBuffer bf = new StringBuffer();
            bf.append(buscar);
            bf.append(" ");
            bf.append(filtroChecks);

            //String 'buscaFinal' recebe o valor do StringBuffer 'br' convertido em String.
            buscaFinal = bf.toString();
            //Converte toda a String em minúsculas
            buscaFinalToLowerCase = buscaFinal.toLowerCase();
        } //Se 'filtroCheck' é nulo e 'municipioCheck' não é nulo
        else if (filtroChecks == null && (municipioCombo != null && !municipioCombo.contains("null"))) {
            System.out.println("Filtro combo selecionado!");

            //StringBuffer que faz a junção das palavras.
            StringBuffer bf = new StringBuffer();
            bf.append(buscar);
            bf.append(" ");
            bf.append(municipioCombo);

            //String 'buscaFinal' recebe o valor do StringBuffer 'br' convertido em String.
            buscaFinal = bf.toString();
            //Converte toda a String em minúsculas
            buscaFinalToLowerCase = buscaFinal.toLowerCase();
        } else {
            System.out.println("Nenhum filtro selecionado!");

            buscaFinal = buscar;
            //Converte toda a String em minúsculas
            buscaFinalToLowerCase = buscaFinal.toLowerCase();
        }

        return buscaFinalToLowerCase;
    }
}

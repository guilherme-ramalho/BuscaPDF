/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package br.gov.al.tce.ferramentas.Models;


import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.SimpleFSDirectory;
import org.apache.lucene.util.Version;
import org.apache.tika.Tika;
/**
 *
 * @author 
 */
public class Indexador {
//    private static Logger logger = Logger.getLogger(Indexador.class);

// {1}
//dir. server
//    private String diretorioDosIndices = "C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/arquivos-ib/docs";
//dir. server
//    private String diretorioParaIndexar = "C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/arquivos-ib/docs-index";

//dir work   
    private String diretorioDosIndices = "N:\\BuscaPDF\\arquivos-ib\\docs-renomeados\\Docs-Server\\index";
//dir home
//    private String diretorioDosIndices = "C:/Users/Mala/Desktop/Buscapdf-1.0/web/docs-index";

// {2}
//dir work            
   private String diretorioParaIndexar = "N:\\BuscaPDF\\arquivos-ib\\docs-renomeados\\Docs-Server\\docs";

//dir home
//    private String diretorioParaIndexar = "C:/Users/Mala/Desktop/Buscapdf-1.0/web/docs";
    
// {3}
    private IndexWriter writer;
    // {4}
    private Tika tika;
    
     private List list = new ArrayList();

    public static void main(String[] args) {
    Indexador indexador = new Indexador();
    indexador.indexaArquivosDoDiretorio();
    }
    
    public static final long TEMPO = (10000 * 8640);

   private void apagaIndices(File diretorio) {
    if (diretorio.exists()) {
        File arquivos[] = diretorio.listFiles();
        for (File arquivo : arquivos) {
            arquivo.delete();
        }
    }
    }
   
   public void indexaArquivosDoDiretorio() {
    try {
        File diretorio = new File(diretorioDosIndices);
        apagaIndices(diretorio);
        // {5}
        Directory d = new SimpleFSDirectory(diretorio);
        System.out.println("Diretorio do indice: " + diretorioDosIndices);
        // {6}
        Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_CURRENT);
        // {7}
        IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_CURRENT, analyzer);
        // {8}
        writer = new IndexWriter(d, config);
        long inicio = System.currentTimeMillis();
        indexaArquivosDoDiretorio(new File(diretorioParaIndexar));
         // {12}
        writer.commit();
        writer.close();
        long fim = System.currentTimeMillis();
        System.out.println("Tempo para indexar: " + ((fim - inicio) / 1000) + "s");
    } catch (IOException e) {
        System.out.println(e);
    }
    }
   

    public void indexaArquivosDoDiretorio(File raiz) {
    FilenameFilter filtro = new FilenameFilter() {
        public boolean accept(File arquivo, String nome) {
            if (nome.toLowerCase().endsWith(".pdf")
                    || nome.toLowerCase().endsWith(".odt")
                    || nome.toLowerCase().endsWith(".doc")
                    || nome.toLowerCase().endsWith(".docx")
                    || nome.toLowerCase().endsWith(".ppt")
                    || nome.toLowerCase().endsWith(".pptx")
                    || nome.toLowerCase().endsWith(".xls")
                    || nome.toLowerCase().endsWith(".txt")
                    || nome.toLowerCase().endsWith(".rtf")) {
                return true;
            }
            return false;
        }
    };
    
    for (File arquivo : raiz.listFiles(filtro)) {
        if (arquivo.isFile()) {
            StringBuffer msg = new StringBuffer();
            msg.append("Indexando o arquivo ");
            msg.append(arquivo.getAbsoluteFile());
            msg.append(", ");
            msg.append(arquivo.length() / 1000);
            msg.append("kb");
            System.out.println(msg);
            list.add(msg);
            try {
                // {9}
                int pagina=1;
                String pag = String.valueOf(pagina);
                String textoExtraido = getTika().parseToString(arquivo);
                indexaArquivo(arquivo, textoExtraido,pag);
                pagina++;
            } catch (Exception e) {
                System.out.println(e);
            }
        } else {
            indexaArquivosDoDiretorio(arquivo);
        }
    }
    }

    private List indexaArquivo(File arquivo, String textoExtraido, String pagina) {
    SimpleDateFormat formatador = new SimpleDateFormat("yyyyMMdd");
    String ultimaModificacao = formatador.format(arquivo.lastModified());
//    String pagina =;
    // {10}
    Document documento = new Document();
    documento.add(new TextField("UltimaModificacao", ultimaModificacao,org.apache.lucene.document.Field.Store.YES));
    documento.add(new TextField("Caminho", arquivo.getName(),org.apache.lucene.document.Field.Store.YES));
    documento.add(new TextField("Texto", textoExtraido,org.apache.lucene.document.Field.Store.YES));
    documento.add(new TextField("Pagina", pagina,org.apache.lucene.document.Field.Store.YES));
    
    
    try {
        // {11}
        getWriter().addDocument(documento);
    } catch (IOException e) {
        System.out.println(e);
    }
    return list;
    }   

    public Tika getTika() {
    if (tika == null) {
        tika = new Tika();
    }
    return tika;
    }

    public IndexWriter getWriter() {
    return writer;
    }
}

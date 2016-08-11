

<%@page import="br.gov.al.tce.ferramentas.Buscador"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="br.gov.al.tce.ferramentas.Uteis"%>
<%@page import="br.gov.al.tce.ferramentas.PDFToJPGConverter"%>
<%
    File file = new File("C:/Users/Mala/Desktop/BuscaPDF-dev/web/img_pdf");
   Uteis u = new Uteis();
//    u.apagaIndices(file);
    
    String pdf = request.getParameter("pdf");
    PDFToJPGConverter pdfToImage = new PDFToJPGConverter();
    List paginas = pdfToImage.convertPDFToJPG("/pdfs", "C:/Users/Mala/Desktop/BuscaPDF-dev/web/docs/" + pdf,pdf);


%>
<html>

    <head>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link href="booklet/jquery.booklet.latest.css" type="text/css" rel="stylesheet" media="screen, projection, tv" />
        <!-- jQuery -->
        <script src="//ajax.googleapis.com//ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script> window.jQuery || document.write('<script src="booklet/jquery-2.1.3.min.js"><\/script>')</script>
        <!-- jQuery UI (optional) -->
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
        <script> window.jQuery.ui || document.write('<script src="booklet/jquery-ui-1.10.4.custom.min.js"><\/script>')</script>
        <!-- Booklet -->
        <script src="booklet/jquery.easing.1.3.js"></script>
        <script src="booklet/jquery.booklet.latest.min.js"></script> 
        <script>
            $(function () {
                //single book
                $('#mybook').booklet({height:'100%',width: '95%' });

             
            });
        </script>
        <title>JSP Page</title>
    </head>
    <body style="background:#ccc ">
        <h1> <%
          out.print(pdf);
 %>
        </h1>
    
    <div id="mybook">
            <%
                for (int i = 0; i < paginas.size(); i++) {
                   
                    out.println("<div>");
                    out.println("<a href='abrir_imagem.jsp?img="+ paginas.get(i)+"&pdf="+pdf+"'><img style='width:100%;height:100%' src='img_pdf/" + paginas.get(i) + "'/></a>");
                    out.println("</div>");
                }
            %>
     </div>

        <%-- <a href='img_pdf/"+ paginas.get(i)+"'  target='_blank'></a>--%>
            <%
                 out.println("<div>");
                 out.print("<a download='pdfs/"+pdf+"' href='pdfs/"+pdf+"'>"+pdf+"</a>");
                 out.println("</div>");

            %>
            
    </body>
   
</html>
<%-- 
    Document   : abrir_imagem
    Created on : 23/01/2015, 09:55:54
    Author     : chaves
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.gov.al.tce.ferramentas.Buscador"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="br.gov.al.tce.ferramentas.Uteis"%>
<%@page import="br.gov.al.tce.ferramentas.PDFToJPGConverter"%>
<!DOCTYPE html>
<%
    File file = new File("C:/Users/Mala/Desktop/BuscaPDF-dev/web/img_pdf/");
    String img = request.getParameter("img");
    String pdf = request.getParameter("pdf");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        out.print("<div>");
         out.print("<a href='transforma_imagem.jsp?pdf=" +pdf+"'> <img src='img/botao-voltar.png' height='50px' width='100px'/></a>");
          out.print("</div>");
           out.print("<center>");
         out.println("<img width:'1684px' height:'2382px' src='img_pdf/" + img + "'/>");
           out.print("</center>");
        %> 
</html>

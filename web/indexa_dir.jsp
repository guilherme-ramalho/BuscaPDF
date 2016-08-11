<%-- 
    Document   : busca_pdf
    Created on : 16/01/2015, 08:15:22
    Author     : 
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.gov.al.tce.ferramentas.Buscador"%>
<%@page import="br.gov.al.tce.ferramentas.Indexador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/estilo.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">
            @import url("CSS/estilo.css");
        </style>
        <title>Indexador</title>
        <script>

        </script>
    </head>
    <body>
        <center>
            <form action="#" method="post" >
                <table id="tblindex"> 
                    <tr>
                          <td colspan="2">
                              Indexar: <input type="text" name="indexar"/>
                        </td>
                        <td colspan="2">
                            <input type="submit" value="Pesquisar"/>
                        </td>
                       
                    </tr>
                    <% request.setCharacterEncoding("UTF-8");
                     out.print("<h3>Indexando</h3>");
                        if (request.getParameter("indexar") != null) {
                           
                            Indexador indexador = new Indexador();
                            indexador.indexaArquivosDoDiretorio();

                            //                List list = new ArrayList();
                            //                out.print("<table border='0' width='800px' height='100px'>");
                            //                for (int i = 0; i < list.size(); i++) {
                            //                    //                              testelista= (List) lista.get(i);          
                            //                    //                            for (int cont = 0; cont <testelista.size(); cont++){
                            //                    out.print("<tr>");
                            //                    out.print("<td>");
                            ////                                out.print("<a href='transforma_imagem.jsp?pdf="+lista.get(i)+"'>"+lista.get(i)+"</a>");
                            //                        out.print("</td>");
                            //                    out.print("</tr>");
                            //                    i++;
                            //                    out.print("<tr>");
                            //                    out.print("<td>");
                            //                    out.print(list.get(i));
                            //                    out.print("</td>");
                            //                    out.print("</tr>");
                            //                    i++;
                            //                    out.print("<tr>");
                            //                    out.print("<td>");
                            //                    out.print(list.get(i) + "<hr />");
                            //                    out.print("</td>");
                            //                    out.print("</tr>");
                            //
                            //                }
                            //                //                            testelista.clear();
                            //                out.print("</table>");
                        }

                    %>

                </table>
            </form>

        </div>    
    </center> 

</body>
</html>

<%-- 
    Document   : index
    Created on : 15/01/2015, 17:45:49
    Author     : pedro
--%>
<%@page import="br.gov.al.tce.ferramentas.Models.Indexador"%>
<%@page import="br.gov.al.tce.ferramentas.Controllers.Buscador"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]> <html class="ie7"> <![endif]-->  
<!--[if IE 8]>     <html class="ie8"> <![endif]-->  
<!--[if IE 9]>     <html class="ie9"> <![endif]-->  
<!--[if IE 11]>     <html class="ie11"> <![endif]-->  
<!--[if !IE]><!-->             
<html>
    <!--<![endif]-->
    <head>
        <title>Buscador - TCE/AL</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
            @import url("CSS/estilo.css");
        </style>

        <link href="CSS/estilo.css" rel="stylesheet" type="text/css"/>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

        <script>
            $(document).ready(function () {
                var domContent = $("#content");

                $(".nav-link").click(function () {
                    domContent.load($(this).attr("href"));
                    return false;
                });
            });
        </script>

    </head>

    <body>
        <div id="acessodiario" >
            <a href="http://www.doeal.com.br/" target="_blank"><img id="imgbtndoeal" src="img/doeal.png" style="height: 30px; width: 240px; border: 1px dotted #000;"/></a> 
            <a href="http://www.diariomunicipal.com.br/ama/" target="_blank"><img id="imgbtndomal" src="img/domal.png" style="height: 30px; width: 240px; border: 1px dotted #000;"/></a> 
            <a href="http://e-diariooficial.com/" target="_blank"><img id="imgbtndodu" src="img/dodu.png" style="height: 30px; width: 240px; border: 1px dotted #000;"/></a> 
            <a href="http://e-diariooficial.com/publicacoes/" target="_blank"><img id="imgbtndoem" src="img/doem.png" style="height: 30px; width: 240px; border: 1px dotted #000;"/></a> 
            <a href="http://www2.tjal.jus.br/cdje/index.do" target="_blank"><img id="imgbrndoej" src="img/doje.png" style="height: 30px; width: 240px; border: 1px dotted #000;"/></a>          
        </div>
        <div id="geral">
            <div id="header">
                <h1>Tribunal de Contas do Estado de Alagoas</h1>
                <img id="imglogo" src="img/brasao-alagoas.png"/>
            </div>

            <div id="nav">
                <a class="nav-link" href="busca_pdf.jsp" style="display: none;"><img id="imgbtnbusca" src="img/botao-buscar.png"/></a> 
                <a class="nav-link" href="indexa_dir.jsp" style="display: none;"><img id="imgbtnindex" src="img/botao-indexar.png"/></a>
            </div>

            <div id="content">
                <h1>Buscas nos Diários Oficiais</h1>
            </div>
            <div id="divbusca">
                <%@ include file="busca_pdf.jsp" %>
            </div>
            <center>
            </center>
        </div>
    </body>
</html>

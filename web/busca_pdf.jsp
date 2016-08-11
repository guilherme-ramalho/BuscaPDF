<%-- 
     Document   : busca_pdf
     Created on : 16/01/2015, 08:15:22
     Author     : Pedro
     Author     : Guilherme
--%>

<%@page import="br.gov.al.tce.ferramentas.Models.ClassificaDiario"%>
<%@page import="br.gov.al.tce.ferramentas.Models.BuscaPalavras"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
        <title>Buscador</title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>   
        
        <script type="text/javascript">
            function abreFecha(obj) {

                switch (obj.value) {
                    case '0':
                        document.getElementById('grupo1').style.display = "none";
                        document.getElementById('grupo2').style.display = "none";
                        document.getElementById('grupo3').style.display = "none";
                        document.getElementById('grupo4').style.display = "none";
                        document.getElementById('grupo5').style.display = "none";
                        document.getElementById('grupo6').style.display = "none";
                        break

                    case '1':
                        document.getElementById('grupo1').style.display = "block";
                        document.getElementById('grupo2').style.display = "none";
                        document.getElementById('grupo3').style.display = "none";
                        document.getElementById('grupo4').style.display = "none";
                        document.getElementById('grupo5').style.display = "none";
                        document.getElementById('grupo6').style.display = "none";
                        break

                    case '2':
                        document.getElementById('grupo1').style.display = "none";
                        document.getElementById('grupo2').style.display = "block";
                        document.getElementById('grupo3').style.display = "none";
                        document.getElementById('grupo4').style.display = "none";
                        document.getElementById('grupo5').style.display = "none";
                        document.getElementById('grupo6').style.display = "none";
                        break

                    case '3':
                        document.getElementById('grupo1').style.display = "none";
                        document.getElementById('grupo2').style.display = "none";
                        document.getElementById('grupo3').style.display = "block";
                        document.getElementById('grupo4').style.display = "none";
                        document.getElementById('grupo5').style.display = "none";
                        document.getElementById('grupo6').style.display = "none";
                        break

                    case '4':
                        document.getElementById('grupo1').style.display = "none";
                        document.getElementById('grupo2').style.display = "none";
                        document.getElementById('grupo3').style.display = "none";
                        document.getElementById('grupo4').style.display = "block";
                        document.getElementById('grupo5').style.display = "none";
                        document.getElementById('grupo6').style.display = "none";
                        break

                    case '5':
                        document.getElementById('grupo1').style.display = "none";
                        document.getElementById('grupo2').style.display = "none";
                        document.getElementById('grupo3').style.display = "none";
                        document.getElementById('grupo4').style.display = "none";
                        document.getElementById('grupo5').style.display = "block";
                        document.getElementById('grupo6').style.display = "none";
                        break

                    case '6':
                        document.getElementById('grupo1').style.display = "none";
                        document.getElementById('grupo2').style.display = "none";
                        document.getElementById('grupo3').style.display = "none";
                        document.getElementById('grupo4').style.display = "none";
                        document.getElementById('grupo5').style.display = "none";
                        document.getElementById('grupo6').style.display = "block";
                        break
                }
            }
        </script>

    </head>
    <body>
        <center>
            <form action="#" method="post" >
                <table> 
                    <tr>
                    <tr>
                        <td colspan="2">
                            <br/><b>Buscar Por:</b><br> <input type="text" name="buscar" size="40px;"/><br><hr>
                            <b>Selecione o Municipio:</b><br>
                            <select name="optmunicipio" id="optmunicipio" onchange="abreFecha(this);">
                                <option value="0">Escolha o Grupo</option>
                                <option value="1">Grupo I</option>  
                                <option value="2">Grupo II</option> 
                                <option value="3">Grupo III</option> 
                                <option value="4">Grupo IV</option> 
                                <option value="5">Grupo V</option> 
                                <option value="6">Grupo VI</option> 
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div id="grupo1" style="display: none;" >
                                <select id="selgrupo1" name="selgrupo1" multiple="multiple" size="8">
                                    <option value="" selected>Selecione o município</option>
                                    <option value="anadia">Anadia</option>
                                    <option value="atalaia">Atalaia</option>
                                    <option value="belém">Belém</option>
                                    <option value="boca mata">Boca da Mata</option>
                                    <option value="cajueiro">Cajueiro</option>
                                    <option value="capela">Capela</option>
                                    <option value="chã preta">Chã Preta</option>
                                    <option value="estrela alagoas">Estrela de Alagoas</option>
                                    <option value="igaci">Igaci</option>
                                    <option value="mar vermelho">Mar Vermelho</option>
                                    <option value="maribondo">Maribondo</option>
                                    <option value="palmeira índios">Palmeira dos Índios</option>
                                    <option value="paulo jacinto">Paulo Jacinto</option>
                                    <option value="pindoba">Pindoba</option>
                                    <option value="Quebrangulo">Quebrangulo</option>
                                    <option value="tanque d'arca">Tanque D'Arca</option>
                                    <option value="viçosa">Viçosa</option>
                                </select>
                            </div>

                            <div id="grupo2" style="display: none;">

                                <select name="selgrupo2" id="selgrupo2" multiple="multiple" size="8">
                                    <option value="" selected>Selecione o município</option>
                                    <option value="barra santo antônio">Barra de Santo Antônio</option>
                                    <option value="barra são miguel">Barra de São Miguel</option>
                                    <option value="branquinha">Branquinha</option>
                                    <option value="coqueiro seco">Coqueiro Seco</option>
                                    <option value="jequiá praia">Jequiá da Praia</option>
                                    <option value="maceió">Maceió</option>
                                    <option value="marechal deodoro">Marechal Deodoro</option>
                                    <option value="messias">Messias</option>
                                    <option value="murici">Murici</option>
                                    <option value="paripueira">Paripueira</option>
                                    <option value="pilar">Pilar</option>
                                    <option value="rio largo">Rio Largo</option>
                                    <option value="roteiro">Roteiro</option>
                                    <option value="santa luzia do norte">Santa Luzia do Norte</option>
                                    <option value="santana mundaú">Santana do Mundaú</option>
                                    <option value="são miguel campos">São Miguel dos Campos</option>
                                    <option value="satuba">Satuba</option>
                                    <option value="união palmares">União dos Palmares</option>
                                </select>
                            </div>

                            <div id="grupo3" style="display: none;">

                                <select name="selgrupo3" id="selgrupo3" multiple="multiple" size="8">
                                    <option value="" selected>Selecione o município</option>
                                    <option value="campo alegre">Campo Alegre</option>
                                    <option value="campo grande">Campo Grande</option>                                                                     
                                    <option value="coité nóia">Coité do Nóia</option>
                                    <option value="coruripe">Coruripe</option>
                                    <option value="feira grande">Feira Grande</option>
                                    <option value="feliz deserto">Feliz Deserto</option>
                                    <option value="igreja nova">Igreja Nova</option>
                                    <option value="junqueiro">Junqueiro</option>
                                    <option value="limoeiro anadia">Limoeiro de Anadia</option>
                                    <option value="olho d'água grande">Olho D'água Grande</option>
                                    <option value="penedo">Penedo</option>
                                    <option value="piaçabuçu">Piaçabuçu</option>
                                    <option value="porto real colégio">Porto Real do Colégio</option>
                                    <option value="são bras">São Brás</option>
                                    <option value="são sebastiao">São Sebastião</option>
                                    <option value="taquarana">Taquarana</option>
                                    <option value="teotônio vilela">Teotônio Vilela</option>
                                </select>
                            </div>

                            <div id="grupo4" style="display: none;">

                                <select name="selgrupo4" id="selgrupo4" multiple="multiple" size="8">
                                    <option value="" selected>Selecione o município</option>
                                    <option value="arapiraca">Arapiraca</option>
                                    <option value="batalha">Batalha</option>
                                    <option value="belo monte">Belo Monte</option>
                                    <option value="cacimbinhas">Cacimbinhas</option>
                                    <option value="craíbas">Craíbas</option>
                                    <option value="dois riachos">Dois Riachos</option>
                                    <option value="girau ponciano">girau do ponciano</option>
                                    <option value="jacaré homens">Jacaré dos Homens</option>
                                    <option value="jaramataia">Jaramataia</option>
                                    <option value="lagoa canoa">Lagoa da Canoa</option>
                                    <option value="major isidoro">Major Isidoro</option>
                                    <option value="minador negrão">Minador do Negrão</option>
                                    <option value="monteirópolis">Monteirópolis</option>
                                    <option value="olho d'água flores">Olho D'água das Flores</option>
                                    <option value="olivença">Olivença</option>
                                    <option value="traipu">Traipu</option>
                                </select>
                            </div>

                            <div id="grupo5" style="display: none;">
                                <select name="selgrupo5" id="selgrupo5" multiple="multiple" size="8">
                                    <option value="" selected>Selecione o município</option>
                                    <option value="campeste">Campeste</option>
                                    <option value="colônia leopoldina">Colônia Leopoldina</option>
                                    <option value="flexeiras">Flexeiras</option>
                                    <option value="ibateguara">Ibateguara</option>
                                    <option value="jacuípe">Jacuípe</option>
                                    <option value="japaratinga">Japaratinga</option>
                                    <option value="joaquim gomes">Joaquim Gomes</option>
                                    <option value="jundiá">Jundiá</option>
                                    <option value="maragogi">Maragogi</option>
                                    <option value="matriz camaragibe">Matriz de Camaragibe</option>
                                    <option value="novo lino">Novo Lino</option>
                                    <option value="passo camaragibe">Passo de Camaragibe</option>
                                    <option value="porto pedras">Porto de Pedras</option>
                                    <option value="porto calvo">Porto Calvo</option>
                                    <option value="são josé laje">São José da Laje</option>
                                    <option value="são luiz quintunde">São Luiz do Quintunde</option>
                                    <option value="são miguel milagres">São Miguel dos Milagres</option> 
                                </select>
                            </div>

                            <div id="grupo6" style="display: none;">

                                <select name="selgrupo6" id="selgrupo6" multiple="multiple" size="8">
                                    <option value="" selected>Selecione o município</option>
                                    <option value="água branca">Água Branca</option>
                                    <option value="canapi">Canapi</option>
                                    <option value="carneiros">Carneiros</option>
                                    <option value="delmiro golveia">Delmiro Golveia</option>
                                    <option value="inhapi">Inhapi</option>
                                    <option value="maravilha">Maravilha</option>
                                    <option value="mata grande">Mata Grande</option>
                                    <option value="olho d'água casado">Olho D'água do Casado</option>
                                    <option value="ouro branco">Ouro Branco</option>
                                    <option value="palestina">Palestina</option>
                                    <option value="pão açúcar">Pão de Açúcar</option>
                                    <option value="pariconha">Pariconha</option>
                                    <option value="poço trincheiras">Poço de Trincheiras</option>
                                    <option value="santana ipanema">Santana do Ipanema</option>
                                    <option value="são josé tapera">São Jose da Tapera</option>
                                    <option value="senador rui palmeira">Senador Rui Palmeira</option>
                                </select>                               
                            </div>
                        </td>
                    </tr>


                    <td colspan="3">
                        <hr/>
                        <b>Selecione um Filtro:</b><br>
<!--                        <form name="filtros">                           -->
                            <input id="contratoCheckbox" type="checkbox" name="filtro" value="contrato">Contrato 
                            <input id="atoDeCheckbox" type="checkbox" name="filtro" value="ato">Ato
                            <input id="processoCheckbox" type="checkbox" name="filtro" value="processo">Processo
                            <input id="prefeituraCheckbox" type="checkbox" name="filtro" value="prefeitura">Prefeitura  
                            <input id="municipioCheckbox" type="checkbox" name="filtro" value="município">Município
                            <input id="departamentoCheckbox" type="checkbox" name="filtro" value="departamento">Departamento
                            <input id="chamadaPublicaCheckbox" type="checkbox" name="filtro" value="chamada pública">Chamada pública
                            <input id="concorrenciaCheckbox" type="checkbox" name="filtro" value="concorrência">Concorrência<br>
                            <input id="conviteCheckBox" type="checkbox" name="filtro" value="convite">Convite
                            <input id="editalCheckBox" type="checkbox" name="filtro" value="edital">Edital
                            <input id="leilaoCheckBox" type="checkbox" name="filtro" value="leilão">Leilão
                            <input id="pregaoCheckBox" type="checkbox" name="filtro" value="pregão">Pregão
                            <input id="rdcCheckBox" type="checkbox" name="filtro" value="regime diferenciado contratação">Regime diferenciado da contratação
                            <input id="shoppingCheckBox" type="checkbox" name="filtro" value="shopping">Shopping
                            <input id="pregaoCheckBox" type="checkbox" name="filtro" value="pregão">Pregão<br>
                            <input id="tomadaPrecoCheckBox" type="checkbox" name="filtro" value="tomada técnica preços">Tomada técnica de preços
                            <input id="ataRegPrecoCheckBox" type="checkbox" name="filtro" value="Ata registro preço">Ata de registro de preço
                            <input id="dispensaCheckBox" type="checkbox" name="filtro" value="dispensa">Dispensa
                            <input id="inexigibilidadeCheckBox" type="checkbox" name="filtro" value="inexigibilidade">Inexigibilidade
                            <input id="decisaoSimplesCheckBox" type="checkbox" name="filtro" value="decisão simples">Decisão Simples<br>
                            <input id="dirigenciaCheckBox" type="checkbox" name="filtro" value="dirigência">Dirigência
                            
                            <br><hr>
                            
<!--                            IMPLEMENTANDO O FILTRO ANO-->
<!--                            <b>Pesquisar diários por ano</b><br>
                            <select name="anos" id="anos">
                                <option value="0">Selcionar ano</option>
                                <option value="2016">2016</option>
                            </select>-->
                    </td>
                    </tr>

                    <tr>
                    <div id="nav1">
                        <a href="index.jsp"> <img id="imgvolta" src="img/botao-voltar.png"/></a> 
                    </div>
                    <center>
                        <td colspan="2" align="center">
                            <button type="submit"><img src="img/botao_pesquisar.gif" alt="submit" title="submit"></button>                        
                        </td>
                    </center>
                    </tr>
                </table>
                <div id="divretorno">
                    <% request.setCharacterEncoding("UTF-8");

                        //Se o parâmetro inserido na busca não for nulo executa o requerimento baseado no parâmetro
                        if (request.getParameter("buscar") != null) {
                            //Boolean que determina qual o parâmetro de pesquisa que deverá ser usado.
                            //Boolean parametroBusca = false;
                            //Separador
                            System.out.println("----------------------------");
                                                        
                            //Pega o valor que foi buscado no input text e adiciona na String.
                            String buscar = request.getParameter("buscar");
                            System.out.println("Selecionado na busca: " + buscar);

                            //Pega os valores que foram selecionados nos Checkbox e adiciona na String.
                            String[] filtroChecks = null;
                            String filtroStr = null;
                            StringBuffer bf = new StringBuffer();
                            filtroChecks = request.getParameterValues("filtro");
                            if (filtroChecks != null) {
                                for (int i = 0; i < filtroChecks.length; ++i) {
                                    //StringBuffer que faz a junção dos filtros.

                                    bf.append(filtroChecks[i]);
                                    bf.append(" ");

                                }
                                filtroStr = bf.toString();
                                System.out.println("Selecionado no filtro: " + filtroStr);
                            }

                            String[] municipioCombo = null;
                            String municipioStr = null;
                            StringBuffer fb = new StringBuffer();
                            //Pega o valor que foi selecionado no dropdown list e adiciona na String.
                            String grupoSelecionado = request.getParameter("optmunicipio");

                            //Condicionais para determinar qual parâmetro será setado para o municipioCombo
                            if (grupoSelecionado.contains("1")) {
                                municipioCombo = request.getParameterValues("selgrupo1");
                                if (municipioCombo != null) {
                                    for (int i = 0; i < municipioCombo.length; ++i) {
                                        //StringBuffer que faz a junção dos municipios.
                                        fb.append(municipioCombo[i]);
                                        fb.append(" ");

                                    }
                                    municipioStr = fb.toString();

                                    System.out.println("Selecionado(s) no combo de municípios: " + municipioStr);
                                }

                            };
                            if (grupoSelecionado.contains("2")) {
                                municipioCombo = request.getParameterValues("selgrupo2");
                                if (municipioCombo != null) {
                                    for (int i = 0; i < municipioCombo.length; ++i) {
                                        //StringBuffer que faz a junção dos municipios.
                                        fb.append(municipioCombo[i]);
                                        fb.append(" ");

                                    }
                                    municipioStr = fb.toString();

                                    System.out.println("Selecionado(s) no combo de municípios: " + municipioStr);
                                }

                            };
                            if (grupoSelecionado.contains("3")) {
                                municipioCombo = request.getParameterValues("selgrupo3");
                                if (municipioCombo != null) {
                                    for (int i = 0; i < municipioCombo.length; ++i) {
                                        //StringBuffer que faz a junção dos municipios.
                                        fb.append(municipioCombo[i]);
                                        fb.append(" ");

                                    }
                                    municipioStr = fb.toString();

                                    System.out.println("Selecionado(s) no combo de municípios: " + municipioStr);
                                }

                            };
                            if (grupoSelecionado.contains("4")) {
                                municipioCombo = request.getParameterValues("selgrupo4");
                                if (municipioCombo != null) {
                                    for (int i = 0; i < municipioCombo.length; ++i) {
                                        //StringBuffer que faz a junção dos municipios.
                                        fb.append(municipioCombo[i]);
                                        fb.append(" ");

                                    }
                                    municipioStr = fb.toString();

                                    System.out.println("Selecionado(s) no combo de municípios: " + municipioStr);
                                }

                            };
                            if (grupoSelecionado.contains("5")) {
                                municipioCombo = request.getParameterValues("selgrupo5");
                                if (municipioCombo != null) {
                                    for (int i = 0; i < municipioCombo.length; ++i) {
                                        //StringBuffer que faz a junção dos municipios.
                                        fb.append(municipioCombo[i]);
                                        fb.append(" ");

                                    }
                                    municipioStr = fb.toString();

                                    System.out.println("Selecionado(s) no combo de municípios: " + municipioStr);
                                }

                            };
                            if (grupoSelecionado.contains("6")) {
                                municipioCombo = request.getParameterValues("selgrupo6");
                                if (municipioCombo != null) {
                                    for (int i = 0; i < municipioCombo.length; ++i) {
                                        //StringBuffer que faz a junção dos municipios.
                                        fb.append(municipioCombo[i]);
                                        fb.append(" ");

                                    }
                                    municipioStr = fb.toString();

                                    System.out.println("Selecionado(s) no combo de municípios: " + municipioStr);
                                }

                            };

                            //Instância do objeto 'BuscaPalavras'
                            BuscaPalavras bp = new BuscaPalavras();
                            List lista = null;
                            String buscaFinal = null;

                            //Objeto de tratamento que valida os termos da busca.
                            buscaFinal = bp.validacoes(filtroStr, municipioStr, buscar);

                            long tempoBusca = 0;

                            //Objeto de que recebe os termos de busca.
                            lista = bp.buscaComParser(buscaFinal, tempoBusca);

                            out.print("<table border='0' style='width='650px' height='100px'>");
                            out.print("<hr/>");

                            if (buscar == "" && filtroStr == null && municipioCombo == null) {
                                out.print("<b>Por favor, verifique os parâmetros de busca e tente novamente. </b>");
                            } else {

                                if (buscar == null || buscar.isEmpty() || buscar.equals(" ")) {
                                    buscar = "Busca vazia";
                                }

                                if (municipioStr == null) {
                                    municipioStr = "Sem filtro";
                                }

                                if (filtroStr == null) {
                                    filtroStr = "Sem filtro";
                                }
                            }
//                            //TODO - Verificar por que não recupera o valor.
//                                out.println("Palavras-Chave: [<b> " + buscar + " </b>],  Filtro Municípios: [<b> " + municipioStr + " </b>], Filtro Checkbox: [<b> " + filtroStr + " </b>]");
//                                out.println("<br>Tempo de busca: " + tempoBusca + "<br>");
//                                out.println("Total de ocorrências: " + totalOcorrencias);
//                                out.println("<hr/>");
//                            }

                            //Informa que nenhum arquivo foi encontrado se a lista retornar vazia.
                            if (lista.isEmpty()) {
                                out.println("<tr>");
                                out.println("<td>");
                                out.println("Nenhum arquivo encontrado.");
                                out.println("</td>");
                                out.println("</tr>");
                            } else {

                                out.print("<b>Palavras-Chave:</b> [<font color='red'>" + buscar + "</font>], "
                                        + "<b>Filtro Municípios:</b> [<font color='red'>" + municipioStr + "</font>], "
                                        + "<b>Filtro Checkbox:</b> [<font color='red'>" + filtroStr + "</font>]<br>");
//                                out.println("<b>Tempo de busca:</b> " + tempoBusca + " ms" + "<br>");
                                out.println("<b>Total de documentos encontrados: </b> " + "[<font color='red'>" + BuscaPalavras.totalDocs + " documentos</font>]<hr>");
                                
//                               out.println("<hr/>");
                            }
                            
                                                        
                                for (int i = 0; i < lista.size(); i++) {

                                    //Objeto que classifica o nome do diário
                                    ClassificaDiario cd = new ClassificaDiario();
                                    String tipoDiario = cd.tipoDiario(lista, i);
                                    
                                    out.print("<tr>");
                                    out.print("<td>");
                                    out.print("<a href='arquivos-ib/docs/" + lista.get(i) + "' target='_blank'>"+ tipoDiario +"</a>");
                                    out.print("</td>");
                                    out.print("</tr>");
                                    i++;
//                                    out.print("<tr>");
//                                    out.print("<td>");
//                                    out.print("<b><font color = '#022e78'>");
//                                    out.print(lista.get(i));
//                                    out.print("</font></b>");
//                                    out.print("</td>");
//                                    out.print("</tr>");
//                                    i++;
                                    out.print("<tr>");
                                    out.print("<td>");
                                    out.print(lista.get(i));
                                    out.print("<hr />");
                                    out.print("</td>");
                                    out.print("</tr>");
                                   
                                    i++;

                                }                            
                                out.print("</table>");
                            }
                        
                    %>
            </form>
        </div>    
    </center> 

</body>
</html>

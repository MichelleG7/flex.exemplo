<%-- 
    Document   : agendamento
    Created on : 11/05/2024, 12:48:10
    Author     : jxavi
--%>

<%@page import="model.Agendamento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.AgendamentoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function confirmarExclusao(id, servico, pet, data) {
                if (confirm('Deseja realmente excluir o agendamento ' + servico + ' de ' + pet + ' para a data de: '+ data +' ?')) {
                    location.href = 'GerenciarAgendamento?acao=delete&id=' + id;
                }
            }
        </script>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <%

            String username = (String) session.getAttribute("u");
            if (username == null) {
                response.sendRedirect("./index.jsp");
            } else {
                out.println("Bem vindo, " + username);
            }

        %>
        <a class="btn btn-link" href="AutenticaFuncionario?acao=logoff">Sair</a>
        <h1>Lista de Agendamentos</h1>
        <a href="./form_agendamento.jsp">Adicionar novo agendamento</a>
        <table class="table table-success table-striped-columns table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Periodo</th>
                    <th>Pet</th>
                    <th>Serviço</th>
                    <th>Valor</th>
                    <th colspan="2">Opções</th>
                </tr>
            </thead>
            <%                ArrayList<Agendamento> lista = new ArrayList<Agendamento>();
                try {
                    AgendamentoDAO aDAO = new AgendamentoDAO();
                    lista = aDAO.getLista();
                } catch (Exception e) {
                    out.print(e);
                }
                for (Agendamento a : lista) {

            %>
            <tr>
                <td><%= a.getId()%></td>
                <td><%= a.getPeriodo()%></td>
                <td><%= a.getPet()%></td>
                <td><%= a.getServico()%></td>
                <td><%= a.getValor()%></td>
                <td><a href="GerenciarAgendamento?acao=alterar&id=<%= a.getId()%>"><button class="btn btn-primary">Alterar</button></a></td>
                <td><button class="btn btn-danger" onclick="confirmarExclusao(<%= a.getId()%>, '<%= a.getServico()%>', '<%= a.getPet()%>', '<%= a.getPeriodo()%>')">Excluir</button></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>

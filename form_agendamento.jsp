<%-- 
    Document   : agendamento
    Created on : 11/05/2024, 12:38:12
    Author     : jxavi
--%>

<%@page import="model.Agendamento"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    
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
        <h1>Agendamento</h1>
        <form method="post" action="GerenciarAgendamento">
            <input name="id" type="hidden" value="${agendamento.id}"/>
            <div class="mb-3">
                <label class="form-label">Periodo</label>
                <input class="form-control" name="periodo" type="datetime-local" value="${agendamento.periodo}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Pet</label>
                <input class="form-control" name="pet" type="text" value="${agendamento.pet}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Serviço</label>
                <input class="form-control" name="servico" type="text" value="${agendamento.servico}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Valor</label>
                <input class="form-control" name="valor" type="number" step="any" value="${agendamento.valor}"/>
            </div>
            <input class="btn btn-primary" type="submit" value="Adicionar"/>

        </form>
    


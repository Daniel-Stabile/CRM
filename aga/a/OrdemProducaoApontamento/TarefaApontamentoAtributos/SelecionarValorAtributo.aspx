<%@ Page Title="Selecionar Valor Atributos" Language="C#"  Inherits="Benner.Corporativo.Wes.WebApp.aga.a.OrdemProducaoApontamento.TarefaApontamentoAtributos.TarefaApontamentoAtributosSelecionarValorAtributoPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDVALORES" Title="Valores" UserDefinedSelectColumnVisible ="false" UserDefinedDisableRowSelection="true" DisplayRowCommand="True"/>
        </div>
    
      </asp:Content>
    
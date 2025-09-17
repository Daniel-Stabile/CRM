<%@ Page Title="Seleciona Fórmula" Language="C#" Inherits="aga.a.Tributos.SelecionaFormula,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="SELECIONAFRMULAAPURACAO" Title="Seleciona fórmula apuracao" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="TR_FILTROS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="SELECIONAFORMULA" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $(document).ready(function(){
    $("#SELECIONAFRMULAAPURACAO").on("click", ".column-action", function(){
        // Atribui a variavel o valor da linha do grid.
        var valor = "{" +  $(this).parent().find( ".text-left > a" ).first().text() + "}";
        
        // Cria um input temporário para receber o valor do grid,
        // e a partir dele é realizado o clipboard.
        var dummy = document.createElement("input");
        document.body.appendChild(dummy);
        dummy.setAttribute("id", "dummy_id");
        dummy.value = valor;
        
        dummy.select();
        document.execCommand("copy");
        
        // Remove o input temporário após a cópia.
        document.body.removeChild(dummy);
    });
});

              </script>
      </asp:Content>
    
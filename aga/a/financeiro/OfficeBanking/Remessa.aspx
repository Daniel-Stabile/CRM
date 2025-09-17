<%@ Page Title="Remessa" Language="C#" Inherits="aga.a.Financeiro.OfficeBanking.Remessa,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="REMESSA" Title="Remessa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_HBREMESSAS.PGTOAUTO.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_REMESSA" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="TTULOSDAREMESSA" Title="Parcelas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="REMESSA" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_PARCELAREMESSAS.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REMESSA = @CAMPO(HANDLE) AND A.PARCELA IN (SELECT HANDLE FROM FN_PARCELAS WHERE REMESSA = @CAMPO(HANDLE))" FormUrl="~/aga/e/financeiro/zoomdeparcelas/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_REMESSA" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="TRANSFERENCIAS" Title="Transferências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="REMESSA" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TS_LANCAMENTOSREMESSA.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REMESSA = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_REMESSA" Level="20" Order="40"  />
        </div>
    
        <script type="text/javascript">
              $(function(){
    
    $('#top-CMD_AlterarParcelas').hide();
    $(document).on('click', function(e){
        
        if (e.srcElement != undefined && e.srcElement.type == 'checkbox') {
            var habilitarAlteracao = $('input[type="checkbox"]:checked', $('#ctl00_Main_TTULOSDAREMESSA_SimpleGrid')).length > 0;
            
            if (habilitarAlteracao) {
                $('#top-CMD_AlterarParcelas').show();
            }
            else{
                $('#top-CMD_AlterarParcelas').hide();
            }
        }
    })
    
    $('#ctl00_Main_TTULOSDAREMESSA_SimpleGrid > tbody > tr').each(function(i, tr){
        var colValor = $('td', $(tr)).last()[0].innerText;
        if (colValor == 'S') {
            $('#CMD_CALCULARRETENCOES_record', $(tr)).attr('disabled','disabled').attr('readonly','readonly').attr('href','#');
            
        }
    })
})

              </script>
      </asp:Content>
    
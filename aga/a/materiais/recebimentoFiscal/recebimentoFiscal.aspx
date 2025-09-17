<%@ Page Title="Recebimento fiscal" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="RECEBIMENTOFISCAL" Title="Recebimento fiscal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS_RECEBIMENTOFISCAL.GRID" DefaultFilterName="Rec. Fiscal" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ABRANGENCIA = 'R'" FormUrl="~/aga/a/materiais/recebimentoFiscal/recebimentoFiscalForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_RECEBIMENTOFISCAL_RECEBIMENTOFISCAL" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    
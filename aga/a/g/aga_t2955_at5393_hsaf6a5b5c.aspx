<%@ Page Title="Aguardando NF" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Aguardando NF" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_IE_INVOICES.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 7 AND @MODULO IN (SELECT B.HANDLE FROM Z_ARVORES B WHERE ((A.EXPIMP='E' AND B.NOME = 'EXPORTACAO')  OR (A.EXPIMP='I' AND B.NOME = 'IMPORTACAO')) AND B.HANDLE = @MODULO))" FormUrl="~/aga/a/f/aga_t2955_at5393_hsaf6a5b5c.aspx" UserDefinedDisableRowSelection="False" PageId="IE_CARGA_INVOICES_IMP_EDIT__AGUARDANDO_NF_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    
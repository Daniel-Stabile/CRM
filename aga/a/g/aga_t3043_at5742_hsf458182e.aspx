<%@ Page Title="Financeiro - Trimestral" Language="C#" Inherits="aga.a.contabil.DIOPS.DIOPSTrimestral,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Financeiro - Trimestral" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CT_ANSPERIODOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="TIPO = 2" FormUrl="~/aga/a/f/aga_t3043_at5742_hsf458182e.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    
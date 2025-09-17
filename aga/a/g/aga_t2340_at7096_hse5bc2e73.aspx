<%@ Page Title="Saem com agendamentos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Saem com agendamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MA_RECURSOS.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPO = 1 OR A.TIPO = 4) AND (A.TIPOREGISTRO = 1) AND (A.ATIVO = 'S') AND A.SEMAGENDAMENTO = 'N'" FormUrl="~/aga/a/f/aga_t2340_at7096_hse5bc2e73.aspx" UserDefinedDisableRowSelection="False" PageId="MF_PORTARIA__VEICULOS_COM_AGENDAMENTO_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    
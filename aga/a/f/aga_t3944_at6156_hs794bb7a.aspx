<%@ Page Title="Adoção CPC" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Adoção CPC" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_AT_ADOCAOCPCS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_ITENS_DO_ATIVO__ADOCAOCPC_FORM" Level="20" Order="1"  />
        <wes:AjaxForm runat="server" ID="WIDGET_6157" Title="Adição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_AT_ITENS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.ADOCAOCPCS = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_DE_ITENS_DO_ATIVO__ADOCAOCPC_FORM" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="WIDGET_6159" Title="Critério de cálculo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_AT_ITEMCRITERIOSCALCULO.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.ADOCAOCPCS = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_DE_ITENS_DO_ATIVO__ADOCAOCPC_FORM" Level="20" Order="15"  />
        <wes:AjaxForm runat="server" ID="WIDGET_6160" Title="Transferência" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_AT_ITEMMOVIMENTACOES.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.ADOCAOCPCS = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_DE_ITENS_DO_ATIVO__ADOCAOCPC_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    
<%@ Page Title="Portaria" Language="C#" CodeFile="~/Frotas/a/Movimentacao/Portaria/Grid.aspx.cs" Inherits="PortariaGridPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="PORTARIA" Title="Portaria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="MF_AGENDA.PORTARIA_SAIDA_RETORNO_MENU.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/Frotas/e/Movimentacao/Portaria/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTARIA_SAIDA_RETORNO" Level="20" Order="10"  />
        </div>
    
        <style>
              .label-roxo {
    background: #EEE5FF;
}

.letra-roxo {
    text-shadow: none!important;
    font-size: 16px;
    font-weight: 300;
    padding: 3px 10px;
    color: #8950FC;
    font-family: Open Sans,sans-serif;
}

.label-amarelo {
    background: #FFF4DE;
}

.letra-amarelo {
    text-shadow: none!important;
    font-size: 16px;
    font-weight: 300;
    padding: 3px 10px;
    color: #FFA800;
    font-family: Open Sans,sans-serif;
}

.label-azul {
    background: #C9F7F5;
}

.letra-azul {
    text-shadow: none!important;
    font-size: 16px;
    font-weight: 300;
    padding: 3px 10px;
    color: #1BC5BD;
    font-family: Open Sans,sans-serif;
}

.label-vermelho {
    background: #FFE2E5;
}

.letra-vermelho {
    text-shadow: none!important;
    font-size: 16px;
    font-weight: 300;
    padding: 3px 10px;
    color: #F64E60;
    font-family: Open Sans,sans-serif;
}

              </style>
      </asp:Content>
    
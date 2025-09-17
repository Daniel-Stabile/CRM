<%@ Page Title="Apuração DIFAL / FCP" Language="C#" Inherits="aga.a.Tributos.apuracoes.apuracoesApuracaoDIFALFCPPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="APURAODIFALFCP" Title="Apuração DIFAL / FCP" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="TR_APURACOESDIFAFCP.VERSAO0002.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_APURACOES_APURACAODIFALFCP" Level="20" Order="10"  />
        </div>
    
        <style>
              #ctl00_Main_APURAODIFALFCP_GERAL{
    padding-top: 0;
}

#ctl00_Main_APURAODIFALFCP_FilterContainer{
    padding-bottom: 0;
}

#ctl00_Main_APURAODIFALFCP_GERAL > div:first-child > div:nth-child(3) > .form-group{
    width: calc(100% + 17px);
}

#ctl00_Main_APURAODIFALFCP_GERAL > div:first-child > div:nth-child(4) > .form-group{
    width: 65%;
    margin-left: 40%;
}

#ctl00_Main_APURAODIFALFCP_GERAL > div:first-child > div:nth-child(5) > .form-group{
    width: 65%;
     margin-left: 5%;
}

              </style>
      </asp:Content>
    
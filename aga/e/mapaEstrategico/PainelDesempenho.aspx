<%@ Page Title="Painel Desempenho" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
    <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    
    <div class="row">
      
      <div class="col-md-6">
        <div class="row">
          <wes:ActionView runat="server" ID="DESEMPENHOINDICADOR" Title="Desempenho Indicador" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" Controller="GaugeChart" Action="ObterDadosDesempenho" PageId="PAINEL_DESEMPENHO" Level="20" Order="10"  />
        </div>
        <div class="row">
            <wes:ActionView runat="server" ID="PERSPETIVAS" Title="Perspectivas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" Controller="GaugeChart" Action="ObterDadosDesempenhoPerspectiva" PageId="PAINEL_DESEMPENHO" Level="20" Order="30"  />
            <wes:ActionView runat="server" ID="OBJETIVOS" Title="Objetivos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" Controller="GaugeChart" Action="ObterDadosDesempenhoObjetivo" PageId="PAINEL_DESEMPENHO" Level="20" Order="40"  />
        </div>
      </div>

      <wes:ActionView runat="server" ID="METAS" Title="Metas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" Controller="MetaIndicadores" Action="ObterDadosMetas" PageId="PAINEL_DESEMPENHO" Level="20" Order="20"  />

    </div>

<style>

    #ctl00_Main_DESEMPENHOINDICADOR_UpdatePanel > div.containerChart > div.chartContainer{
    height: 350px;
    }

    #ctl00_Main_DESEMPENHOINDICADOR_UpdatePanel > div.containerChart > div.chartContainer > div > svg > g > g:nth-child(2) > g:nth-child(2) > g > g:nth-child(3)
    {
    display: none;
    }

    #ctl00_Main_PERSPETIVAS_UpdatePanel > div.containerChart > div.chartContainer{
    height: 250px;
    }

    #ctl00_Main_PERSPETIVAS_UpdatePanel > div.divTile, 
    #ctl00_Main_PERSPETIVAS_UpdatePanel > div.containerTable,
    #ctl00_Main_PERSPETIVAS_UpdatePanel > div.containerChart > div.divImagem,
    #ctl00_Main_PERSPETIVAS_UpdatePanel > div.divSubtitulo,
    #ctl00_Main_PERSPETIVAS_UpdatePanel > div.divResponsavel,
    #ctl00_Main_PERSPETIVAS_UpdatePanel > div.divDescricao,
    #ctl00_Main_PERSPETIVAS_UpdatePanel > div.containerPeriodoPeso,
    #ctl00_Main_PERSPETIVAS_UpdatePanel > div.containerChart > div.chartContainer > div > svg > g > g:nth-child(2) > g:nth-child(2) > g > g:nth-child(3)
    {
    display: none;
    }

    #ctl00_Main_OBJETIVOS_UpdatePanel > div.containerChart > div.chartContainer{
    height: 250px;
    }

    #ctl00_Main_OBJETIVOS_UpdatePanel > div.divTile, 
    #ctl00_Main_OBJETIVOS_UpdatePanel > div.containerTable,
    #ctl00_Main_OBJETIVOS_UpdatePanel > div.containerChart > div.divImagem,
    #ctl00_Main_OBJETIVOS_UpdatePanel > div.divSubtitulo,
    #ctl00_Main_OBJETIVOS_UpdatePanel > div.divResponsavel,
    #ctl00_Main_OBJETIVOS_UpdatePanel > div.divDescricao,
    #ctl00_Main_OBJETIVOS_UpdatePanel > div.containerPeriodoPeso,
    #ctl00_Main_OBJETIVOS_UpdatePanel > div.containerChart > div.chartContainer > div > svg > g > g:nth-child(2) > g:nth-child(2) > g > g:nth-child(3)
    {
    display: none;
    }

    #ctl00_Main_METAS_UpdatePanel > div.divChart > div > svg > g > g:nth-child(2) > g:nth-child(2) > g > g:nth-child(7){
      display: none;
    }

</style>

    </asp:Content>
    
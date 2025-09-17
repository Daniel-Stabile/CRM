<%@ Page Title="Requisição de cadastro de item" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.RequisicaoDeCadastroDeItem" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="REQUISIODECADASTRODEITENS" Title="Requisição de cadastro de itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_PRODUTOSPAI.REQUISICAO_CADASTRO_ITEM.GRID" DefaultFilterName="Filtro" Mode="FixedRequired" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/aga_t1772_at8229_hs7e597db2.aspx" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_REQUISICAODECADASTRODEITEM" Level="20" Order="10"  />
        </div>
    
        <style>
              #ctl00_Main_REQUISIODECADASTRODEITENS_GERAL{
    padding-top: 0;
}
 
#ctl00_Main_REQUISIODECADASTRODEITENS_FilterContainer{
    padding-bottom: 0;
}

#ctl00_Main_REQUISIODECADASTRODEITENS_GERAL > div:first-child > div:nth-child(3) > .form-group{
    width: 140%;
}
 
#ctl00_Main_REQUISIODECADASTRODEITENS_GERAL > div:first-child > div:nth-child(4) > .form-group{
    width: 65%;
    margin-left: 40%;
}
 
#ctl00_Main_REQUISIODECADASTRODEITENS_GERAL > div:first-child > div:nth-child(5) > .form-group{
    width: 65%;
    margin-left: 5%;
}

              </style>
      </asp:Content>
    
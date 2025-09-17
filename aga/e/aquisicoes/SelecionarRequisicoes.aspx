<%@ Page Title="SELECIONAR_REQUISICOES_PARA_AQUISICOES" Language="C#" CodeFile="~/aga/e/aquisicoes/SelecionarRequisicoes.aspx.cs" Inherits="aquisicoesSelecionarRequisicoesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp"
    TagPrefix="wes" %>
    <%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components"
      TagPrefix="wes" %>

      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
        <div class="portlet light">
          <div class="tabbable-line">
            <ul class="nav nav-tabs">
              <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REQUISIES" class="active"><a
                  data-toggle="tab" href="#tabREQUISIES">Requisições</a></li>
              <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSAQUISIO"><a data-toggle="tab"
                  href="#tabITENSAQUISIO">Itens Aquisição</a></li>
              <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REQUISIESDAAQUISIO"><a data-toggle="tab"
                  href="#tabREQUISIESDAAQUISIO">Requisições da aquisição</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tabREQUISIES">
                <div class="row">
                  <wes:SimpleGrid runat="server" ID="REQUISIES" Title="Requisições" Subtitle="" PortletCssClass=""
                    PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId=""
                    ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False"
                    EntityViewName="LC_REQUISICOES.AQUISICOES.GRID" DefaultFilterName="Padrão" Mode="Fixed"
                    UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False"
                    DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch"
                    UserDefinedCriteriaWhereClause=" A.ORIGEM &lt;&gt; 3 AND A.STATUS = 2" ShowExport="True"
                    UserDefinedDisableRowSelection="False" PageId="AGA_A_AQUISICOES_SELECIONARREQUISICOES" Level="20"
                    Order="10" />
                </div>
                <div class="row">
                  <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass=""
                    PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true"
                    ProviderWidgetUniqueId="REQUISIES" ChromeState="fixed" CanDelete="True" CanUpdate="True"
                    CanInsert="True" EntityViewName="LC_REQUISICAOITENS_AQUISICAO.DATASOURCE.GRID" Mode="Selectable"
                    UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False"
                    DisplayRowCommand="True" CompanyFilterMode="OnlyCompany"
                    UserDefinedCriteriaWhereClause="A.REQUISICAO = @CAMPO(HANDLE)" ShowExport="True"
                    UserDefinedDisableRowSelection="False" PageId="AGA_A_AQUISICOES_SELECIONARREQUISICOES" Level="20"
                    Order="20" />
                </div>
              </div>
              <div class="tab-pane" id="tabITENSAQUISIO">
                <div class="row">
                  <wes:SimpleGrid runat="server" ID="ITENSAQUISIO" Title="Itens Aquisição" Subtitle=""
                    PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false"
                    ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False"
                    CanInsert="False" EntityViewName="LC_AQUISICAOITENS.SELREQ.GRID" Mode="Selectable"
                    UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False"
                    DisplayRowCommand="True" CompanyFilterMode="OnlyCompany"
                    UserDefinedCriteriaWhereClause="A.AQUISICAO = @~SESSAO(AQUISICAO_SELECIONADA)" ShowExport="True"
                    UserDefinedDisableRowSelection="False" PageId="AGA_A_AQUISICOES_SELECIONARREQUISICOES" Level="20"
                    Order="30" />
                </div>
              </div>
              <div class="tab-pane" id="tabREQUISIESDAAQUISIO">
                <div class="row">
                  <wes:SimpleGrid runat="server" ID="REQUISIESDAAQUISIO" Title="Requisições da aquisição" Subtitle=""
                    PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false"
                    ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False"
                    CanInsert="False" EntityViewName="LC_REQUISICOES.REQDAAQUISICAO.GRID" Mode="Selectable"
                    UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False"
                    DisplayRowCommand="True" CompanyFilterMode="OnlyCompany"
                    UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT NUMEROREQUISICAO FROM LC_AQUISICAOITENS WHERE AQUISICAO = @~SESSAO(AQUISICAO_SELECIONADA))"
                    ShowExport="True" UserDefinedDisableRowSelection="False"
                    PageId="AGA_A_AQUISICOES_SELECIONARREQUISICOES" Level="20" Order="40" />
                </div>
              </div>
            </div>
          </div>
        </div>

      </asp:Content>
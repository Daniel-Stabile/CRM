<%@ Page Title="Visitas" Language="C#" Inherits="PortalRepresentante.Visitas.WizardVisita, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components.WebControls" TagPrefix="wes" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server">
    <%--CSS para mudar ordem dos campos "Voltar" e "Próximo"--%>
    <style>
        .btn-cancel {
            float: left;
            margin-right: 5px;    
        }        
    </style>
<asp:UpdatePanel ID="UpdatePanelPassoAtual" runat="server" UpdateMode="Always">
    <ContentTemplate>
    <asp:HiddenField runat="server" ID="PassoAtual" Value="1" ClientIDMode="Static" />
    </ContentTemplate>
</asp:UpdatePanel>
<div class="row">
  <div class="col-md-12">
    <div class="portlet light" id="formularioWizard">
      <div class="portlet-body form">
        <div class="form-wizard">
          <div class="form-body">
            <ul class="nav nav-pills nav-justified steps">
              <li>
                  <a data-toggle="tab" class="step" href="#tab1">
                      <span class="number">1</span>
                      <span class="desc"><i class="fa fa-check"></i>Geral</span>
                  </a>
              </li>
              <li>
                  <a data-toggle="tab" class="step" href="#tab2">
                      <span class="number">2</span>
                      <span class="desc"><i class="fa fa-check"></i>Visita</span>
                  </a>
              </li>
              <li>
                  <a data-toggle="tab" class="step" href="#tab3">
                      <span class="number">3</span>
                      <span class="desc"><i class="fa fa-check"></i>Avaliações</span>
                  </a>
              </li>
            </ul>
            <div id="bar" class="progress progress-striped" role="progressbar">
              <div class="progress-bar progress-bar-success"></div>
            </div>
            <div class="tab-content">
                <div class="tab-pane active" id="tab1">
                    <wes:AjaxForm runat="server" ID="FormularioGeral" coma  Title="Geral" BootstrapCols="12" UserDefinedCommandsVisible="True" UserDefinedCriteriaWhereClause="" IncludeRecordInRecentItems="True" CanInsert="True" CanUpdate="True" CanDelete="True" ChromeState="Normal" EntityViewName="VT_CM_VISITA_GERAL.CUSTOM.FORM" ShowTitle="True" PageWidgetHandle="235"  />
                </div>
                <div class="tab-pane" id="tab2">
                    <wes:AjaxForm runat="server" ID="FormularioVisita" Title="Visita" BootstrapCols="12" UserDefinedCommandsVisible="True" UserDefinedCriteriaWhereClause="" IncludeRecordInRecentItems="True" CanInsert="True" CanUpdate="True" CanDelete="True" ChromeState="Normal" EntityViewName="VT_CM_VISITA_VISITA.CUSTOM.FORM" ShowTitle="True" PageWidgetHandle="236"  />
                </div>
                <div class="tab-pane" id="tab3">                      
                    <wes:AjaxForm runat="server" ID="FormularioAvaliacao"  Title="Avaliações" BootstrapCols="12" UserDefinedCommandsVisible="True" UserDefinedCriteriaWhereClause="" IncludeRecordInRecentItems="True" CanInsert="True" CanUpdate="True" CanDelete="True" ChromeState="Normal" EntityViewName="VT_CM_VISITAAVALIACAO.CUSTOM.FORM" ShowTitle="True" PageWidgetHandle="240"  />                                                                                  
                        <asp:UpdatePanel ID="PainelAvaliacao" runat="server" UpdateMode="Always">                                                                                                                                                                                 
                        <ContentTemplate runat="server">                           
                            <wes:MessagePanel runat="server" ID="PainelMensagem"></wes:MessagePanel>                                                                                      
                            <%--LinkButton de Finalizar criado para não precisar criar comandos do WES, devido problema quando não possuir Datasource--%>
                            <asp:LinkButton runat="server" ID="btnFinalizar" OnClick="btnFinalizar_Click" CssClass="btn cmd-action btn green">
                                <i class="fa fa-check-circle btn-action">                        
                                </i>
                                Finalizar
                            </asp:LinkButton>
                                                                                    
                            <div class="portlet light">
                                <div class="portlet-title">
					                <div class="caption">
                                        <span class="caption-subject font-green-sharp bold uppercase">Avaliações </span><span class="caption-helper">lista de todas as avaliações</span>
					                </div>
            				    </div>                                   
                                <div class="portlet-body">
                                    <asp:UpdatePanel ID="PanelConfirmacao" runat="server" UpdateMode="Always">                                    
                                        <ContentTemplate runat="server">
                                            <%--<wes:MessagePanel runat="server" ID="PainelMensagem"></wes:MessagePanel>--%>                                        
                                            <asp:GridView runat="server"  ID="GridAvaliacoes" OnRowCommand="GridAvaliacoes_RowCommand" >
                                                <Columns>                                                
                                                    <asp:ButtonField ButtonType="Button" CommandName="ExcluirAvaliacao" Text="Excluir"> 
                                                        <ControlStyle CssClass="btn btn-xs btn-square red" />
                                                    </asp:ButtonField>                                                    
                                                </Columns>
                                            </asp:GridView>                                        
                                        </ContentTemplate>                           
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </ContentTemplate>  
                    </asp:UpdatePanel>                    
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
        <script runat="server">
        protected override void LoadWebPartConnections()
        {
        }
        </script><script type="text/javascript">
                     $(function () {
                         // default form wizard
                         $('#formularioWizard').bootstrapWizard({
                             onTabClick: function (tab, navigation, index, clickedIndex) {
                                 return false;
                             },
                             onNext: function (tab, navigation, index) {
                             },
                             onPrevious: function (tab, navigation, index) {
                             },
                             onTabShow: function (tab, navigation, index) {
                                 var total = navigation.find('li').length;
                                 var current = index + 1;
                                 var $percent = (current / total) * 100;
                                 $('#formularioWizard').find('.progress-bar').css({
                                     width: $percent + '%'
                                 });
                                 $("#PassoAtual").val(current);
                             }
                         });

                         selectCurrentStep = function () {
                             var currentStep = $("#PassoAtual").val();
                             $('a[href="#tab' + currentStep + '"]').tab('show');
                             <%--Remover altertas do tipo info--%>
                             $('.form-wizard .alert-info').remove();                             
                         };

                         // Application event handlers for component developers.
                         var prm = Sys.WebForms.PageRequestManager.getInstance();
                         if (!prm.get_isInAsyncPostBack()) {
                             prm.add_endRequest(function (sender, args) {
                                 selectCurrentStep();
                             });
                         }

                         selectCurrentStep();
                     });
      </script>
      </asp:content>

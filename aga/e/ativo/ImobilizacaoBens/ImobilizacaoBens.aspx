<%@ Page Title="Imobilização de Bens" Language="C#"  Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Ativo.ImobilizacaoBens.ImobilizacaoBensImobilizacaoBensPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components.UI" TagPrefix="wes_ui" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server">
    <div class="portlet light">
        <div class="row">
            <div class="col-md-12 widget  portlet-default ">
                    <div class="col-lg-4 col-md-4 col-sm-4" title="QTDEIMOBILIZAR">
                        Quantidade a imobilizar
                        <input name="QTDEIMOBILIZAR" type="text" value="90" id="QTDEIMOBILIZAR" runat="server"  
                            class="form-control  auto-numeric"   data-v-min="-2147483648" data-v-max="2147483647">
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4" title="INCREMENTAPLAQUETA">
                        Incrementar plaqueta ao invés do sufixo
                    <wes_ui:BooleanControl runat="server" ID="INCREMENTAPLAQUETA" />
                    </div>
            </div>
        </div>
    </div>
    <div class="row">

        <wes:AjaxForm runat="server" ID="IMOBILIZAODEBENS" Title="Imobilização de Bens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AT_ITENS.IMOBILIZACAOBENS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AT_IMOBILIZACAO_BENS" Level="20" Order="10" />
    </div>




</asp:content>

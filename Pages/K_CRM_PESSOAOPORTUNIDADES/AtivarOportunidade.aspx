<%@ Page Title="Confirma Ativacao Oportunidade" Language="C#" CodeFile="~/Pages/K_CRM_PESSOAOPORTUNIDADES/AtivarOportunidade.aspx.cs" Inherits="K_CRM_PESSOAOPORTUNIDADESAtivarOportunidadePage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="K_OPORTUNIDADE" Title="Oportunidade" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="K_CRM_PESSOAOPORTUNIDADES.READONLY.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_ATIVAROPORTUNIDADE" Level="50" Order="10"  />
        </div>
<div class="row portlet light" style="height: 100%">
        <div style="display: block; width: 100%; text-align: center;">
            <span style="font-size:large;">Deseja realmente ativar a oportunidade? Ao ativar a oportunidade, será possível a edição da oportunidade somente em nova versão.
            </span>
            <br /><br />
            <div style="display: flex; justify-content:space-around">
                <asp:Button ID="BtnConfirmar" runat="server" Text="Sim" CssClass="btn btn-action red" />
                <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-action default" />
            </div>
            <br />
        </div>
    </div>    
      </asp:Content>
    
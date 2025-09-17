<%@ Page Title="Inclur Operador" Language="C#" CodeFile="~/Frotas/e/CentroDeManutencoes/Complemento/Operador/Form.aspx.cs" Inherits="OperadorFormPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="portlet light">
        <div class="row">
            <div class="col-md-12" style="margin-left: 6px;margin-bottom:15px;">
                <div class="col-md-3">
                    <asp:Label ID="lblCPF" runat="server" Text="CPF" />
                    <asp:TextBox ID="txtCPF" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-3">
                    <asp:Label ID="Label1" runat="server" Text="Nome" />
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ReadOnly="true" />
                </div>

                <div class="col-md-3" style="margin-top: 18px;">
                    <asp:LinkButton ID="btnCadastra_Click" runat="server" ToolTip="Adicionar Registro" CssClass="btn white"><i class="icon-grid"></i></asp:LinkButton>
                </div>
                
            </div>

        <wes:SimpleGrid runat="server" ID="OPERADOR" Title="Operador" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="MF_UNIDADEABASTECIMENTOPESSOAS.OPERADOR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="INCLUIR_INFORMACOES_OPERADOR" Level="20" Order="10"  />
        </div>
    </div>





</asp:Content>

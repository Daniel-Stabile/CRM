<%@ Control Language="C#" AutoEventWireup="true" Inherits="Benner.Tecnologia.Wes.Components.WebApp.EntityFieldsVisibilityControl" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components.UI" TagPrefix="wesUI" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal"></button>
    <h4 class="modal-title"><Label> Configuração de visibilidade dos campos </Label> </h4>
</div>
<div class="modal-body">
    <div class="input-group">
        <asp:TextBox ID="txtSearch" CssClass="form-control" placeholder="Filtrar..." runat="server"></asp:TextBox>
        <span class="input-group-btn">
            <asp:LinkButton runat="server" CssClass="btn btn-default" ID="btnClearSearch" Text="X">
                <i class="fa fa-rotate-left"></i>
            </asp:LinkButton>
        </span>
    </div>
    <div class="list-fields">
        <asp:GridView ID="gridFields" runat="server" AutoGenerateColumns="false" OnRowDataBound="GridFields_RowDataBound">
            <Columns>
                <asp:BoundField HeaderText="Campo" DataField="FieldName" />
                <asp:TemplateField HeaderText="Visibilidade">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlVisibility" runat="server" class="form-control" DataField="VisibilityCurrent" >
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</div>
<div class="modal-footer">
    <asp:LinkButton ID="btnSave" AutoPostBack="true" CssClass="btn green" OnClientClick="$('#listFields').modal('hide')" OnClick="OnSaveClick" runat="server">Salvar</asp:LinkButton>
    <button type="button" class="btn default" data-dismiss="modal">Cancelar</button>
</div>

<asp:HiddenField runat="server" ID="hdnEntityHandle" />
<asp:HiddenField runat="server" ID="hdnEntityName" />
<asp:HiddenField runat="server" ID="hdnTaskHandle" />

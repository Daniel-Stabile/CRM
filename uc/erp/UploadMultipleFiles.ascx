<%@ Control Language="C#" AutoEventWireup="true" Inherits="uc_erp_UploadMultipleFiles" CodeFile="~/uc/ERP/UploadMultipleFiles.ascx.cs" %>
<script src="<%=ResolveClientUrl("~/content/assets/plugins/dropzone/dropzone.js")%>" type="text/javascript"></script>
<script src="<%=ResolveClientUrl("~/content/js/erp/uploadMultipleFiles.js")%>" type="text/javascript"></script>
<link href="<%=ResolveClientUrl("~/content/assets/plugins/dropzone/css/dropzone.css")%>" rel="stylesheet" type="text/css" />
<div>
    <asp:UpdatePanel ID="upControls" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div runat="server" id="messagePanel" />
            <asp:HiddenField runat="server" ID="umfBtSubmitAllFired" ClientIDMode="Static" Value="N" />
            <asp:Button class="btn green-sharp btn-outline  btn-block sbold uppercase"
                ID="btSubmitAll" runat="server" Style="display: none; margin-bottom: 10px;" Text="Confirmar" data-name="btSubmitAll"
                OnClick="btSubmitAll_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="dropzone dropzone-file-area dz-clickable" id="dropzoneSection"
        style="width: 100%; height: 90%; border-color: blue; border: 2px dashed #028AF4; background: #fff;">
        <div class="dz-message" data-dz-message>
            <span>
                <h3 class="sbold"><%=this.Title%></h3>
            </span>
            <p><%=this.SubTitle%></p>
        </div>
    </div>
</div>

<script>
    Dropzone.autoDiscover = false;

    $(document).ready(function () {
        ErpUploadMultipleFiles.Init();
    });

    $(function () {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (!prm.get_isInAsyncPostBack()) {
            prm.add_endRequest(ucProcessFiles);
        }
    });

    function ucProcessFiles() {
        var hfControl = $('#umfBtSubmitAllFired');
        if (hfControl.val() == "S") {
            hfControl.val("N");
            ErpUploadMultipleFiles.ProcessFiles();
        }
    }
</script>

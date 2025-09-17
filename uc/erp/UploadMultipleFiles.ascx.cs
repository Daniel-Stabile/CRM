using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Benner.Erp.DataContracts;
using Benner.Tecnologia.Common.Security;

public partial class uc_erp_UploadMultipleFiles : System.Web.UI.UserControl
{
    public event EventHandler OnCommandExecute;

    public Benner.Erp.DataContracts.UploadMultipleFilesRQ RequestSubmit
    {
        set
        {
            Context.Session["umfRequestSubmit"] = Scramble.ScrambleText(Newtonsoft.Json.JsonConvert.SerializeObject(value));
        }
    }

    public string Title { get; set; }
    public string SubTitle { get; set; }

    protected void btSubmitAll_Click(object sender, EventArgs e)
    {
        try
        {
            if (OnCommandExecute != null)
                OnCommandExecute(sender, e);

            umfBtSubmitAllFired.Value = "S";
        }
        catch (Exception ex)
        {
            umfBtSubmitAllFired.Value = "N";
            messagePanel.InnerHtml = "<div class=\"alert alert-danger\">" +
                                        "<button class=\"close\" data-dismiss=\"alert\"></button>" +
                                        "<span>" + ex.Message + "</span>" +
                                    "</div>";
        }
    }
}
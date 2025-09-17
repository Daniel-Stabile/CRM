using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Benner.Tecnologia.Business;

public partial class tesourariaGridBaixaRapidaPage : WesPage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        PARCELAS.CommandExecute += PARCELAS_CommandExecute;
    }

    void PARCELAS_CommandExecute(object sender, GridCommandExecuteArgs e)
    {
        if (e.Command.Name.Equals("CMD_BAIXAR"))
        {
            if (PARCELAS.SelectedEntitiesHandles.Count <= 0)
                throw new BusinessException("Necessário selecionar ao menos uma parcela!");

            var handles = string.Join(",", PARCELAS.SelectedEntitiesHandles.Select(x => x.Value.ToString()));
            e.Command.OutputDefinition.Parameters.Add("PARCELASHANDLE", handles);
            e.Command.OutputDefinition.Parameters.Add("REMESSABANCARIA", PARCELAS.FilterEntity.Fields["REMESSABANCARIA"]);
            e.Command.OutputDefinition.Parameters.Add("NATUREZA", ((RadioItem)PARCELAS.FilterEntity.Fields["ORIGEM"]).Value.ToInt());
        }
    }
}

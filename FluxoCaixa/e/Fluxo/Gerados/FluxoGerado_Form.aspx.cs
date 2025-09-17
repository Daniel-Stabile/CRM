using Benner.Tecnologia.Common;
using Benner.Tecnologia.Wes.Components.WebApp;
using System;

public partial class eFluxoGerado_FormPage : WesPage
{
    protected override void OnLoad(EventArgs e)
    {        
        painelCadastroSimulacoes.Visible = BennerPrincipal.Current.ActiveRole == "FLUXOCAIXA_MANTER";

        base.OnLoad(e);
    }
}

using Benner.Tecnologia.Wes.Components.WebApp;
using Benner.Corporativo.Definicoes.Administracao;
using System;

public partial class GestaoCobrancainicioPage : WesPage
{

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        if (!IsPostBack)
            GC.Hidden = Empresas.EsconderComandosModulosWes();
    }
}

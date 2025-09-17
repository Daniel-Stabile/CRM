using Benner.Corporativo.Definicoes.Administracao;
using Benner.Tecnologia.Wes.Components.WebApp;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Common;
using System;

public partial class ativoHomePage : WesPage
{

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        if (!IsPostBack)
        {
            BOTOES.Hidden = Empresas.EsconderComandosModulosWes();
        }
            
    }
}

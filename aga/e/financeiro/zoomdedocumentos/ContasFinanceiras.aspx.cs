using Benner.Corporativo.Definicoes.Financeiro;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using System;


public partial class aga_e_financeiro_zoomdedocumentos_ContasFinanceiras : WesPage
{
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // Utilizando o método de extensão para obter o FormLinkDefinition persistido
        var linkDefinition = this.GetLinkDefinition() as FormLinkDefinition;
        var origem = Entity.GetFirstOrDefault(EntityDefinition.GetByName(linkDefinition.TargetEntityDefinitionName), linkDefinition.TargetEntityHandle);

        ContasFinanceirasUC.EntidadeOrigem = origem;
    }

}
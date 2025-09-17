using System;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Corporativo.Definicoes.Financeiro;

public partial class aga_e_financeiro_CompesacaoAdtoDev : WesPage
{
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        TV_COMPENSACAO_DOC_FORM.CommandExecuted += BAIXA_CommandExecuted;
    }

    private void BAIXA_CommandExecuted(object sender, FormCommandExecuteArgs e)
    {
        if (e.CommandName == "Save")
        {
            try
            {
                BennerContext.BusinessComponent.Call(businessComponentName: "Benner.Corporativo.Financeiro.Tesouraria.AdiantamentoDevolucaoComponent, Benner.Corporativo.Financeiro",
                                                     businessMethodName: "FuncaoCompensarAdiantamentoDevolucao",
                                                     request: TV_COMPENSACAO_DOC_FORM.GetEntity() as TvCompesancaodocumento);
            }
            catch (Exception ex)
            {
                throw new BusinessException((ex.InnerException != null ? ex.InnerException.Message : ex.Message), ex);
            }
        }
    }
}
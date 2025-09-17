using Benner.Corporativo.Definicoes.Financeiro;
using Benner.Corporativo.Legacy;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using Ninject;
using System;
using System.Web.UI;

public partial class zoomdedocumentosBaixasParcelaPage : WesPage
{
    [Inject]
    public IFNDocumentoDao DocumentoDao { get; set; }

    [Inject]
    public IFNParcelaDao ParcelaDao { get; set; }

    [Inject]
    public IFNMovimentacaoDao MovimentacaoDao { get; set; }

    public EntityBase Movimentacao
    {
        get
        {
            return BAIXAS.GetEntity();
        }
    }

    public int TipoMovimento
    {
        get
        {
            return Movimentacao != null ? Movimentacao["TIPOMOVIMENTO"].GetInt32() : 0;
        }
    }

    public int LancamentoTesouraria
    {
        get
        {
            return Movimentacao != null ? Movimentacao["LANCAMENTOTESOURARIA"].GetInt32() : 0;
        }
    }

    public int Parcela
    {
        get
        {
            return Movimentacao != null ? Movimentacao["PARCELA"].GetInt32() : 0;
        }
    }

    public bool EhDocAdiantamento
    {
        get
        {
            foreach (EntityBase entity in BAIXAS.DataSource)
            {
                IFNParcela parcela = ParcelaDao.GetFirstOrDefault(entity["PARCELA"].GetInt32());
                if (parcela != null && parcela.DocumentoInstance.OperacaoInstance.ProvisaoAdiantamento.GetValueOrDefault())                    
                    return true;
            }

            return false;
        }
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        GRIDCONTABILIZACAO.CommandExecute += GRIDCONTABILIZACAO_CommandExecute;
        GRIDCONTABILIZACAO.CommandExecuted += GRIDCONTABILIZACAO_CommandExecuted;
        BAIXA.CommandExecuted += BAIXA_CommandExecuted;
    }

    private void BAIXA_CommandExecuted(object sender, FormCommandExecuteArgs e)
    {
        switch (e.CommandName)
        {
               case "Save":
               Contabilizar();
               EntityDefinition definition = FNMovimentacao.GetEntityDefinition();
               Entity.Call(definition, "ContabilizarMovimentacao", new Entities<EntityBase> { BAIXA.GetEntity() });
                break;
        }

    }

    protected override void OnLoadComplete(EventArgs e)
    {
        base.OnLoadComplete(e);

        ForceUpdate();

        if (BAIXAS.DataSource != null && BAIXAS.DataSource.Count > 0 && BAIXAS.GridView.SelectedIndex < 0)
            BAIXAS.SelectRowByIndex(0);
        
        if (GRIDCONTABILIZACAO.DataSource != null && GRIDCONTABILIZACAO.DataSource.Count > 0 && GRIDCONTABILIZACAO.GridView.SelectedIndex < 0)
            GRIDCONTABILIZACAO.SelectRowByIndex(0);

        if (GRIDCONTASFINANCEIRAS.DataSource != null && GRIDCONTASFINANCEIRAS.DataSource.Count > 0 && GRIDCONTASFINANCEIRAS.GridView.SelectedIndex < 0)
            GRIDCONTASFINANCEIRAS.SelectRowByIndex(0);

        var movimentacao = MovimentacaoDao.GetFirstOrDefault(new Criteria("A.PARCELABAIXA = :PARCELA", new Parameter("PARCELA", Parcela)));
       
        TAB_COMPENSACOES.Visible = false;
        if (EhDocAdiantamento && movimentacao != null)
        {
            TAB_COMPENSACOES.Visible = true;

            DOCUMENTOCOMPENSADO.UserDefinedCriteriaWhereClause = string.Format("A.HANDLE = (SELECT DOCUMENTO FROM FN_MOVIMENTACOES WHERE HANDLE = {0})", movimentacao.Handle.Value);
            PARCELASCOMPENSADA.UserDefinedCriteriaWhereClause = "A.HANDLE IN (SELECT PARCELA FROM FN_MOVIMENTACOES WHERE PARCELABAIXA = @CAMPO(PARCELA))";
        }

        if (TipoMovimento == FNMovimentacaoTipoMovimentoListaItens.Item3Adiantamento.Index)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "MostrarTabCompensacoes", "MostrarTabCompensacoes();", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "EsconderTabCompensacoes", "EsconderTabCompensacoes();", true);
        }

        ForceUpdate();
    }

    private void GRIDCONTABILIZACAO_CommandExecute(object sender, GridCommandExecuteArgs e)
    {
        switch(e.Command.Name)
        {
            case "CMD_CONTABILIZAR":
                Contabilizar();
                EntityDefinition definition = FNMovimentacao.GetEntityDefinition();
                Entity.Call(definition, "ContabilizarMovimentacao", new Entities<EntityBase>{ BAIXAS.GetEntity() });
                break;
        }
    }



    private void GRIDCONTABILIZACAO_CommandExecuted(object sender, GridCommandExecuteArgs e)
    {
        switch(e.Command.Name)
        {
            case "CMD_CONTABILIZAR":
               GRIDCONTABILIZACAO.GridView.SelectedIndex = -1;
                break;
        }
    }

    private void Contabilizar()
    {
        if (LancamentoTesouraria > 0)
            throw new BusinessException("Baixa efetuada por outra origem, efetue a contabilização pelo formulário de tesouraria.");

        if (TipoMovimento == FNMovimentacaoTipoMovimentoListaItens.Item2Devolucao.Index &&
            TipoMovimento == FNMovimentacaoTipoMovimentoListaItens.Item3Adiantamento.Index)
            throw new BusinessException(string.Format(
                "Movimentação do tipo {0} não pode ser contabilizada.",
                TipoMovimento == FNMovimentacaoTipoMovimentoListaItens.Item2Devolucao.Index ?
                FNMovimentacaoTipoMovimentoListaItens.Item2Devolucao.Description :
                FNMovimentacaoTipoMovimentoListaItens.Item3Adiantamento.Description));
    }

    private void ForceUpdate()
    {
        DOCUMENTOCOMPENSADO.DataLoad();
        DOCUMENTOCOMPENSADO.ForceUpdate();

        PARCELASCOMPENSADA.DataLoad();
        PARCELASCOMPENSADA.ForceUpdate();

        GRIDCONTABILIZACAO.DataLoad();
        GRIDCONTABILIZACAO.ForceUpdate();

        GRIDCONTASFINANCEIRAS.DataLoad();
        GRIDCONTASFINANCEIRAS.ForceUpdate();

        BAIXAS.DataLoad();
        BAIXAS.ForceUpdate();

        BAIXA.DataLoad();
        BAIXA.ForceUpdate();
    }
}


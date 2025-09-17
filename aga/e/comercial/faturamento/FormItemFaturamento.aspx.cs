using Benner.Corporativo.Comum;
using Benner.Corporativo.Definicoes.Comercial;
using Benner.Corporativo.Definicoes.Materiais;
using Benner.ERP.Comum;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Common.Services;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using Ninject;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

public partial class faturamentoFormItemFaturamentoPage : WesPage
{
    [Inject]
    public ISessionVars SessionVars { get; set; }

    [Inject]
    public IPDAlmoxarifadoProdutoDao AlmoxarifadoProdutoDao { get; set; }

    [Inject]
    public IPDAlmoxarifadoVariacoesDao AlmoxarifadoVariacoesDao { get; set; }

    [Inject]
    public IPDTanqueLoteDao TanqueLoteDao { get; set; }

    private EntityBase Item
    {
        get { return ITEMFATURAMENTO.GetEntity(); }
    }

    private decimal QuantidadeItem
    {
        get { return Item.Fields[CMItem.FieldNames.Quantidade].ToDecimal(); }
    }

    private long ProdutoItem
    {
        get { return ((EntityAssociation)Item.Fields[CMItem.FieldNames.Produto]).Handle; }
    }

    private long VariacaoItem
    {
        get { return ((EntityAssociation)Item.Fields[CMItem.FieldNames.Variacao]).Handle; }
    }

    private string LoteWhere
    {
        get
        {
            return ((GridAssociationFieldDefinition)ENTREGALOTES.GridDefinition.FieldDefinitions[CMItemEntregaLote.FieldNames.Lote]).Where;
        }
        set
        {
            ((GridAssociationFieldDefinition)ENTREGALOTES.GridDefinition.FieldDefinitions[CMItemEntregaLote.FieldNames.Lote]).Where = value;
        }
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        ITEMFATURAMENTO.CommandExecute += ITEMFATURAMENTO_CommandExecute;
        ENTREGAS.GridView.RowDataBound += ENTREGASGridView_RowDataBound;
        ENTREGAS.CommandExecute += ENTREGAS_CommandExecute;
        ENTREGALOTES.GridView.RowDataBound += ENTREGALOTESGridView_RowDataBound;
        ENTREGALOTES.Load += ENTREGALOTES_Load;
        ENTREGALOTES.CommandExecute += ENTREGALOTES_CommandExecute;

        if (IsPostBack)
        {
            ENTREGASInfo();
            ENTREGALOTESProcessar();
        }
    }

    protected override void OnLoadComplete(EventArgs e)
    {
        base.OnLoadComplete(e);

        if (!IsPostBack)
        {
            ENTREGASInfo();
            ENTREGALOTESProcessar();
        }
    }

    protected override void OnPreRender(EventArgs e)
    {
        DefinirComandos();
        base.OnPreRender(e);
    }

    void ITEMFATURAMENTO_CommandExecute(object sender, FormCommandExecuteArgs e)
    {
        DefinirOutputHandle(e.CommandName);
    }

    private void ENTREGASGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
            return;

        var entrega = e.Row.DataItem as EntityBase;
        var almoxarifado = ((EntityAssociation)entrega.Fields[CMItemEntrega.FieldNames.Almoxarifado]).Handle;

        if (!almoxarifado.IsReallyValid())
            return;

        var quantidadeEntrega = entrega.Fields[CMItemEntrega.FieldNames.Quantidade].ToDecimal();
        decimal quantidadeProduto = 0;

        if (entrega.Fields[PDProduto.FieldNames.TemVariacao].ToBoolean())
            quantidadeProduto = AlmoxarifadoVariacoesDao.GetFirstOrDefault(a =>
                a.AlmoxarifadoHandle == almoxarifado && a.ProdutoHandle == ProdutoItem && a.VariacaoHandle == VariacaoItem)
                .EstoqueDisponivel.GetValueOrDefault();
        else
            quantidadeProduto = AlmoxarifadoProdutoDao.GetFirstOrDefault(a =>
                a.AlmoxarifadoHandle == almoxarifado && a.ProdutoHandle == ProdutoItem)
                .EstoqueDisponivel.GetValueOrDefault();

        if ((quantidadeProduto - quantidadeEntrega) < 0)
            e.Row.CellByName("SALDO").ForeColor = Color.Red;

        e.Row.CellByName("SALDO").CreateLiteral(Math.Abs(quantidadeProduto - quantidadeEntrega).ToString("N4"));
    }

    private void ENTREGAS_CommandExecute(object sender, EditableGridCommandExecuteArgs e)
    {
        ENTREGASInfo();
        ENTREGALOTESProcessar();
    }

    private void ENTREGALOTESGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
            return;

        var entregaLote = e.Row.DataItem as EntityBase;
        var lote = entregaLote.Fields[CMItemEntregaLote.FieldNames.Lote] as EntityAssociation;

        if (!lote.Handle.IsReallyValid())
            return;

        var quantidadeEntregaLote = entregaLote.Fields[CMItemEntregaLote.FieldNames.Quantidade].ToDecimal();
        var quantidadeLote = TanqueLoteDao.GetFirstOrDefault(lote.Handle).QtdeDisponivel.GetValueOrDefault();

        if ((quantidadeLote - quantidadeEntregaLote) < 0)
            e.Row.CellByName("SALDO").ForeColor = Color.Red;

        e.Row.CellByName("SALDO").CreateLiteral(Math.Abs(quantidadeLote - quantidadeEntregaLote).ToString("N4"));
    }

    private void ENTREGALOTES_Load(object sender, EventArgs e)
    {
        var criteria = new Criteria();
        var handle = string.IsNullOrEmpty(ItemEntregaHandle.Value) ? "0" : ItemEntregaHandle.Value;
        criteria.AddWhereClause(CMItemEntregaLote.FieldNames.ItemEntrega, new List<Handle>() { new Handle(handle) });

        ENTREGALOTES.UserDefinedCriteriaWhereClause = criteria.Where;
        ENTREGALOTES.ForceUpdate();
        ENTREGALOTES.DataLoad();
    }

    private void ENTREGALOTES_CommandExecute(object sender, EditableGridCommandExecuteArgs e)
    {
        var sessionName = CMItemEntregaLote.GetEntityDefinition().Name + CMItemEntregaLote.FieldNames.ItemEntrega;
        SessionVars.SetSessionVar(sessionName, ItemEntregaHandle.Value);
    }

    private void DefinirOutputHandle(string commandName)
    {
        Command command = ITEMFATURAMENTO.EntityViewCommands.Commands.Find(x => x.Name == commandName);
        Handle novoHandle = new Handle();

        if (commandName.Equals("CMD_ANTERIOR"))
        {
            novoHandle = new Handle(ITEMFATURAMENTO.InMemoryEntity.TransitoryVars["HANDLEANTERIOR"].ToInt());
        }
        else if (commandName.Equals("CMD_PROXIMO"))
        {
            novoHandle = new Handle(ITEMFATURAMENTO.InMemoryEntity.TransitoryVars["HANDLEPROXIMO"].ToInt());
        }

        (command.OutputDefinition as FormLinkDefinition).TargetEntityHandle = novoHandle;
    }

    private void DefinirComandos()
    {
        var commandAnt = ITEMFATURAMENTO.EntityViewCommands.Commands.Find(x => x.Name == "CMD_ANTERIOR");
        var commandProx = ITEMFATURAMENTO.EntityViewCommands.Commands.Find(x => x.Name == "CMD_PROXIMO");
        int itemHandle = ITEMFATURAMENTO.InMemoryEntity["HANDLE"].GetInt32();
        int documentoHandle = ITEMFATURAMENTO.InMemoryEntity["DOCUMENTO"].GetInt32();

        var itens = new Query("SELECT HANDLE                " +
                              "  FROM CM_ITENS              " +
                              " WHERE DOCUMENTO = :DOCUMENTO" +
                              " ORDER BY HANDLE DESC        ",
                              new Benner.Tecnologia.Common.Parameter("DOCUMENTO", documentoHandle))
                              .Execute()
                              .ToList();
        int index = itens.FindIndex(x => x["HANDLE"].GetInt32() == itemHandle);

        if (index > 0)
        {
            ITEMFATURAMENTO.InMemoryEntity.TransitoryVars["HANDLEANTERIOR"] = itens.ElementAt(index - 1)["HANDLE"].GetInt32();
            commandAnt.Visible = true;
        }

        if (index < itens.Count - 1)
        {
            ITEMFATURAMENTO.InMemoryEntity.TransitoryVars["HANDLEPROXIMO"] = itens.ElementAt(index + 1)["HANDLE"].GetInt32();
            commandProx.Visible = true;
        }
    }

    private void ENTREGASInfo()
    {
        ENTREGAS.DataLoad();

        var quantidade = ENTREGAS.DataSource.Sum(a => a.Fields[CMItemEntrega.FieldNames.Quantidade].ToDecimal());

        if (quantidade == 0)
            ItemEntregaHandle.Value = "";

        var saldoItem = Math.Abs(QuantidadeItem - quantidade);
        var mensagem = new StringBuilder();

        mensagem.AppendLine(string.Format("Total de itens: {0}", quantidade));

        if (QuantidadeItem > quantidade)
            mensagem.AppendLine(string.Format("Deficit: {0}", saldoItem));

        if (QuantidadeItem < quantidade)
            mensagem.AppendLine(string.Format("Excedente: {0}", saldoItem));

        ENTREGAS.ShowWidgetMessage(mensagem.ToString(), MessageType.Information);
        ENTREGAS.ForceUpdate();
    }

    private void ENTREGALOTESProcessar()
    {
        var criteria = new Criteria("(A.INUTILIZADO = 'N' OR A.INUTILIZADO IS NULL) AND A.QTDEDISPONIVEL > 0");
        criteria.AddWhereClause(PDTanqueLote.FieldNames.Produto, new List<Handle>() { ProdutoItem });
        criteria.AddWhereClause(PDTanqueLote.FieldNames.Variacao, new List<Handle>() { VariacaoItem });
        //criteria.AddWhereClause(PDTanqueLote.FieldNames.Almoxarifado, new List<Handle>() { ItemEntregaInstance.AlmoxarifadoHandle });

        LoteWhere = criteria.Where;

        var entregaSelecionada = !string.IsNullOrEmpty(ItemEntregaHandle.Value);

        if (!entregaSelecionada)
        {
            ENTREGALOTES.CanInsert = false;
            ((CommandGroup)ENTREGALOTES.GridDefinition.Commands["GRP_CALCULAR"]).Items["CMD_CALCULARUEPS"].RunInEditMode = false;
            ((CommandGroup)ENTREGALOTES.GridDefinition.Commands["GRP_CALCULAR"]).Items["CMD_CALCULARPEPS"].RunInEditMode = false;
            ((CommandGroup)ENTREGALOTES.GridDefinition.Commands["GRP_CALCULAR"]).Items["CMD_CALCULARDATAVALIDADE"].RunInEditMode = false;
            ENTREGALOTES.ShowWidgetMessage("Selecionar entrega para preencher lotes.", MessageType.Information);
            ENTREGALOTES.ForceUpdate();
        }
    }
}

using System;
using System.Linq;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using Benner.Tecnologia.Wes.Components.Scripting;
using System.Globalization;
using System.Collections.Generic;
using System.Reflection;
using System.Text;
using System.Web;
using Benner.Tecnologia.Common.Exceptions;

/// <summary>
/// Summary description for SelecaoPessoas
/// </summary>
public partial class SelecaoPessoas : Benner.Tecnologia.Wes.Components.WebApp.WesPage
{
    protected override void LoadWebPartConnections()
    {
        AddWebPartStaticConnection("WIDGETID_635781683906877499WIDGETID_635781850674619409", "WIDGETID_635781683906877499", "WIDGETID_635781850674619409");
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);        
        WIDGETID_635781683906877499.CommandExecute += Form_CommandExecute;
        WIDGETID_635781850674619409.CommandExecute += WIDGETID_635781850674619409_CommandExecute;
        WIDGETID_635781850674619409.Load += WIDGETID_635781850674619409_Load;
        //WIDGETID_635781850674619409.Grid.RowCreated += Grid_RowCreated;                     
    }

    void WIDGETID_635781850674619409_Load(object sender, EventArgs e)
    {
        WIDGETID_635781850674619409.Grid.RowCreated += Grid_RowCreated;
    }

    void Grid_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        var teste = "";
    }
    
    void WIDGETID_635781850674619409_CommandExecute(object sender, Benner.Tecnologia.Wes.Components.GridCommandExecuteArgs e)
    {
        switch (e.Command.Name)
        {
            case "CMD_INCLUIRMARCADOS":
                _incluirPessoas(sender);                
                break;
            case "CMD_REMOVERMARCADOS":
                _removerPessoas(sender);
                break;
            case "CMD_REMOVERTODOS":
                _removerTodos(sender);
                break;
            case "CMD_INCLUIRTODOS":
                _incluirTodos(sender);
                break;
        }
    }

    private void _incluirTodos(object sender)
    {
        var filtro = preparaFiltro();
        var pessoas = Entity.GetMany(EntityDefinition.GetByName("GN_PESSOAS"), filtro);

        foreach (var pessoa in pessoas)
            _gravaPessoa(pessoa.Handle);
    }

    private void _gravaPessoa(Handle pessoa)
    {
        try
        {            
            var filtroEntity = WIDGETID_635781850674619409.ProviderWidget.GetEntity();
            var acaoPessoa = Entity.Create(EntityDefinition.GetByName("CRM_ACAOPESSOAS"));
            var assocPessoa = acaoPessoa.Fields["PESSOA"] as EntityAssociation;
            var assocAcao = acaoPessoa.Fields["ACAORELACIONAMENTO"] as EntityAssociation;
            var assocAcaoRelacionamento = filtroEntity.Fields["ACAORELACIONAMENTO"] as EntityAssociation;
            assocPessoa.Handle = pessoa;
            assocAcao.Handle = assocAcaoRelacionamento.Handle;
            acaoPessoa.Save();
        }
        catch (Exception) { }
    }

    private void _removerTodos(object sender)
    {
        var filtro = preparaFiltro();
        var pessoas = Entity.GetMany(EntityDefinition.GetByName("GN_PESSOAS"), filtro);

        foreach (var pessoa in pessoas)
            _removePessoaAcao(pessoa.Handle);

    }

    private void _removerPessoas(object sender)
    {        
        var simpleGrid = sender as SimpleGrid;

        
        foreach (var handlePessoa in simpleGrid.SelectedEntitiesHandles)
            _removePessoaAcao(handlePessoa);
        
    }

    private void _removePessoaAcao(Handle handlePessoa)
    {
        try
        {
            var filtroEntity = WIDGETID_635781850674619409.ProviderWidget.GetEntity();
            var assocAcaoRelacionamento = filtroEntity.Fields["ACAORELACIONAMENTO"] as EntityAssociation;        
            var criterio = new Criteria();
            criterio.AddWhereClause("A.ACAORELACIONAMENTO = :ACAORELACIONAMENTO", new Parameter("ACAORELACIONAMENTO", assocAcaoRelacionamento.Handle));
            criterio.AddWhereClause("A.PESSOA = :PESSOA", new Parameter("PESSOA", handlePessoa));
            var acaoPessoa = Entity.Get(EntityDefinition.GetByName("CRM_ACAOPESSOAS"), criterio);
            acaoPessoa.Delete();
        }
        catch (Exception) { }
    }    

    private void _incluirPessoas(object sender)
    {
        var filtroEntity = WIDGETID_635781850674619409.ProviderWidget.GetEntity();

        List<Handle> selectedEntities = new List<Handle>();
        var simpleGrid = sender as SimpleGrid;

        foreach (var handlePessoa in simpleGrid.SelectedEntitiesHandles)
        {
            _gravaPessoa(handlePessoa);
        }
        
    }   

    void Form_CommandExecute(object sender, Benner.Tecnologia.Wes.Components.FormCommandExecuteArgs e)
    {
        switch (e.CommandName)
        {
            case "Save":
                var filtro = preparaFiltro();
                WIDGETID_635781850674619409.UserDefinedCriteriaWhereClause = filtro.GetWhereText();
                //WIDGETID_635781850674619409.UserDefinedCriteriaWhereClause = filtro.Where;
                //WIDGETID_635781850674619409.UserDefinedCriteriaParameters = filtro.Parameters;
                WIDGETID_635781850674619409.ForceUpdate();
                break;
        }
    }    

    private Criteria preparaFiltro()
    {
        var filtro = new Criteria();
        var filtroEntity = WIDGETID_635781683906877499.GetEntity();

        var tipoCrm = filtroEntity.Fields["TIPOCRM"] as ListItem;
        var dataInclusaoDe = filtroEntity.Fields["DATAINCLUSAODE"] as DateTime?;
        var dataInclusaoAte = filtroEntity.Fields["DATAINCLUSAOATE"] as DateTime?;
        var nome = filtroEntity.Fields["NOME"] as string;
        var cgcCpf = filtroEntity.Fields["CPFCNPJ"] as string;
        var sexo = filtroEntity.Fields["SEXO"] as RadioItem;
        var nascimento = filtroEntity.Fields["DATANASCIMENTO"] as DateTime?;
        var quantiadeFuncionarios = filtroEntity.Fields["QUANTIDADEFUNCIONARIOS"] as long?;

        var empresa = filtroEntity.Fields["EMPRESA"] as EntityAssociation;
        var tipo = filtroEntity.Fields["TIPO"] as ListItem;        
        var pais = filtroEntity.Fields["PAIS"] as EntityAssociation;
        var estado = filtroEntity.Fields["ESTADO"] as EntityAssociation;
        var municipio = filtroEntity.Fields["MUNICIPIOS"] as EntityAssociation;
        var areaNegocio = filtroEntity.Fields["AREANEGOCIO"] as EntityAssociation;
        var produto = filtroEntity.Fields["PRODUTO"] as EntityAssociation;
        var statusOportunidade = filtroEntity.Fields["STATUSOPORTUNIDADE"] as ListItem;

        if (tipoCrm != null)
            filtro.AddWhereClause("A.TIPOCRM = :TIPOCRM", new Parameter("TIPOCRM", tipoCrm.Value));
        if (dataInclusaoDe.HasValue)
            filtro.AddWhereClause(String.Format("A.DATAINCLUSAO >= @FORMATDATE({0})", dataInclusaoDe.Value.ToShortDateString()));

        if (dataInclusaoAte.HasValue)
            filtro.AddWhereClause(String.Format("A.DATAINCLUSAO <= @FORMATDATE({0})", dataInclusaoAte.Value.ToShortDateString()));

        if (!string.IsNullOrEmpty(nome))
            filtro.AddWhereClause("A.NOME LIKE :NOME", new Parameter("NOME", "%" + nome + "%"));

        if (!string.IsNullOrEmpty(cgcCpf))
            filtro.AddWhereClause("A.CGCCPF = :CGCCPF", new Parameter("CGCCPF", cgcCpf));

        if ((sexo != null || nascimento.HasValue) && quantiadeFuncionarios.HasValue)
        {
            StringBuilder condicao = new StringBuilder();

            condicao.Append("((");

            if (sexo != null)
            {
                condicao.Append("A.SEXO = :SEXO");
                filtro.Parameters.Add("SEXO", sexo.Value);
            }

            if (nascimento.HasValue)
            {
                if (condicao.Length > 0)
                    condicao.Append(" AND ");

                condicao.Append("A.NASCIMENTO = :NASCIMENTO");
                filtro.Parameters.Add("NASCIMENTO", nascimento);
            }

            condicao.Append(")");

            condicao.Append(" AND A.QUANTIDADEFUNCIONARIOS = :QTDFUNCIONARIOS");
            filtro.Parameters.Add("QTDFUNCIONARIOS", quantiadeFuncionarios);            

            condicao.Append(")");

            filtro.AddWhereClause(condicao.ToString());
        }
        else
        {
            if (sexo != null)
                filtro.AddWhereClause("A.SEXO = :SEXO", new Parameter("SEXO", sexo.Value));

            if (nascimento.HasValue)
                filtro.AddWhereClause("A.NASCIMENTO = :NASCIMENTO", new Parameter("NASCIMENTO", nascimento));

            if (quantiadeFuncionarios.HasValue)
                filtro.AddWhereClause("A.QUANTIDADEFUNCIONARIOS = :QTDFUNCIONARIOS", new Parameter("QTDFUNCIONARIOS", quantiadeFuncionarios));
        }

        if (empresa.Handle.IsValid())
            filtro.AddWhereClause("A.EMPRESA = :EMPRESA", new Parameter("EMPRESA", empresa.Handle));


        if (tipo != null)
        {
            switch (tipo.Value)
            {
                case 1:
                    filtro.AddWhereClause("A.TIPO IN (1,3)");
                    break;
                case 2:
                    filtro.AddWhereClause("A.TIPO IN (2,4)");
                    break;
                case 3:
                    filtro.AddWhereClause("A.TIPO = 5");
                    break;
            }
        }

        if (pais.Handle.IsValid())
            filtro.AddWhereClause("A.PAIS = :PAIS", new Parameter("PAIS", pais.Handle));

        if (estado.Handle.IsValid())
            filtro.AddWhereClause("A.ESTADO = :ESTADO", new Parameter("ESTADO", estado.Handle));

        if (municipio.Handle.IsValid())
            filtro.AddWhereClause("A.MUNICIPIO = :MUNICIPIO", new Parameter("MUNICIPIO", municipio.Handle));

        if (areaNegocio.Handle.IsValid())
            filtro.AddWhereClause("A.HANDLE IN (SELECT PESSOA FROM CRM_OPORTUNIDADES WHERE AREANEGOCIO = :AREANEGOCIO)", new Parameter("AREANEGOCIO", areaNegocio.Handle));

        if (produto.Handle.IsValid())
            filtro.AddWhereClause(@"A.HANDLE IN (
                                              SELECT OPO.PESSOA 
                                                     FROM CRM_OPORTUNIDADEPRODUTOS PROD 
                                              INNER JOIN CRM_OPORTUNIDADES OPO ON OPO.HANDLE = PROD.OPORTUNIDADE
                                              WHERE PROD.PRODUTO = :PRODUTO)", new Parameter("PRODUTO", produto.Handle)
                                 );

        if (statusOportunidade != null)
            filtro.AddWhereClause("A.HANDLE IN (SELECT PESSOA FROM CRM_OPORTUNIDADES WHERE STATUS = :STATUS)", new Parameter("STATUS", statusOportunidade.Value));

        filtro.AddWhereClause("A.HANDLE <> -1");

        return filtro;
    }
}
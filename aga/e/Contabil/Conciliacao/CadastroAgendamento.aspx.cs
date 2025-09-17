using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using Benner.Corporativo.Definicoes.Contabil;
using Benner.Tecnologia.Metadata.Entities;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using Benner.Tecnologia.Business;
using System.Web.Http;
using System.Globalization;
using Benner.Corporativo.Definicoes.Administracao;

public partial class CadastroAgendamento : WesPage
{
    public partial class ModelDados
    {
        public long regraConciliacao { get; set; }
        public DateTime ultimaExecucao { get; set; }

        public string dataUmaVez { get; set; }
        public string horaUmaVez { get; set; }

        public string horaDiario { get; set; }

        public string horaSemanal { get; set; }
        public Boolean checkBoxSemanalSegunda { get; set; }
        public Boolean checkBoxSemanalDomingo { get; set; }
        public Boolean checkBoxSemanalTerca { get; set; }
        public Boolean checkBoxSemanalQuarta { get; set; }
        public Boolean checkBoxSemanalQuinta { get; set; }
        public Boolean checkBoxSemanalSexta { get; set; }
        public Boolean checkBoxSemanalSabado { get; set; }

        public string horaMensal { get; set; }
        public Boolean checkBoxMensalJaneiro { get; set; }
        public Boolean checkBoxMensalFevereiro { get; set; }
        public Boolean checkBoxMensalMarco { get; set; }
        public Boolean checkBoxMensalAbril { get; set; }
        public Boolean checkBoxMensalMaio { get; set; }
        public Boolean checkBoxMensalJunho { get; set; }
        public Boolean checkBoxMensalJulho { get; set; }
        public Boolean checkBoxMensalAgosto { get; set; }
        public Boolean checkBoxMensalSetembro { get; set; }
        public Boolean checkBoxMensalOutubro { get; set; }
        public Boolean checkBoxMensalNovembro { get; set; }
        public Boolean checkBoxMensalDezembro { get; set; }
        public string horaIntervalo { get; set; }

        public int opcoesEnviarEmail { get; set; }
        public string usuarios { get; set; }
        public string assunto { get; set; }
        public string descricaoEmailTexto { get; set; }
        public int opcoesanexarRelatorio { get; set; }
        public int handleAgendamento { get; set; }
        public int handleRegraConciliacaoAgendamento { get; set; }

        public string tabAtiva { get; set; }

    }

    protected void Page_Load(object sender, System.EventArgs e)
    {
        var pst = Request.QueryString.Get("pst");
        var link = (FormLinkDefinition)Benner.Tecnologia.Wes.Components.UriBuilder.Get(pst);
        var criteria = new Criteria(link.WhereClause.Where, link.WhereClause.Parameters.ToArray());
        var entity = Entity.GetFirstOrDefault(EntityDefinition.GetByName("CT_REGRACONCILIACAOAGENDAMENTO"), criteria);

        if (entity != null)
        {
            regraConciliacao.Value = link.WhereClause.Parameters[0].Value.ToString();
            ultimaExecucao.Value = entity["UltimaExecucao"].GetString();
            executadoPor.Value = entity["ExecutadoPor"].GetString();
            formaExecucao.Value = entity["FormaExecucao"].GetString();
            handleAgendamento.Value = Convert.ToString(entity["HandleAgendamento"].GetInt32()); //Handle da ZAgendamentos
            handleRegraConciliacaoAgendamento.Value = Convert.ToString(entity["handle"].GetInt32());
        }

        regraConciliacao.Value = link.WhereClause.Parameters[0].Value.ToString();
    }

    private static ZAgendamentosMesesDoAnoEnum montaEnumMeses(ModelDados dados)
    {
        ZAgendamentosMesesDoAnoEnum meses = 0;

        if (dados.checkBoxMensalJaneiro)
        {
            meses = ZAgendamentosMesesDoAnoEnum.Janeiro;
        }

        if (dados.checkBoxMensalFevereiro)
        {
            meses = ((meses.Equals("")) ? ZAgendamentosMesesDoAnoEnum.Fevereiro : meses ^ ZAgendamentosMesesDoAnoEnum.Fevereiro);
        }

        if (dados.checkBoxMensalMarco)
        {
            meses = ((meses.Equals("")) ? ZAgendamentosMesesDoAnoEnum.Marco : meses ^ ZAgendamentosMesesDoAnoEnum.Marco);
        }

        if (dados.checkBoxMensalAbril)
        {
            meses = ((meses.Equals("")) ? ZAgendamentosMesesDoAnoEnum.Abril : meses ^ ZAgendamentosMesesDoAnoEnum.Abril);
        }

        if (dados.checkBoxMensalMaio)
        {
            meses = ((meses.Equals("")) ? ZAgendamentosMesesDoAnoEnum.Maio : meses ^ ZAgendamentosMesesDoAnoEnum.Maio);
        }

        if (dados.checkBoxMensalJunho)
        {
            meses = ((meses.Equals("")) ? ZAgendamentosMesesDoAnoEnum.Junho : meses ^ ZAgendamentosMesesDoAnoEnum.Junho);
        }

        if (dados.checkBoxMensalJulho)
        {
            meses = ((meses.Equals("")) ? ZAgendamentosMesesDoAnoEnum.Julho : meses ^ ZAgendamentosMesesDoAnoEnum.Julho);
        }

        if (dados.checkBoxMensalAgosto)
        {
            meses = ((meses.Equals("")) ? ZAgendamentosMesesDoAnoEnum.Agosto : meses ^ ZAgendamentosMesesDoAnoEnum.Agosto);
        }

        if (dados.checkBoxMensalSetembro)
        {
            meses = ((meses.Equals("")) ? ZAgendamentosMesesDoAnoEnum.Setembro : meses ^ ZAgendamentosMesesDoAnoEnum.Setembro);
        }

        if (dados.checkBoxMensalOutubro)
        {
            meses = ((meses.Equals("")) ? ZAgendamentosMesesDoAnoEnum.Outubro : meses ^ ZAgendamentosMesesDoAnoEnum.Outubro);
        }

        if (dados.checkBoxMensalNovembro)
        {
            meses = ((meses.Equals("")) ? ZAgendamentosMesesDoAnoEnum.Novembro : meses ^ ZAgendamentosMesesDoAnoEnum.Novembro);
        }

        if (dados.checkBoxMensalDezembro)
        {
            meses = ((meses.Equals("")) ? ZAgendamentosMesesDoAnoEnum.Dezembro : meses ^ ZAgendamentosMesesDoAnoEnum.Dezembro);
        }

        return meses;
    }

    private static ZAgendamentosDiasSemanaEnum montaEnumDias(ModelDados dados)
    {
        ZAgendamentosDiasSemanaEnum diasSemana = 0;

        if (dados.checkBoxSemanalDomingo)
        {
            diasSemana = ZAgendamentosDiasSemanaEnum.Domingo;
        }

        if (dados.checkBoxSemanalSegunda)
        {
            diasSemana = ((diasSemana.Equals("")) ? ZAgendamentosDiasSemanaEnum.Segunda : diasSemana ^ ZAgendamentosDiasSemanaEnum.Segunda);
        }
        if (dados.checkBoxSemanalTerca)
        {
            diasSemana = ((diasSemana.Equals("")) ? ZAgendamentosDiasSemanaEnum.Terca : diasSemana ^ ZAgendamentosDiasSemanaEnum.Terca);
        }

        if (dados.checkBoxSemanalQuarta)
        {
            diasSemana = ((diasSemana.Equals("")) ? ZAgendamentosDiasSemanaEnum.Quarta : diasSemana ^ ZAgendamentosDiasSemanaEnum.Quarta);
        }
        if (dados.checkBoxSemanalQuinta)
        {
            diasSemana = ((diasSemana.Equals("")) ? ZAgendamentosDiasSemanaEnum.Quinta : diasSemana ^ ZAgendamentosDiasSemanaEnum.Quinta);
        }
        if (dados.checkBoxSemanalSexta)
        {
            diasSemana = ((diasSemana.Equals("")) ? ZAgendamentosDiasSemanaEnum.Sexta : diasSemana ^ ZAgendamentosDiasSemanaEnum.Sexta);
        }

        if (dados.checkBoxSemanalSabado)
        {
            diasSemana = ((diasSemana.Equals("")) ? ZAgendamentosDiasSemanaEnum.Sabado : diasSemana ^ ZAgendamentosDiasSemanaEnum.Sabado);
        }

        return diasSemana;
    }

    private static string montaNomeAgendamento(ModelDados dados)
    {
        //codigo Reduzido da empresa + Codigo do agendamento + descrição do agendamento
        var empresa = Empresas.GetFirstOrDefault(Company.Current.Handle);
        Criteria criteria = new Criteria("A.CODIGO = :CODIGO");
        criteria.Parameters.Add(new Parameter("CODIGO", dados.regraConciliacao));
        var regraConciliacao = CTRegraConciliacao.GetFirstOrDefault(criteria);
        return "Conciliação agendada " + "\"" + (empresa.CodigoReduzido + regraConciliacao.Codigo) + "-" + regraConciliacao.Descricao + "\"";
    }

    private static long InserirRegistroAgendamento(ModelDados dados)
    {
        var agendamento = ZAgendamentos.Create();

        agendamento.Data = DateTime.Now.AddDays(-1);
        agendamento.Classe = "Benner.Corporativo.Contabil.Conciliacao.ConciliadorAgendamento, Benner.Corporativo.Contabil";
        agendamento.UsuarioInclusao = BennerContext.Security.GetLoggedUserName();
        agendamento.DataInclusao = DateTime.Now;
        agendamento.Nome = montaNomeAgendamento(dados);
        agendamento.Tipo = ZAgendamentosTipoTabItens.ItemComponenteDeNegocio;

        //Aba Agendamento
        switch (dados.tabAtiva)
        {
            case "#tabUmaVez":
                agendamento.Data = DateTime.Parse(dados.dataUmaVez);
                agendamento.Hora = DateTime.Parse(dados.horaUmaVez);
                agendamento.Periodicidade = ZAgendamentosPeriodicidadeTabItens.ItemUmaVez;
                break;
            case "#tabDiario":
                agendamento.Hora = DateTime.Parse(dados.horaDiario);
                agendamento.Periodicidade = ZAgendamentosPeriodicidadeTabItens.ItemDiario;
                break;
            case "#tabSemanal":
                agendamento.Hora = DateTime.Parse(dados.horaSemanal);
                agendamento.Periodicidade = ZAgendamentosPeriodicidadeTabItens.ItemSemanal;
                agendamento.DiasSemana = montaEnumDias(dados);
                break;
            case "#tabMensal":
                agendamento.Hora = DateTime.Parse(dados.horaMensal);
                agendamento.Periodicidade = ZAgendamentosPeriodicidadeTabItens.ItemMensal;
                agendamento.MesesDoAno = montaEnumMeses(dados);
                break;
            case "#tabIntervalo":
                agendamento.Hora = DateTime.Parse(dados.horaIntervalo);
                agendamento.Periodicidade = ZAgendamentosPeriodicidadeTabItens.ItemIntervalo;
                break;
        }

        agendamento.Save();
        return agendamento.Handle.Value;

    }

    private static long InserirRegistroRegra(ModelDados dados, long handleAgendamento)
    {
        var regra = CTRegraConciliacaoAgendamento.Create();

        regra.Empresa.Handle = Company.Current.Handle;
        regra.RegraConciliacao.Handle = dados.regraConciliacao;

        //Aba Email
        regra.FormaExecucao = 0;
        regra.EnviarEmail = dados.opcoesEnviarEmail;
        regra.UsuarioEmail = dados.usuarios;
        regra.AssuntoEmail = dados.assunto;
        regra.DescricaoEmail = dados.descricaoEmailTexto;
        regra.AnexoRelatorio = dados.opcoesanexarRelatorio;
        regra.HandleAgendamento = handleAgendamento;
        regra.TabsAgendamentoEmail = 1;
        regra.Data = DateTime.Now.Date;
        regra.Meses = "0";
        regra.Hora = DateTime.Now;
        regra.Dianomes = 0;
        regra.StatusAgendamento = 1;
        regra.Save();

        return regra.Handle.Value;
    }

    private static void EditarRegistrosRegra(ModelDados dados, long handleAgendamento)
    {
        CTRegraConciliacaoAgendamento regraConciliacaoAgendamento = CTRegraConciliacaoAgendamento.Get(dados.handleRegraConciliacaoAgendamento, GetMode.Edit);
        if (regraConciliacaoAgendamento != null)
        {
            if (handleAgendamento != 0)
                regraConciliacaoAgendamento.HandleAgendamento = handleAgendamento;

            regraConciliacaoAgendamento.UsuarioEmail = dados.usuarios; 
            regraConciliacaoAgendamento.DescricaoEmail = dados.descricaoEmailTexto;
            regraConciliacaoAgendamento.AssuntoEmail = dados.assunto;
            regraConciliacaoAgendamento.AnexoRelatorio = dados.opcoesanexarRelatorio;
            regraConciliacaoAgendamento.EnviarEmail = dados.opcoesEnviarEmail;
            regraConciliacaoAgendamento.Save();
        }
    }

    private static void EditarRegistrosAgendamento(ModelDados dados)
    {

        ZAgendamentos agendamento = ZAgendamentos.Get(dados.handleAgendamento, GetMode.Edit); //Não funciona com GetFirstOrDefault

        if (agendamento != null)
        {
            agendamento.DataAlteracao = DateTime.Now;
            agendamento.UsuarioAlteracao = BennerContext.Security.GetLoggedUserName();

            //Aba Agendamento
            switch (dados.tabAtiva)
            {
                case "#tabUmaVez":
                    agendamento.Data = DateTime.Parse(dados.dataUmaVez);
                    agendamento.Hora = DateTime.Parse(dados.horaUmaVez);
                    agendamento.Periodicidade = ZAgendamentosPeriodicidadeTabItens.ItemUmaVez;
                    break;

                case "#tabDiario":
                    agendamento.Hora = DateTime.Parse(dados.horaDiario);
                    agendamento.Periodicidade = ZAgendamentosPeriodicidadeTabItens.ItemDiario;
                    break;

                case "#tabSemanal":
                    agendamento.Hora = DateTime.Parse(dados.horaSemanal);
                    agendamento.DiasSemana = montaEnumDias(dados);
                    agendamento.Periodicidade = ZAgendamentosPeriodicidadeTabItens.ItemSemanal;
                    break;

                case "#tabMensal":
                    agendamento.Hora = DateTime.Parse(dados.horaMensal);
                    agendamento.MesesDoAno = montaEnumMeses(dados);
                    agendamento.Periodicidade = ZAgendamentosPeriodicidadeTabItens.ItemMensal;
                    break;

                case "#tabIntervalo":
                    agendamento.Hora = DateTime.Parse(dados.horaIntervalo);
                    agendamento.Periodicidade = ZAgendamentosPeriodicidadeTabItens.ItemIntervalo;
                    break;
            }
            agendamento.Save();

        }
    }

    private static string BuscaTabAtiva(int periodo)
    {
        string tabAtiva = string.Empty;

        switch (periodo)
        {
            case 1:
                tabAtiva = "#tabUmaVez";
                break;
            case 2:
                tabAtiva = "#tabDiario";
                break;
            case 3:
                tabAtiva = "#tabSemanal";
                break;
            case 4:
                tabAtiva = "#tabMensal";
                break;
            case 6:
                tabAtiva = "#tabIntervalo";
                break;
        }

        return tabAtiva;
    }


    [WebMethod]
    public static object BuscarDadosRegraConciliacao(string hnd)
    {
        Query qryRegraConciliacao = new Query(@"SELECT  A.ASSUNTOEMAIL, A.DESCRICAOEMAIL, A.ENVIAREMAIL EMAIL, A.USUARIOEMAIL USUARIOEMAIL, A.ANEXORELATORIO, A.HANDLE AHANDLE,  B.* 
                                                  FROM CT_REGRACONCILIACAOAGENDAMENTO A 
                                                  JOIN Z_AGENDAMENTOS B ON A.HANDLEAGENDAMENTO = B.HANDLE 
                                                 WHERE A.HANDLE = :HANDLE", new Parameter("HANDLE", hnd));

        var objeto = qryRegraConciliacao.Execute();
        ModelDados model = new ModelDados();
        if (objeto.Count > 0)
        {
            model.handleRegraConciliacaoAgendamento = objeto[0]["AHANDLE"].GetInt32();
            model.handleAgendamento = objeto[0]["HANDLE"].GetInt32();
            model.tabAtiva = BuscaTabAtiva(objeto[0]["PERIODICIDADE"].GetInt32());
            DateTime hora = objeto[0]["HORA"].GetDateTime();

            switch (objeto[0]["PERIODICIDADE"].GetInt32())
            {
                case 1:
                    model.dataUmaVez = objeto[0].Fields["DATA"].ToString();
                    model.horaUmaVez = hora.ToString("HH:mm");
                    break;
                case 2:
                    model.horaDiario = hora.ToString("HH:mm");
                    break;
                case 3:
                    ZAgendamentosDiasSemanaEnum diasSemana = 0;
                    model.horaSemanal = hora.ToString("HH:mm");
                    diasSemana = (ZAgendamentosDiasSemanaEnum)Enum.Parse(typeof(ZAgendamentosDiasSemanaEnum), objeto[0].Fields["DIASDASEMANA"].ToString());
                    model.checkBoxSemanalDomingo = (diasSemana.HasFlag(ZAgendamentosDiasSemanaEnum.Domingo) ? true : false);
                    model.checkBoxSemanalSegunda = (diasSemana.HasFlag(ZAgendamentosDiasSemanaEnum.Segunda) ? true : false);
                    model.checkBoxSemanalTerca = (diasSemana.HasFlag(ZAgendamentosDiasSemanaEnum.Terca) ? true : false);
                    model.checkBoxSemanalQuarta = (diasSemana.HasFlag(ZAgendamentosDiasSemanaEnum.Quarta) ? true : false);
                    model.checkBoxSemanalQuinta = (diasSemana.HasFlag(ZAgendamentosDiasSemanaEnum.Quinta) ? true : false);
                    model.checkBoxSemanalSexta = (diasSemana.HasFlag(ZAgendamentosDiasSemanaEnum.Sexta) ? true : false);
                    model.checkBoxSemanalSabado = (diasSemana.HasFlag(ZAgendamentosDiasSemanaEnum.Sabado) ? true : false);
                    break;
                case 4:
                    model.horaMensal = hora.ToString("HH:mm");
                    ZAgendamentosMesesDoAnoEnum meses = (ZAgendamentosMesesDoAnoEnum)Enum.Parse(typeof(ZAgendamentosMesesDoAnoEnum), objeto[0].Fields["MESES"].ToString());
                    model.checkBoxMensalJaneiro = (meses.HasFlag(ZAgendamentosMesesDoAnoEnum.Janeiro) ? true : false);
                    model.checkBoxMensalFevereiro = (meses.HasFlag(ZAgendamentosMesesDoAnoEnum.Fevereiro) ? true : false);
                    model.checkBoxMensalMarco = (meses.HasFlag(ZAgendamentosMesesDoAnoEnum.Marco) ? true : false);
                    model.checkBoxMensalAbril = (meses.HasFlag(ZAgendamentosMesesDoAnoEnum.Abril) ? true : false);
                    model.checkBoxMensalMaio = (meses.HasFlag(ZAgendamentosMesesDoAnoEnum.Maio) ? true : false);
                    model.checkBoxMensalJunho = (meses.HasFlag(ZAgendamentosMesesDoAnoEnum.Junho) ? true : false);
                    model.checkBoxMensalJulho = (meses.HasFlag(ZAgendamentosMesesDoAnoEnum.Julho) ? true : false);
                    model.checkBoxMensalAgosto = (meses.HasFlag(ZAgendamentosMesesDoAnoEnum.Agosto) ? true : false);
                    model.checkBoxMensalSetembro = (meses.HasFlag(ZAgendamentosMesesDoAnoEnum.Setembro) ? true : false);
                    model.checkBoxMensalOutubro = (meses.HasFlag(ZAgendamentosMesesDoAnoEnum.Outubro) ? true : false);
                    model.checkBoxMensalNovembro = (meses.HasFlag(ZAgendamentosMesesDoAnoEnum.Novembro) ? true : false);
                    model.checkBoxMensalDezembro = (meses.HasFlag(ZAgendamentosMesesDoAnoEnum.Dezembro) ? true : false);
                    break;
                case 6:
                    model.horaIntervalo = hora.ToString("HH:mm");
                    break;
            }
            model.usuarios = objeto[0].Fields["USUARIOEMAIL"].ToString();

            model.descricaoEmailTexto = objeto[0].Fields["DESCRICAOEMAIL"].ToStringForLogging();
            model.assunto = objeto[0].Fields["ASSUNTOEMAIL"].ToStringForLogging();

            model.opcoesanexarRelatorio = int.Parse(objeto[0].Fields["ANEXORELATORIO"].ToString());
            model.opcoesEnviarEmail = int.Parse(objeto[0].Fields["EMAIL"].ToString());
        }

        return model;
    }

}
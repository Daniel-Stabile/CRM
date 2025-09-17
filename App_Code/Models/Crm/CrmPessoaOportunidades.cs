using Newtonsoft.Json;
using SM.Crm.Definicoes.Comum.Oportunidades;
using SM.Crm.Definicoes.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Controllers.Models.Crm
{
    //public class ValoresOportunidadeModel
    //{
    //    public ValoresOportunidadeModel()
    //    {
    //        ValorProdutos = new ProdutosCalculadosModel();
    //        ValorSaas = new SaasCalculadoModel();
    //        ValorEscopo = new ServicosCalculadoModel();
    //    }

    //    public ProdutosCalculadosModel ValorProdutos { get; set; }
    //    public SaasCalculadoModel ValorSaas { get; set; }
    //    public ServicosCalculadoModel ValorEscopo { get; set; }
    //}

    //public class ProdutosCalculadosModel
    //{
    //    public string TotalLu;
    //    public string TotalLum;
    //    public string TotalLocacao;
    //}

    //public class SaasCalculadoModel
    //{
    //    public string TotalSaas;
    //    public string TotalDataCenter;
    //}

    //public class ServicosCalculadoModel
    //{
    //    public string TotalServicos;
    //}

    //public class TilesValorModalidadeResponseModel
    //{
    //    public TilesValorModalidadeResponseModel()
    //    {
    //        ValoresOportunidade = new ValoresOportunidadeModel();
    //        DadosModalidade = new ModalidadeModel();
    //    }

    //    public ValoresOportunidadeModel ValoresOportunidade { get; set; }
    //    public ModalidadeModel DadosModalidade { get; set; }
    //    public string MensagemRecursosFilial { get; set; }
    //    public string MensagemDesconto { get; set; }
    //    public bool OportunidadeBloqueada { get; set; }
    //    public string PerfilBennerVertical { get; set; }
    //}

    //public class ModalidadeModel
    //{
    //    public ModalidadeModel()
    //    {
    //        MostraLu = false;
    //        MostraLum = false;
    //        MostraLocacao = false;
    //        MostraServico = false;
    //        MostraBpo = false;
    //        MostraSaas = false;
    //    }        

    //    public bool MostraLu { get; set; }
    //    public bool MostraLum { get; set; }
    //    public bool MostraLocacao { get; set; }
    //    public bool MostraServico { get; set; }
    //    public bool MostraBpo { get; set; }
    //    public bool MostraSaas { get; set; }
    //}

    public class BuscaVerticalRequestModel
    {
        public string CodigoPessoa { get; set; }
        public string Vertical { get; set; }

        public List<ValorHoraRecurso> VlHoraRecurso = new List<ValorHoraRecurso>();
    }

    public class BuscaOportunidadeProdutoRequestModel
    {
        public string Oportunidade { get; set; }
        public string HandleProduto { get; set; }
    }

    //public class EscopoOportunidadeResponseModel
    //{
    //    public EscopoOportunidadeResponseModel()
    //    {
    //        EscopoPadrao = new List<EscopoPadraoModel>();
    //        Url = string.Empty;
    //        UrlTipoDeRecuso = string.Empty;
    //    }

    //    public string Url { get; set; }
    //    public TiposDeEscopo TipoDeEscopo { get; set; }
    //    public ModalidadeModel DadosModalidade { get; set; }
    //    public List<EscopoPadraoModel> EscopoPadrao { get; set; }
    //    public string TotalHorasEscopo { get; set; }
    //    public string TotalValorEscopo { get; set; }
    //    public string HandleOportunidade { get; set; }
    //    public string HandleOportunidadeProduto { get; set; }
    //    public string HandlePessoa { get; set;}
    //    public string HandleVertical { get; set; }
    //    public string NomeOportunidadeProduto { get; set; }
    //    public string SubfaseVertical { get; set; }
    //    public string ValorHoraGerencia { get; set; }
    //    public string UrlTipoDeRecuso { get; set; }
    //    public bool EhEscopoPadrao { get; set; }
    //    public bool EhPaginaModal { get; set; }
    //    public bool ValorRecursoPorContrato { get; set; }
    //    public bool SolicitacaoDesconto { get; set; }
    //    public bool AdicionalNaGerenciaProjeto { get; set; }
    //    public decimal? PorcentagemAdicionalProjeto { get; set; }
    //}

    //public enum TiposDeEscopo
    //{
    //    Oportunidade,
    //    Produto
    //}

    public class RecursosContratoResponseModel
    {
        public string Produto { get; set; }
        public string ValorUnitario { get; set; }
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    //public class EscopoPadraoModel
    //{
    //    public string Item { get; set; }
    //    public string Escopo { get; set; }
    //    public string Recurso { get; set; }
    //    public string Horas { get; set; }
    //    public string Filial { get; set; }
    //    public string ValorHora { get; set; }
    //    public string TotalServico { get; set; }
    //}

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class BindDesconto
    {
        public string Observacao;
        public bool Solicitar;
        public bool Recusada;
        public double PorcentagemLu;
        public double PorcentagemLum;
        public double PorcentagemLocacao;
        public double PorcentagemServico;
        public double PorcentagemSaas;
        public double PorcentagemBpo;

        public long HandleDesconto;
        public string NivelUsuario;

        public long Oportunidade;
        public long Versao;
        //public long UsuarioAprovacao;
        public long UsuarioSolicitacao;

    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class ServicosResponseModel
    {
        public string Servico { get; set; }
        public string Handle { get; set; }
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class BindEscopo
    {
        public string HandleProduto;
        public bool RdoEscopoPadrao;
        public string Oportunidade;
        public double AdicionalProjeto;
        public List<BindPersonalizado> BindPersonalizados;
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class BindPersonalizado
    {
        public string HandleEscopo;

        public string Atividade;
        public string HandleAtividade;
        public string Recurso;
        public string HandleRecurso;
        public string Contrato;
        public string RecursoContrato;
        public string Horas;
        public double ValorHora;

        public string HandleProduto;
        public long Sequencia;

        public bool Editou = false;
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class DeleteItemEscopo
    {
        public string Sequencia { get; set; }
        public string HandleProduto { get; set; }
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class CondicoesPagamentoOp
    {
        public string CondPagLu = "";
        public string CondPagLum = "";
        public string CondPagLoc = "";
        public string CondPagServ = "";
        public string CondPagSaas = "";
        public string CondPagBpo = "";
        public string Observacao = "";

        public long CodigoOportunidade = 0;
        public long Versao = 0;
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class BindServico
    {
        public string Servico;
        public string Handle;
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class ValorHoraRecurso
    {
        public double Valor;
        public string Recurso;
        public string Handle;
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class DadosRetornoEscopo
    {
        public double Horas;
        public double Valor;
        public double ValorHoraGerencia;
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class DadosOportunidade : TilesValorModalidadeResponseModel
    {
        public string PorcentagemDesconto;
        public string NivelUsuario;

        public string TxtOportunidade;
        public string TxtVersao;
        public string TxtStatus;
        public string TxtUsuarioInclusao;
        public string TxtUsuarioAprovacao;
        public long HandleUsuario;
        public long CodigoOportunidade;

        public string Observacao;

        public bool Existente;

        public DadosDesconto Desconto;
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class DadosDesconto
    {
        public DadosDesconto()
        {
            Observacao= string.Empty;
        }

        public double PorcentagemLu;
        public double PorcentagemLum;
        public double PorcentagemLocacao;
        public double PorcentagemServico;
        public double PorcentagemSaas;
        public double PorcentagemBpo;
        public string Observacao;
        public string TxtUsuarioAprovacao;
        public bool Editar;

        public long Handle;
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class DadosConclusao
    {
        public DadosConclusao()
        {
            ConsideracoesAdicionais = new List<CrmPoAdicionaisResponseModel>();
        }

        public List<DadosAnaliticosProdutos> Produtos;
        public List<DadosSinteticosServicos> Servicos;
        public List<DadosServicosOp> DescricaoServicos;
        public List<DadosPacoteModulos> PacoteModulos;
        public List<CrmPoAdicionaisResponseModel> ConsideracoesAdicionais;
        public DadosDesconto Desconto;
        public ModalidadeModel Modalidade;

        public string MsgDesconto;
        public bool OportunidadeBloqueada;
        public string TotalLu;
        public string TotalLum;
        public string TotalLocacao;
        public string NomeEmpresa;
        public long CodigoOportunidade;
        public long Versao;
        public string NomeModalidade = string.Empty;
        public string PerfilBennerVertical { get; set; }

        public string ValorDataCenter = string.Empty;
        public string DescricaoSaas;
        public string ValorSaas;

        public bool AdicionalNaGerenciaProjeto { get; set; }
        public string GerenciamentoProjeto;
        public string TotalServico;

        public bool PropostaEmitida;
        public bool Bloqueado;

        public bool PropostaAtiva;
        public string UrlProposta;

        public string DiferencaServico;
        public string DiferencaLu;
        public string DiferencaLum;
        public string DiferencaLocacao;

        public string Observacao;
        public string CondPagLu = "";
        public string CondPagLum = "";
        public string CondPagLocacao = "";
        public string CondPagServico = "";
        public string CondPagSaas = "";
        public string CondPagBpo = "";

        public bool MinutaImpressa;
        public bool PropostaImpressa;
        public bool DescontoPendente;
        public bool ProdutoAtivo;
        public bool StatusDeProposta;

        public bool OportunidadeAtiva;
        public string UrlAtivacao { get; set; }
    }

    public class CrmPoAdicionaisResponseModel
    {
        public string Nome { get; set; }
        public string Descricao { get; set; }
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class DadosPacoteModulos
    {
        public string Nome;
        public string Descricao;
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class DadosServicosOp
    {
        public string Nome;
        public string Descricao;
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class DadosAnaliticosProdutos
    {
        public DadosAnaliticosProdutos()
        {
            ProdutoItens = new List<ConteudoPacote>();
        }
        public string Item;
        public string Tipo;
        public string Venda;
        public long Usuarios;
        public long Empresas;
        public long Unitario;
        public string Lu;
        public string Lum;
        public string Locacao;
        public string DescricaoItem;

        public bool Grid = true;

        public string TituloNome;
        public bool TituloAtivo;

        public List<ConteudoPacote> ProdutoItens {  get; set; }
    }

    public class ConteudoPacote
    {
        public string ProdutoItemNome { get; set;}
        //public string Lu { get; set; }
        //public string Lum { get; set; }
        //public string Locacao { get; set; }
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class DadosSinteticosServicos
    {
        public DadosSinteticosServicos()
        {
            Horas = string.Empty;
            ValorHora = string.Empty;
        }

        public string Recurso;
        public string Horas;
        public string ValorHora;
        public string TotalServico;
    }

    /// <summary>
    /// SERÁ ALTERADO
    /// </summary>
    public class DadosAdicionais
    {
        public ModalidadeModel Modalidade;
        public CondicoesPagamentoOp CondicoesPagamento;

        public long CodigoOportunidade;
        public long Versao;
        public string NomeEmpresa = "";
        public string Categoria = "";
        public string NomeModalidade = "";
        public bool Bloqueado;

        public string TotalLu = "";
        public string TotalLum = "";
        public string TotalLocacao = "";
        public string ValorSaas = "";
        public string GerenciamentoProjeto = "";
        public string TotalServico = "";

        public bool OportunidadeAtiva;
    } 

    public class ContratosERecursosLeadsClientes
    {
        public string CodigoOportunidade { get; set; }
        public List<ContratoLeadsClientes> Contratos { get; set; }
        public List<RecursoLeadsClientes> Recursos { get; set; }
    }

    public class ContratoLeadsClientes
    {
        public string Contrato { get; set; }
        public int Identificador { get; set; }
    }

    public class RecursoLeadsClientes
    {
        public int IdentificadorContrato { get; set; }
        public string Recurso { get; set; }
        public string Valor { get; set; }
    }
}

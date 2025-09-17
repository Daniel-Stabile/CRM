using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmProdutoPost
/// </summary>
namespace Models.Crm
{
    public class CrmProdutoPost
    {
        public List<CrmProdutoItem> Itens = new List<CrmProdutoItem>();
        public List<CrmProdutoItemEscopo> Atividades = new List<CrmProdutoItemEscopo>();
        public List<CrmProdutoItem> Pacotes = new List<CrmProdutoItem>();
        public int QuantidadeUsuarios { get; set; }
        public long? TabelaPreco { get; set; }
        public string Categoria { get; set; }
        public decimal? DescontoLu { get; set; }
        public decimal? DescontoLum { get; set; }
        public decimal? DescontoLocacao { get; set; }
        public decimal? DescontoSaas { get; set; }
        public decimal? DescontoServico { get; set; }
        public long? Oportunidade { get; set; }
        public long? OportunidadeProd { get; set; }
        public int TipoVenda { get; set; }
        public bool ComImpostos { get; set; }
        public bool PropostaLuLum { get; set; }
        public bool PropostaLocacao { get; set; }
        public bool PropostaSaas { get; set; }
        public List<CrmImposto> Impostos = new List<CrmImposto>();
        public List<CrmProdutoUsuario> TiposUsuarios = new List<CrmProdutoUsuario>();
        public string ForaEscopo { get; set; }
        public string FormaPagamento { get; set; }
        public string CondicaoImplantacao { get; set; }
        public int? Versao { get; set; }

        public CrmProdutoPost()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}

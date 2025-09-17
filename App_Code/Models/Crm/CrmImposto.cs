using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmImposto
/// </summary>
namespace Models.Crm
{
    public class CrmImposto
    {
        public long? Handle { get; set; }
        public string Nome { get; set; }
        public decimal Aliquota { get; set; }
        public DateTime DataInicio { get; set; }
        public DateTime DataFim { get; set; }

        public CrmImposto()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmPerformanceMetaValorPorData
/// </summary>
namespace Models.Crm
{
    public class CrmPerformanceMetaValorPorData
    {
        public string Data { get; set; }
        public decimal Meta { get; set; }
        public decimal Valor { get; set; }
        public string Link { get; set; }

        public CrmPerformanceMetaValorPorData()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}
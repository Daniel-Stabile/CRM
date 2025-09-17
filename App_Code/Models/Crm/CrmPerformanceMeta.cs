using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmPerformanceMeta
/// </summary>
namespace Models.Crm
{
    public class CrmPerformanceMeta
    {
        public string Handle { get; set; }
        public string Data { get; set; }
        public string Produto { get; set; }
        public string Filial { get; set; }
        public string Executivo { get; set; }
        public string Sdr { get; set; }
        public string Grupo { get; set; }
        public List<CrmPerformanceTipo> ListaTipos = new List<CrmPerformanceTipo>();

        public CrmPerformanceMeta()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}
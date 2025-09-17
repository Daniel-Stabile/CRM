using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmPerformanceTipoPerformance
/// </summary>
namespace Models.Crm
{
    public class CrmPerformanceTipoPerformance
    {
        public string Handle { get; set; }
        public string Nome { get; set; }
        public string Tipo { get; set; }
        public string Campo { get; set; }
        public string SelecaoResultado { get; set; }
        public string Simbolo { get; set; }
        public string Resultado { get; set; }
        public List<CrmPerformanceTipoTarefa> Resultados = new List<CrmPerformanceTipoTarefa>();
        public List<CrmPerformanceOportunidade> ResultadosOportunidades = new List<CrmPerformanceOportunidade>();


        public CrmPerformanceTipoPerformance()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}
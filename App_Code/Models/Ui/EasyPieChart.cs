using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de EasyPieChart
/// </summary>
namespace Models.Ui
{
    public class EasyPieChart
    {
        public int Size             { get; set; }
        public decimal Percent      { get; set; }
        public string Text          { get; set; }
        public decimal RateBom      { get; set; }
        public decimal RateRuim     { get; set; }

        public EasyPieChart()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}
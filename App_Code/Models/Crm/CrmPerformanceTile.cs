using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmPerformanceTile
/// </summary>
namespace Models.Crm
{
    public class CrmPerformanceTile
    {
        public string HandleMetaValor   { get; set; }
        public string Mes               { get; set; }
        public string Ano               { get; set; }
        public string Filial            { get; set; }
        public string Grupo             { get; set; }
        public string Produto           { get; set; }
        public string Executivo         { get; set; }
        public string Sdr               { get; set; }
        public string Resultado         { get; set; }
        public string SelecaoResultado  { get; set; }
        public string Performance       { get; set; }
        public string PerformanceTipo   { get; set; }
        public string NomeTipo          { get; set; }
        public string Performance1      { get; set; }
        public string Performance2      { get; set; }
        public string ValorRealizados   { get; set; }
        public string Meta              { get; set; }
        public string Cor               { get; set; }
        public string Link              { get; set; }
        public string Percent           { get; set; }
        public string Resume            { get; set; }

        public CrmPerformanceTile()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }

        public void CalculaPercent()
        {
            if (ValorRealizados != null && Meta != null)
            {
                if (Meta != "0")
                {
                    Percent = ((ValorRealizados.ToDecimal() / Meta.ToDecimal()) * 100).ToString();
                    Cor = GetColor(Percent.ToDecimal());
                    Resume = "Realizado " + ValorRealizados + " / " + Meta;
                }
                else
                {
                    Percent = "100";
                    Cor = GetColor(Percent.ToDecimal());
                    Resume = "Realizado " + ValorRealizados + " / " + Meta;
                }
            }

        }

        private string GetColor(decimal result)
        {
            if (result == 100 || result > 100)
                return "green-jungle";
            if (result < 20)
                return "red-mint";
            if (result < 40)
                return "red-intense";
            if (result < 60)
                return "yellow-gold";
            if (result < 80)
                return "yellow-saffron";
            if (result < 90)
                return "green-sharp";
            if (result < 100)
                return "green-meadow";

            return "blue";
        }


    }

}
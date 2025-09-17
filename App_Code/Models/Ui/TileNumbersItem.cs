using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de TileNumbersItem
/// </summary>
namespace Models.Ui
{
    public class TileNumbersItem
    {
        public int      Number           { get; set; }
        public string   Text          { get; set; }
        public string   Link          { get; set; }
        public string   ClassNumber   { get; set; }
        public string   ClassText     { get; set; }

        public TileNumbersItem()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}
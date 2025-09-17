using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de TileNumbers
/// </summary>
namespace Models.Ui
{
    public class TileNumbers
    {
        public string Title { get; set; }
        public List<TileNumbersItem> List = new List<TileNumbersItem>(3);
        public TileNumbers()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}
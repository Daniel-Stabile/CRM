using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;


public partial class AnaliseCreditoLimitesCreditoPage : WesPage
{

    protected void Page_Load(object sender, System.EventArgs e)
    {
        LIMITESDECRDITO.RowCommandExecuted += LIMITEDECRDITO_CommandExecuted;
    }

    private void LIMITEDECRDITO_CommandExecuted(object sender, GridCommandExecuteArgs e)
    {
        switch (e.Command.Name)
        {
            case "Delete":
                LIMITEDECRDITO.InMemoryEntity = null;
                LIMITEDECRDITO.ForceUpdate();
                break;
        }
    }
}
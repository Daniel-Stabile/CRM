<%@ WebHandler Language="C#" Class="UploadMultipleFiles" %>

using System;
using System.Web;
using System.IO;
using System.Web.SessionState;
using Benner.Tecnologia.Business.Tasks;
using Benner.Tecnologia.Common.Security;
    
public class UploadMultipleFiles : IHttpHandler, IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string fileName = string.Empty;
        var requestSubmit = Newtonsoft.Json.JsonConvert.DeserializeObject<Benner.Erp.DataContracts.UploadMultipleFilesRQ>(Scramble.ScrambleText(Convert.ToString( context.Session["umfRequestSubmit"] )));
        foreach (string s in context.Request.Files)
        {
            try
            {
                HttpPostedFile file = context.Request.Files[s];
                fileName = file.FileName;
                if (!string.IsNullOrEmpty(fileName))
                {
                    var byteFile = ReadFully(file.InputStream);
                    SubmitTaskBusiness(requestSubmit, fileName, byteFile);
                }
            }
            catch (Exception e)
            {
                Benner.Tecnologia.Common.Instrumentation.Logger.LogDetail("UploadMultipleFiles.ProcessRequest[" + fileName + "]->" + e.Message);
            }
        }
    }

    private void SubmitTaskBusiness(Benner.Erp.DataContracts.UploadMultipleFilesRQ prBusinessTask, string prFileName, byte[] prFile)
    {
        prBusinessTask.Params.File = prFile;
        prBusinessTask.Params.FileName = prFileName;

        var task = BusinessTask.Factory.NewComponentTask(prBusinessTask.BusinessComponentTypeName);
        task.WithNotification();
        task.WithDescription(prBusinessTask.Description.Replace("@FILENAME", prFileName));
        task.WithRequestValue(prBusinessTask.Params);
        task.Start();

        //BennerContext.BusinessComponent.Call("Benner.Corporativo.Orcamento.Elaboracao.ImportarOrcamento, Benner.Corporativo.Orcamento", "Run", prBusinessTask.Params)
    }

    private static byte[] ReadFully(Stream input)
    {
        byte[] buffer = new byte[input.Length];
        using (MemoryStream ms = new MemoryStream())
        {
            int read;

            while ((read = input.Read(buffer, 0, buffer.Length)) > 0)
            {
                ms.Write(buffer, 0, read);
            }

            return ms.ToArray();
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}
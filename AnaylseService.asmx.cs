using Google.Protobuf.WellKnownTypes;
using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.ServiceModel.Web;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.Services.Description;
using System.Web.UI.WebControls;

namespace GPT3PDF
{
    /// <summary>
    /// Zusammenfassungsbeschreibung für AnaylseService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Wenn der Aufruf dieses Webdiensts aus einem Skript zulässig sein soll, heben Sie mithilfe von ASP.NET AJAX die Kommentarmarkierung für die folgende Zeile auf. 
    [System.Web.Script.Services.ScriptService]
    public class AnaylseService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        public PDFResponse Upload()
        {

            HttpFileCollection Files = HttpContext.Current.Request.Files;


            HttpPostedFile File = Files[0];
            byte[] pdfBytes;


            using (var binaryReader = new BinaryReader(File.InputStream))
            {
                pdfBytes = binaryReader.ReadBytes(File.ContentLength);
            }


            try
            {
                PDFAnalysis pDFAnalysis = new PDFAnalysis();
                string extract = pDFAnalysis.AnalyzePDF(pdfBytes);
                

                return new PDFResponse() { Message = extract };
                
            }
            catch (Exception ex)
            {
                
                

            }

            return new PDFResponse() { Message = "Error! " };

        }
    }

    public class PDFResponse
    {
        public string Message { get; set; } 
        
    }
}

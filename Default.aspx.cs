using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GPT3PDF
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        //protected void btnUpload_Click(object sender, EventArgs e)
        //{
        //    if (fileUpload.HasFile)
        //    {
        //        byte[] pdfBytes = fileUpload.FileBytes;
        //        try
        //        {
        //            PDFAnalysis pDFAnalysis = new PDFAnalysis();
        //            string extract = pDFAnalysis.AnalyzePDF(pdfBytes);
        //            ResultLabel.Text = extract;

        //            SqlClient.SaveReport(fileUpload.FileName, extract, this.Request.UserHostAddress);

        //        }
        //        catch (Exception ex)
        //        {
        //            SqlClient.SaveReport(fileUpload.FileName, "Error! " + ex.ToString(), this.Request.UserHostAddress);
        //            ResultLabel.Text = "Error!";
        //        }
        //    }

        //}
    }
}
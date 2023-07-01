using GPT3PDF.Models;
using MySqlX.XDevAPI.Common;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using UglyToad.PdfPig;

namespace GPT3PDF
{

    public class PDFAnalysis
    {

        private static readonly HttpClient client = new HttpClient();
        private string chatGptApiKey = ConfigurationManager.AppSettings["OpenAIApiKey"];

        private static string chatGptModel = "gpt-3.5-turbo";

        public string AnalyzePDF(byte[] file)
        {
            // Extract text from the PDF
            string pdfText = ExtractTextFromPDF(file);

            // Send the text to ChatGPT-3 for analysis
            string analysisResult = AnalyzeTextWithChatGpt(pdfText);

            return analysisResult;
        }

        private string ExtractTextFromPDF(byte[] file)
        {

            string extractedText;
            using (var pdf = PdfDocument.Open(file))
            {
                var sb = new StringBuilder();
                for (var i = 0; i < pdf.NumberOfPages; i++)
                {
                    var page = pdf.GetPage(i + 1);
                    sb.Append(page.Text);
                }
                extractedText = sb.ToString();

            }
            return extractedText;
        }
        private string AnalyzeTextWithChatGpt(string extractedText)
        {
            string responseContent = string.Empty;
            try
            {
                List<MessageObj> roles = new List<MessageObj>();
                roles.Add(new MessageObj() { role = "system", content = "Summarize the text" });
                roles.Add(new MessageObj() { role = "user", content = extractedText });
                //MessageObj[] msg;

                // Set up the OpenAI API client
                var content = new StringContent(
            JsonConvert.SerializeObject(new
            {
                model = "gpt-3.5-turbo",
                messages = roles


            }),
            Encoding.UTF8,
            "application/json");

                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + chatGptApiKey);
                //var response = client.PostAsync("https://api.openai.com/v1/engines/davinci-codex/completions", content).Result;

                var response = client.PostAsync("https://api.openai.com/v1/chat/completions", content).Result;

                responseContent = response.Content.ReadAsStringAsync().Result;

                var explanation = JsonConvert.DeserializeObject<dynamic>(responseContent).choices[0].message.content;
                return explanation;
            }
            catch (Exception ex)
            {

                Exception exception = new Exception(responseContent, ex);
                throw exception;
            }


        }
    }

}

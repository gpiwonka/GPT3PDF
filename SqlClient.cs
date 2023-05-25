using GPT3PDF.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace GPT3PDF
{
    public static class SqlClient
    {

        const string ConnectionString = "Server=MYSQL5045.site4now.net;Database=db_a4e980_st01;Uid=a4e980_st01;Pwd=Pdfanalyzer..1";

        public static List<MessageObj> GetUsers(string extractedText)
        {
            List<MessageObj> result = new List<MessageObj>();


            // SQL query to retrieve data from a table
            string query = "SELECT ai_role_name, ai_role_content, ai_extra_parameter FROM ai_roles WHERE status=1";

            try
            {
                using (MySqlConnection connection = new MySqlConnection(ConnectionString))

                {
                    // Open the connection
                    connection.Open();

                    // Create a command object
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        // Execute the query and obtain a data reader
                        using (MySqlDataReader reader = command.ExecuteReader())
                        {
                            // Check if there are rows returned
                            if (reader.HasRows)
                            {
                                // Loop through the rows and read data
                                while (reader.Read())
                                {
                                    // Access the data using the column names or indices

                                    string ai_role_name = reader.GetString(0);
                                    string ai_role_content = reader.GetString(1);
                                    string ai_extra_parameter = reader.GetString(2);

                                    if (!String.IsNullOrWhiteSpace(ai_extra_parameter)) { ai_extra_parameter = extractedText; }

                                    result.Add(new MessageObj() { role = ai_role_name, content = ai_role_content + ai_extra_parameter });

                                }
                            }

                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }

            return result;

        }

        public static void SaveReport(string filename, string response, string ip)
        {

            try
            {
                using (MySqlConnection connection = new MySqlConnection(ConnectionString))

                {

                    string query = "insert into ai_responses (filename_uploaded,ai_response_test,ip_address,response_date_time) values (@filename,@response,@ip,@responsedate)";
                    // Open the connection
                    connection.Open();

                    // Create a command object
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        var filenamePara = new MySqlParameter("@filename", MySqlDbType.VarString);
                        filenamePara.Value = filename;
                        var responsePara = new MySqlParameter("@response", MySqlDbType.VarString);
                        responsePara.Value = response;
                        var ipPara = new MySqlParameter("@ip", MySqlDbType.VarString);
                        ipPara.Value = ip;
                        var responseDatePara = new MySqlParameter("@responsedate", MySqlDbType.DateTime);
                        responseDatePara.Value = DateTime.UtcNow;

                        command.Parameters.Add(filenamePara);
                        command.Parameters.Add(responsePara);
                        command.Parameters.Add(ipPara);
                        command.Parameters.Add(responseDatePara);

                        command.ExecuteNonQuery();


                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}
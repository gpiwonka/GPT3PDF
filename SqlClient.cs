using GPT3PDF.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using MySql.Data.MySqlClient;

namespace GPT3PDF
{
    public static class SqlClient
    {

        public static List<MessageObj> GetUsers(string extractedText)
        {
            List<MessageObj> result = new List<MessageObj>();

            // Connection string to the SQL Server database
            string connectionString = "Server=MYSQL5045.site4now.net;Database=db_a4e980_st01;Uid=a4e980_st01;Pwd=Pdfanalyzer..1";

            // SQL query to retrieve data from a table
            string query = "SELECT ai_role_name, ai_role_content, ai_extra_parameter FROM ai_roles WHERE status=1";

            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
       
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
                                    
                                    string ai_role_name  = reader.GetString(0);
                                    string ai_role_content = reader.GetString(1);   
                                    string ai_extra_parameter = reader.GetString(2);

                                    if (!String.IsNullOrWhiteSpace( ai_extra_parameter)) { ai_extra_parameter = extractedText; }
                                   
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
    }
}
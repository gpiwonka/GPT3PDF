using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GPT3PDF.Models
{
    public class MessageObj
    {

        public MessageObj() { } 

        public string role { get; set; }    
        public string content { get; set; }     

    }
}
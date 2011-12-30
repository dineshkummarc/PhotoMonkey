using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Massive;

namespace Web.Model
{
    public class Questions:DynamicModel {
        public Questions()
            : base("AppConnection", "Questions", "ID", "Name")
        {

        }
    } 
}

 
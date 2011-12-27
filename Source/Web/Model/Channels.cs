using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Massive;

namespace Web.Model {
    public class Channels:DynamicModel {
        public Channels():base("Vidpub","Channels","ID") {

        }
    }
}
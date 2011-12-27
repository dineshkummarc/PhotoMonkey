using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Massive;

namespace Web.Model {
    public class VideoLog:DynamicModel {
        public VideoLog():base("Vidpub","VideoLog","ID") {

        }
    }
}
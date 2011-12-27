using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Model;
using Web.Infrastructure;
using Web.Controllers;
using Massive;
namespace Web.Areas.Reporting.Controllers{
    public class AnnualController : ApplicationController {
        public AnnualController(ITokenHandler tokenStore):base(tokenStore) {
        }

        public ActionResult Sales(int year = 2011) {

            var sales = DynamicModel.Open("AppConnection").Query("exec Reports_AnnualSales @0", year);
            return View(sales);
            //return CSV(sales, "Vidpub_Annual_" + year + ".csv");
        }

    }
}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Massive;
using Web.Model;
using Web.Infrastructure;

namespace Web.Controllers {
    public class ProductionsController : CruddyController {
        public ProductionsController(ITokenHandler tokenStore):base(tokenStore) {
            _table = new Productions();
            ViewBag.Table = _table;
        }

        public ActionResult Editor() {
            return View();
        }
    }
}

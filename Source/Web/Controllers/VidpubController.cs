using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Model;
using Web.Infrastructure;
namespace Web.Controllers{
    public class VidpubController : ApplicationController {
        public VidpubController(ITokenHandler tokenStore):base(tokenStore) {
        }

        public ActionResult Index() {
            return View();
        }
        public ActionResult Productions() {
            return View();
        }
    }
}


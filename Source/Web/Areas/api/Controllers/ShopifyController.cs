using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Model;
using Web.Infrastructure;
using Web.Controllers;
using Web.Infrastructure.Logging;
using System.Web.Script.Serialization;
namespace Web.Areas.api.Controllers{
    public class ShopifyController : ApplicationController {
        Orders _orders;
        public ShopifyController(ITokenHandler tokenStore, ILogger logger):base(tokenStore,logger) {
            _orders = new Orders();
        }

        //need to have an action for Shopify pings
        public ActionResult Receiver() {
            var order = this.SqueezeJson();
            Logger.LogInfo(order.order_number.ToString());
            return Content("OK");
        }

    }
}


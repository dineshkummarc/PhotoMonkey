using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VidPub.Web.Model;
using VidPub.Web.Infrastructure;
namespace Web.Controllers{
    public class UsersController : CruddyController {
        public UsersController(ITokenHandler tokenStore):base(tokenStore) {
            _table = new Users();
            ViewBag.Table = _table;
        }
    }
}


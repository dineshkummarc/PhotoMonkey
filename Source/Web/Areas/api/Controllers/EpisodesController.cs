﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VidPub.Web.Model;
using VidPub.Web.Infrastructure;
using VidPub.Web.Controllers;
using Massive;
namespace VidPub.Web.Areas.Api.Controllers{
    public class EpisodesController : ApplicationController {
        dynamic _episodes;
        
        public EpisodesController(ITokenHandler tokenStore):base(tokenStore) {
            _episodes = new Episodes();
        }

        public ActionResult Index(int pid=0) {
            if (pid == 0) {
                return VidpubJSON(_episodes.All());
            } else {
                return VidpubJSON(_episodes.FindBy(productionID: pid));
            }
        }
        [HttpPut]
        public ActionResult Edit() {
            var model = SqueezeJson();
            _episodes.Update(model, model.ID);
            return VidpubJSON(model);
        }

        [HttpPost]
        public ActionResult Create() {
            var model = SqueezeJson();
            _episodes.Insert(model);
            return VidpubJSON(model);
        }
    }
}


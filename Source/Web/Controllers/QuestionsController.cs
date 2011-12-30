using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Model;
using Web.Infrastructure;
using Web.Infrastructure.Logging; 
namespace Web.Controllers{
    public class QuestionsController : ApplicationController
    {
        protected dynamic _table;
        public QuestionsController(ITokenHandler tokenStore ) : base(tokenStore)
        {
            _table = new Questions();
            ViewBag.Table = _table; 
        }

        [HttpGet]
        public   ActionResult Index(string query)
        {
            IEnumerable<dynamic> results = null;
            if (!string.IsNullOrEmpty(query))
            {
                results = _table.FuzzySearch(query);
            }
            else
            {
                results = _table.All();
            }
            if (Request.IsAjaxRequest())
            {
                return VidpubJSON(results);
            }
            return View(results);
        }
        [HttpGet]
        public   ActionResult Details(int id)
        {
            var result = _table.FindBy(ID: id);
            if (Request.IsAjaxRequest())
            {
                return VidpubJSON(result);
            }
            return View(result);
        }

        [HttpGet]
        [RequireAdmin(Enabled = false)]
        public   ActionResult Create()
        {
            return View(_table.Prototype);
        }

        [HttpPost]
        [ValidateAntiForgeryToken] 
        [RequireAdmin(Enabled=false)]
        public   ActionResult Create(FormCollection collection)
        {
            var model = _table.CreateFrom(collection);
            try
            {
                // TODO: Add insert logic here
                _table.Insert(model);
                return RedirectToAction("Index");
            }
            catch (Exception x)
            {
                TempData["Error"] = "There was a problem adding this record";
                return View();
            }
        }





        [RequireAdmin(Enabled = false)]
        [HttpGet]
        public   ActionResult Edit(int id)
        {
            this.Logger.LogInfo("Hey - question / Edit  get ");
            var model = _table.Get(ID: id);
            model._Table = _table;
            return View(model);
        }

        [HttpPut]
        //[ValidateAntiForgeryToken]
        [RequireAdmin(Enabled = false)]
        public    ActionResult Edit(int id, FormCollection collection)
        {
            this.Logger.LogInfo("Hey - question / Edit  put ");
            var model = _table.CreateFrom(collection);
            try
            {
                // TODO: Add update logic here
                _table.Update(model, id);
                return RedirectToAction("Index");
            }
            catch (Exception x)
            {
                TempData["Error"] = "There was a problem editing this record";
                return View(model);
            }
        }

         
        [HttpDelete]
        [ValidateAntiForgeryToken]
        [RequireAdmin(Enabled = false)]
        public   ActionResult Delete(int id)
        {
            try
            {
                // TODO: Add delete logic here
                _table.Delete(id);
                return RedirectToAction("Index");
            }
            catch
            {
                TempData["Error"] = "There was a problem deleting this record";
            }
            return RedirectToAction("Index");
        }

    }
}


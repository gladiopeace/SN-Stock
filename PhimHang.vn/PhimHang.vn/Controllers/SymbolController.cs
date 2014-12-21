﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PhimHang.Models;
using System.Data.Entity;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace PhimHang.Controllers
{

    [Authorize]
    public class SymbolController : Controller
    {
        //
        // GET: /Symbol/
        private readonly StockRealTimeTicker _stockRealtime;
        public SymbolController()
            : this(StockRealTimeTicker.Instance, new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext())))
        {
        }
        public SymbolController(StockRealTimeTicker stockTicker, UserManager<ApplicationUser> userManager)
        {
            _stockRealtime = stockTicker;
            UserManager = userManager;
        }
       
        public UserManager<ApplicationUser> UserManager { get; private set; }

        private testEntities db = new testEntities();
        private const string ImageURLAvataDefault = "img/avatar_default.jpg";
        private const string ImageURLCoverDefault = "img/cover_default.jpg";
        private const string ImageURLAvata = "images/avatar/";
        private const string ImageURLCover = "images/cover/";

        
        public async Task<ViewResult> Index(string symbolName)
        {
            using (db = new testEntities())
            {
                var company = new StockCode();
                ApplicationUser currentUser = await UserManager.FindByIdAsync(User.Identity.GetUserId());

                #region danh muc co phieu dang follow
               

                #endregion

                #region Thong tin menu ben trai
                // Thong tin menu ben trai
                var post = await db.Posts.CountAsync(p => p.PostedBy == currentUser.UserExtentLogin.Id);
                var follow = await db.FollowUsers.CountAsync(f => f.UserId == currentUser.UserExtentLogin.Id);
                var follower = await db.FollowUsers.CountAsync(f => f.UserIdFollowed == currentUser.UserExtentLogin.Id);
                
                var countStockFollowr = await db.FollowStocks.CountAsync(f => f.UserId == currentUser.UserExtentLogin.Id && f.StockFollowed == symbolName);
                if (countStockFollowr==1)
                {
                    ViewBag.CheckStockExist = "Y";
                }
                else
                {
                    ViewBag.CheckStockExist = "N";
                }
                ViewBag.TotalPost = post;
                ViewBag.Follow = follow;
                ViewBag.Follower = follower;

                ViewBag.CoverImage = string.IsNullOrEmpty(currentUser.UserExtentLogin.AvataCover) == true ? ImageURLCoverDefault : ImageURLCover + currentUser.UserExtentLogin.AvataCover;
                ViewBag.AvataEmage = string.IsNullOrEmpty(currentUser.UserExtentLogin.AvataImage) == true ? ImageURLAvataDefault : ImageURLAvata + currentUser.UserExtentLogin.AvataImage;

                // End thong tin menu ben trai


                #endregion

                #region thong tin co phieu
                company = await db.StockCodes.FirstOrDefaultAsync(m => m.Code.ToUpper() == symbolName.ToUpper());
                ViewBag.StockCode = company == null ? StatusSymbol.NF.ToString() : symbolName.ToUpper();
                ViewBag.StockName = company == null ? StatusSymbol.NF.ToString() : company.ShortName;
                ViewBag.LongName = company == null ? StatusSymbol.NF.ToString() : company.LongName;
                ViewBag.MarketName = company == null ? StatusSymbol.NF.ToString() : company.IndexName;
                ViewBag.CureentUserId = currentUser.UserExtentLogin.Id;
                ViewBag.UserName = currentUser.UserName;
                ViewBag.AvataImageUrl = string.IsNullOrEmpty(currentUser.UserExtentLogin.AvataImage) == true ? ImageURLAvataDefault : ImageURLAvata + currentUser.UserExtentLogin.AvataImage + "?width=46&height=46&mode=crop"; 
                #endregion

                #region danh muc co phieu vua moi xem duoc luu troong cookie
                //var cookie = new HttpCookie("cookiename");

                if (Request.Cookies["HotStockCookie"] == null)
                {
                    HttpCookie hotStockCookie = new HttpCookie("HotStockCookie");
                    hotStockCookie.Value = "|";
                    hotStockCookie.Expires = DateTime.Now.AddHours(1);
                    Response.Cookies.Add(hotStockCookie);
                }
                else
                {
                    Request.Cookies["HotStockCookie"].Value = Request.Cookies["HotStockCookie"].Value.Replace("|" + symbolName, "") + "|" + symbolName;
                }

                string[] listHotStock = Request.Cookies["HotStockCookie"].Value.Split('|');

                if (listHotStock.Length > 11) // neu xem hon 10 co phieu thi chi hien thi 10 co phieu dau tien
                {
                    Request.Cookies["HotStockCookie"].Value = Request.Cookies["HotStockCookie"].Value.Remove(0, Request.Cookies["HotStockCookie"].Value.IndexOf("|", 1)); // hien thi 10 co phieu đau tien
                    listHotStock = Request.Cookies["HotStockCookie"].Value.Split('|');
                }
                List<string> listHotStockToArray = new List<string>();
                foreach (var item in listHotStock)
                {
                    listHotStockToArray.Add(item);
                }
                var hotStockPrice = _stockRealtime.GetAllStocksTestList(listHotStockToArray).Result;

                ViewBag.HotStockPriceList = hotStockPrice.Count() == 0 ? new List<StockRealTime>() : hotStockPrice;
                #endregion


                //return View(_stockRealtime.GetAllStocksTestList((List<string>)Session["listStock"]).Result);
                return View(currentUser);
            }
        }

        //[Authorize]
        

        //
        // GET: /Symbol/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Symbol/Create
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Symbol/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Symbol/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Symbol/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Symbol/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Symbol/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        #region Extent
        public enum StatusSymbol
        {
            NF
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && UserManager != null)
            {
                UserManager.Dispose();
                UserManager = null;
            }
            base.Dispose(disposing);
        }

        #endregion
    }
}

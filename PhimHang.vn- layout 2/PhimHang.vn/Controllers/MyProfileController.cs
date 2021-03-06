﻿using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using PhimHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;

namespace PhimHang.Controllers
{

        [Authorize]
    public class MyProfileController : Controller
    {
        //
        // GET: /MyProfile/
       private readonly FilterKeyworkSingleton _keyword;
        public MyProfileController()
            : this(FilterKeyworkSingleton.Instance, new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext())))
        {
        }
        public MyProfileController(FilterKeyworkSingleton KeyworkSing, UserManager<ApplicationUser> userManager)
        {
            _keyword = KeyworkSing;
            UserManager = userManager;
        }
       

        public UserManager<ApplicationUser> UserManager { get; private set; }

        private testEntities db;
        private const string ImageURLAvataDefault = "img/avatar_default.jpg";
        private const string ImageURLCoverDefault = "img/cover_default.jpg";
        private const string ImageURLAvata = "images/avatar/";
        private const string ImageURLCover = "images/cover/";

        public async Task<ActionResult> Index()
        {
            // get user info
            Session["DataTimeVistProfile"] = DateTime.Now;

            using (db = new testEntities())
            {
                ApplicationUser currentUser = await UserManager.FindByIdAsync(User.Identity.GetUserId());

                #region Thong tin menu ben trai
                // thong tin bai phim
                var post = await db.Posts.CountAsync(p => p.PostedBy == currentUser.UserExtentLogin.Id);
                var follow = await db.FollowUsers.CountAsync(f => f.UserId == currentUser.UserExtentLogin.Id);
                var follower = await db.FollowUsers.CountAsync(f => f.UserIdFollowed == currentUser.UserExtentLogin.Id);


                ViewBag.TotalPost = post;
                ViewBag.Follow = follow;
                ViewBag.Follower = follower;
                ViewBag.CureentUserId = currentUser.UserExtentLogin.Id;
                ViewBag.UserName = currentUser.UserName;
                ViewBag.AvataImageUrl = string.IsNullOrEmpty(currentUser.UserExtentLogin.AvataImage) == true ? ImageURLAvataDefault : ImageURLAvata + currentUser.UserExtentLogin.AvataImage + "?width=46&height=46&mode=crop"; 
                ViewBag.CoverImage = string.IsNullOrEmpty(currentUser.UserExtentLogin.AvataCover) == true ? ImageURLCoverDefault : ImageURLCover + currentUser.UserExtentLogin.AvataCover;
                ViewBag.AvataEmage = string.IsNullOrEmpty(currentUser.UserExtentLogin.AvataImage) == true ? ImageURLAvataDefault : ImageURLAvata + currentUser.UserExtentLogin.AvataImage;
                // End thong tin menu ben trai
                #endregion

                #region danh muc co phieu vua moi xem duoc luu troong cookie
               /* //var cookie = new HttpCookie("cookiename");

                if (Request.Cookies["HotStockCookie" + currentUser.Id] == null)
                {
                    Response.Cookies.Clear();
                    Response.Cookies["HotStockCookie" + currentUser.Id].Value = "";
                    Response.Cookies["HotStockCookie" + currentUser.Id].Expires = DateTime.Now.AddDays(1);
                }
                string[] listHotStock = Request.Cookies["HotStockCookie" + currentUser.Id].Value.Split('|');

                List<string> listHotStockToArray = new List<string>();
                foreach (var item in listHotStock)
                {
                    listHotStockToArray.Add(item);
                }
                //var hotStockPrice = _stockRealtime.GetAllStocksTestList(listHotStockToArray).Result;

                //ViewBag.HotStockPriceList = hotStockPrice.Count() == 0 ? new List<StockRealTime>() : hotStockPrice;
                * */
                #endregion

                #region danh muc dau tu
                var followstocks = await db.FollowStocks.Where(f => f.UserId == currentUser.UserExtentLogin.Id).ToListAsync();
                var listfollowstocksString = (from sf in followstocks                                              
                                             select sf.StockFollowed).ToList();

                var DMDTShortName = (from fs in db.FollowStocks.ToList()
                                           join s in db.StockCodes.ToList() on fs.StockFollowed equals s.Code
                                           where listfollowstocksString.Contains(fs.StockFollowed)
                                           select new StockDetail
                                           {
                                               Stock = fs.StockFollowed,
                                               ShortName = s.ShortName
                                           }).ToList();

                ViewBag.HotStockDMDT =  DMDTShortName;//_stockRealtime.GetAllStocksTestList(listfollowstocksString).Result;                        
                #endregion

                #region nhung tin nam trong danh muc dau tu
                
                #endregion

                return View(currentUser);
            }
        }

       
            

        //
        // GET: /MyProfile/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /MyProfile/Create
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /MyProfile/Create
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
        // GET: /MyProfile/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /MyProfile/Edit/5
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
        // GET: /MyProfile/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /MyProfile/Delete/5
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
    }
        public class StockDetail
        {
            public string Stock { get; set; }
            public string ShortName { get; set; }
        }
}

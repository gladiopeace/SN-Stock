﻿using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using PhimHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Data.Entity;

namespace PhimHang.Controllers
{

    public class CommentController : ApiController
    {
        private testEntities db = new testEntities();
        // GET api/comment
        
        public CommentController()
            : this(new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext())))
        {            
            
        }
        public CommentController(UserManager<ApplicationUser> userManager)
        {
            UserManager = userManager;
        }

        public UserManager<ApplicationUser> UserManager { get; private set; }
        // GET: /Post/
        
        private const string ImageURLAvataDefault = "img/avatar_default.jpg";
        private const string ImageURLAvata = "images/avatar/";


       /* public async Task<dynamic> Get(string stockCurrent)
        {

            var ret = (from stockRelate in await db.StockRelates.ToListAsync()
                       where stockRelate.StockCodeRelate == stockCurrent
                       orderby stockRelate.Post.PostedDate descending
                       select new
                       {
                           Message = stockRelate.Post.Message,
                           PostedBy = stockRelate.Post.PostedDate,
                           PostedByName = stockRelate.Post.UserLogin.FullName,
                           PostedByAvatar = string.IsNullOrEmpty(stockRelate.Post.UserLogin.AvataImage) ? ImageURLAvataDefault : ImageURLAvata + stockRelate.Post.UserLogin.AvataImage,
                           PostedDate = stockRelate.Post.PostedDate,
                           PostId = stockRelate.PostId
                       }).AsEnumerable();

            return ret;
        }
        * */

        // GET api/comment/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/comment
        public void Post([FromBody]string value)
        {

        }

        // PUT api/comment/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/comment/5
        public void Delete(int id)
        {
        }
    }
}

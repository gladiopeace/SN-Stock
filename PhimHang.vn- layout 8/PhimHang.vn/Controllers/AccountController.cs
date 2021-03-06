﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using PhimHang.Models;
using System.IO;
using System.Drawing;
using System.Data.Entity;
using System.Net;
using Newtonsoft.Json.Linq;
using System.Threading;

namespace PhimHang.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {     
         
         public AccountController()
             : this(new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext())))
         {
         }
        public AccountController( UserManager<ApplicationUser> userManager)
        {
            
            UserManager = userManager;
            UserManager.UserValidator = new UserValidator<ApplicationUser>(UserManager) { AllowOnlyAlphanumericUserNames = false };

        }
        public UserManager<ApplicationUser> UserManager { get; private set; }

        private testEntities db = new testEntities();
        [AllowAnonymous]
        public ActionResult Index(string returnUrl)
        {
            if (returnUrl != null)
            {
                ViewBag.ReturnUrl = returnUrl;
            }

            return View();
        }
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

       
        //
        // POST: /Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(LoginViewModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                ViewBag.ReturnUrl = returnUrl;
                var user = await UserManager.FindAsync(model.UserName, model.Password);
                if (user != null)
                {
                    await SignInAsync(user, model.RememberMe);
                    if (string.IsNullOrEmpty(returnUrl) || returnUrl == "/")
                    {
                        return RedirectToAction("", "myprofile"); 
                    }
                    else
                    {
                        return RedirectToLocal(returnUrl); 
                    }                    
                }
                else
                {
                    ModelState.AddModelError("", "Sai tài khoản hoặc mật khẩu");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        /// <summary>
        /// Form register An Account
        /// </summary>
        /// <param name="returnUrl"></param>
        /// <returns></returns>
        [AllowAnonymous]
        public ActionResult Register(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            //var testEmail = AppHelper.sendEmail("AnhCOpne", "hieu.nguyen@vfs.com.vn", "mylove@07", "tomtruong@phochungkhoan.com", AppHelper.ResetPasswordEmailTemplatePath);
            return View();
        }


        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> request_password_reset(ResetPasswordModel model)
        {
            if (ModelState.IsValid)
            {
                using (db = new testEntities())
                {
                    var user = await db.UserLogins.FirstOrDefaultAsync(ul => ul.Email == model.Email);
                    if (user !=null)
                    {
                        
                        ViewBag.Info = 1;
                        ViewBag.Status = "Email được gửi thành công, vui lòng đăng nhập Inbox hoặc Spam mail để nhận được link đổi mật khẩu";

                        var checkReset = await db.UserLogExtents.FirstOrDefaultAsync(ule => ule.Username == user.UserNameCopy);
                        if (checkReset != null)
                        {
                            // udpate
                            checkReset.TokenResetPass = Guid.NewGuid().ToString();
                            checkReset.TimeResetExpire = DateTime.Now.AddHours(3);
                            checkReset.IsReset = false;
                            db.Entry(checkReset).State = EntityState.Modified;
                            // send email

                            try
                            {
                                await db.SaveChangesAsync();
                                // send link email reset pass
                                String contentEmail = AppHelper.GetContentTemplate(AppHelper.ResetPasswordEmailTemplatePath, checkReset.TokenResetPass, checkReset.Username);
                                AppHelper.sendEmail("Link thay đổi mật khẩu | Phochungkhoan.com", checkReset.EmailReset, contentEmail);
                            }
                            catch (Exception)
                            {

                                // bug
                            }
                        }
                        else
                        {
                            // insert
                            var userExtent = new UserLogExtent { Username = user.UserNameCopy, TokenResetPass = Guid.NewGuid().ToString(), TimeResetExpire = DateTime.Now.AddHours(3), EmailReset = user.Email, UserId = user.KeyLogin };
                            db.UserLogExtents.Add(userExtent);
                            //send email
                            try
                            {

                                await db.SaveChangesAsync();
                                // send link email reset pass
                                String contentEmail = AppHelper.GetContentTemplate(AppHelper.ResetPasswordEmailTemplatePath, userExtent.TokenResetPass, userExtent.Username);
                                AppHelper.sendEmail("Link thay đổi mật khẩu | Phochungkhoan.com", userExtent.EmailReset, contentEmail);

                            }
                            catch (Exception)
                            {

                                // bug
                            }
                        }

                    }
                    else
                    {
                        //ViewBag.Info = 1;
                        //ViewBag.Status = "Không tồn tại email trong hệ thống";
                        return RedirectToAction("password_reset_result", new { Message = ManageMessageId.NotExist });
                    }
                }
            }
            //return View("request_password_reset", new ResetPasswordModel { Email = model.Email });

            return View();
        }

        [AllowAnonymous]
        
        public ActionResult request_password_reset()
        {
            ViewBag.Info = 0;
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> confirm_password_reset(ResetPassConfirm model)
        {
            if (ModelState.IsValid)
            {
                using (db = new testEntities())
                {
                    var userReset = await db.UserLogExtents.FirstOrDefaultAsync(ul => ul.TokenResetPass == model.Token && ul.TimeResetExpire > DateTime.Now && ul.IsReset == false);
                    if (userReset != null)
                    {
                        // reset password
                        ApplicationDbContext context = new ApplicationDbContext();
                        UserStore<ApplicationUser> store = new UserStore<ApplicationUser>(context);
                        String hashedNewPassword = UserManager.PasswordHasher.HashPassword(model.NewPassword);
                        ApplicationUser cUser = await store.FindByIdAsync(userReset.UserId);
                        
                        // update token
                        userReset.TimeResetExpire = DateTime.Now;
                        userReset.IsReset = true;
                        userReset.TokenResetPass = "";
                        try
                        { // reset success
                            await store.SetPasswordHashAsync(cUser, hashedNewPassword);
                            await store.UpdateAsync(cUser);
                            db.Entry(userReset).State = EntityState.Modified;
                            await db.SaveChangesAsync();
                            return RedirectToAction("password_reset_result", new { Message = ManageMessageId.SetPasswordSuccess });
                        }
                        catch (Exception)
                        {
                            // error log
                            return RedirectToAction("password_reset_result", new { Message = ManageMessageId.Error });
                        }                        
                    }
                    else
                    {
                        // thong bao, token expire
                        return RedirectToAction("password_reset_result", new { Message = ManageMessageId.Error });
                    }
                }
            }
            return View();
        }

        [AllowAnonymous]
        public async Task<ActionResult> confirm_password_reset(string token)
        {
            var userReset = await db.UserLogExtents.CountAsync(ul => ul.TokenResetPass == token);
            if (userReset == 0)
            {
                return RedirectToAction("password_reset_result", new { Message = ManageMessageId.Error });
            }
            ViewBag.Info = 0;
            ViewBag.Token = token;
            return View();
        }

        [AllowAnonymous]
        public ActionResult password_reset_result(ManageMessageId? message)
        {
            ViewBag.StatusMessage =
              message == ManageMessageId.ChangePasswordSuccess ? "Your password has been changed."
              : message == ManageMessageId.SetPasswordSuccess ? "<div style='color:green'>Thay đổi mật khẩu thành công</div>"
              : message == ManageMessageId.RemoveLoginSuccess ? "The external login was removed."
              : message == ManageMessageId.Error ? "<div style='color:red'>Lỗi hoặc link thay đổi hết hạn</div>"
              : message == ManageMessageId.NotExist ? "<div style='color:red'>Email không tồn tại trong hệ thống</div>"
              : "";
            return View();
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(RegisterViewModel model)
        {            
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser()
                {
                    UserName = model.UserName,
                    //AvataImage = "default_avatar_medium.jpg",
                    //FullName = model.FullName,
                    //   CreatedDate = DateTime.Now,
                    //   Verify = Verify.NO
                };
                user.UserExtentLogin = new UserExtentLogin { Email = model.Email, KeyLogin = user.Id, CreatedDate = DateTime.Now, FullName = model.FullName, Verify = Verify.NO, UserNameCopy = model.UserName , CharacterLimit = 200};


                // check email
                var checkEmail = await db.UserLogins.FirstOrDefaultAsync(ul => ul.Email == model.Email);
                if (checkEmail != null)
                {
                    OutputErrors("Email đã tồn tại trong hệ thống");
                }
                else
                {
                    var result = await UserManager.CreateAsync(user, model.Password);
                    if (result.Succeeded)
                    {
                        await SignInAsync(user, isPersistent: false);
                        //send mail
                        String contentEmail = AppHelper.GetContentTemplate(AppHelper.RegisterEmailTemplatePath, user.UserName);
                        AppHelper.sendEmail("Thư đăng ký tài khoản | Phochungkhoan.com", user.UserExtentLogin.Email, contentEmail);
                        //
                        return RedirectToAction("Index", "myprofile");
                    }
                    else
                    {
                        AddErrors(result);
                    }
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // POST: /Account/Disassociate
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Disassociate(string loginProvider, string providerKey)
        {
            ManageMessageId? message = null;
            IdentityResult result = await UserManager.RemoveLoginAsync(User.Identity.GetUserId(), new UserLoginInfo(loginProvider, providerKey));
            if (result.Succeeded)
            {
                message = ManageMessageId.RemoveLoginSuccess;
            }
            else
            {
                message = ManageMessageId.Error;
            }
            return RedirectToAction("Manage", new { Message = message });
        }
        // GET: /Account
        //public ActionResult Index()
        //{

        //    return View();
        //}

        // GET: /Profile
        public ActionResult Profile(ManageMessageId? message)
        {

            ViewBag.StatusMessage =
               message == ManageMessageId.UpdateSucess ? "Cập nhật tài khoản thành công."               
               : "";
            ProfileUserViewModel profile = new ProfileUserViewModel();
            ApplicationUser user = UserManager.FindById(User.Identity.GetUserId());
            if (user == null) // if session of user has expire
            {
                return RedirectToAction("Login");
            }
            else // user not null
            {
                loadInfoUser(user);
                profile.UserName = user.UserName;
                profile.Mobile = user.UserExtentLogin.Mobile;
                profile.FullName = user.UserExtentLogin.FullName;
                profile.Email = user.UserExtentLogin.Email;
                profile.BirthDay =  user.UserExtentLogin.BirthDate;
                profile.CreatedDate = user.UserExtentLogin.CreatedDate.ToString("dd/MM/yyyy");
                profile.Verify = user.UserExtentLogin.Verify;//== null? Verify.NO: Verify.YES;
                profile.Status = user.UserExtentLogin.Status;
                profile.Avata = string.IsNullOrEmpty(user.UserExtentLogin.AvataImage) == true ? AppHelper.ImageURLAvataDefault : AppHelper.ImageURLAvata + user.UserExtentLogin.AvataImage;
                profile.JobTitle = user.UserExtentLogin.JobTitle;
                profile.URLFacebook = user.UserExtentLogin.URLFacebook;
                profile.CVInfo = user.UserExtentLogin.CVInfo;
                profile.PhilosophyMarket = user.UserExtentLogin.PhilosophyMarket;
                profile.NumberExMarketYear = user.UserExtentLogin.NumberExMarketYear;
                profile.AvatarSyn = user.UserExtentLogin.AvatarSyn;
            }
            ViewBag.AvataEmage = string.IsNullOrEmpty(user.UserExtentLogin.AvataImage) == true ? AppHelper.ImageURLAvataDefault : AppHelper.ImageURLAvata + user.UserExtentLogin.AvataImage;
            //ViewBag.ImageUrlCover = ImageURLCover + user.UserExtentLogin.AvataCover;
            return View(profile);
        }
       
        [HttpPost]
        [ValidateAntiForgeryToken]        
        public async Task<ActionResult> Profile(ProfileUserViewModel model)
        {
            ApplicationUser user = UserManager.FindById(User.Identity.GetUserId());
            loadInfoUser(user);
            if (ModelState.IsValid)
            {
                using (db = new testEntities())
                {
                    if (user != null)
                    {
                        if (model.Email != user.UserExtentLogin.Email)
                        {
                            // kiem tra ton tai email trong he thong
                            //checkemail exists
                            int checkemail = await db.UserLogins.CountAsync(ue => ue.Email == model.Email && ue.UserNameCopy != user.UserName);
                            if (checkemail > 0)
                            {                                
                                ModelState.AddModelError("Email", "Email đã tồn tại trong hệ thống, Vui lòng chọn Email khác");
                                return View(model);
                            }
                            else
                            {
                                user.UserExtentLogin.Email = model.Email;
                            }
                        }
                        user.UserExtentLogin.FullName = model.FullName;
                        user.UserExtentLogin.Mobile = model.Mobile;                        
                        user.UserExtentLogin.BirthDate = model.BirthDay;
                        user.UserExtentLogin.Status = model.Status;
                        user.UserExtentLogin.JobTitle = model.JobTitle;
                        user.UserExtentLogin.URLFacebook = string.IsNullOrEmpty(model.URLFacebook) ? "" : "http://" + model.URLFacebook.Replace("http://", "").Replace("https://", "").Replace("www.", "");
                        user.UserExtentLogin.CVInfo = model.CVInfo;
                        user.UserExtentLogin.NumberExMarketYear = model.NumberExMarketYear;
                        user.UserExtentLogin.PhilosophyMarket = model.PhilosophyMarket;
                        user.UserExtentLogin.AvatarSyn = model.AvatarSyn;
                    }
                    else
                    {
                        return RedirectToAction("Login");
                    }

                    IdentityResult result = await UserManager.UpdateAsync(user);
                    if (result.Succeeded)
                    {
                        return RedirectToAction("Profile", new { Message = ManageMessageId.UpdateSucess });
                    }
                    else
                    {
                        AddErrors(result);
                    }
                }
            }
            
            return View(model);
        }
        private void loadInfoUser(ApplicationUser user)
        {
            var avataSyn = new List<dynamic>
            {
                new { Id = true, Name = "YES" },
                new { Id = false, Name = "NO" },
            }.ToList();
            var listJob = db.JobTitiles.ToList();
                    //{                         
                    //    new { Id = 1, Name = "Quản lý" },
                    //    new { Id = 2, Name = "Thợ rèn" },
                    //    new { Id = 3, Name = "Nông trại" }                        
                    //}.ToList();

            var listNumberExMarketYear = new List<dynamic>
                    {                         
                        new { Id = 1, Name = "1 năm" },
                        new { Id = 2, Name = "2 năm" },
                        new { Id = 3, Name = "3 năm" },
                        new { Id = 4, Name = "4 năm" },
                        new { Id = 5, Name = "5 năm" },
                        new { Id = 6, Name = "Nhiều năm" } 
                        
                    }.ToList();

            var listPhilosophyMarket = db.Philosophies.ToList();


            ViewBag.ListJob = new SelectList(listJob, "IdJob", "JobName");
            ViewBag.ListNumberExMarketYear = new SelectList(listNumberExMarketYear, "Id", "Name");
            ViewBag.ListPhilosophyMarket = new SelectList(listPhilosophyMarket, "Id", "PhilosophyName");
            ViewBag.ListavataSyn = new SelectList(avataSyn, "Id", "Name");
        }
        [HttpPost]
        public async Task<string> AvataUpload()
        {
            var uploadfileid_avata = HttpContext.Request.Files["UploadedImage"];
            #region check valid file

            var validImageTypes = new string[]
                                                {
                                                    "image/gif",
                                                    "image/jpeg",
                                                    "image/pjpeg",
                                                    "image/png"
                                                };
            if (uploadfileid_avata == null || uploadfileid_avata.ContentLength == 0) // check file null or file corrupt
            {
                return "Chưa chọn file upload";
            }

            if (!validImageTypes.Contains(uploadfileid_avata.ContentType)) // check file type
            {
                return "Please choose either a GIF, JPG or PNG image.";
            }

            if (uploadfileid_avata.ContentLength > 4000000) // check file size
            {
                return "File's very larg: File must be less than 700KB";
            }

            #endregion
            else
            {
                //save file
                #region get directory

                ApplicationUser user = UserManager.FindById(User.Identity.GetUserId());
                var uploadDir = "~/" + AppHelper.ImageURLAvata;
                string NameFiletimeupload = user.Id + DateTime.Now.ToString("HHmmss") + "_avata";
                var imagePath = Path.Combine(Server.MapPath(uploadDir), NameFiletimeupload + Path.GetExtension(uploadfileid_avata.FileName));
                var imageUrl = AppHelper.ImageURLAvata + NameFiletimeupload + Path.GetExtension(uploadfileid_avata.FileName);
                uploadfileid_avata.SaveAs(imagePath);

                
               
                #endregion
                //delete old avata image

                #region delete old avata image

                string fullPath = Server.MapPath(uploadDir) + user.UserExtentLogin.AvataImage;
                if (System.IO.File.Exists(fullPath))
                {
                    System.IO.File.Delete(fullPath);
                }

                #endregion
                //
                #region update new avata on server

                user.UserExtentLogin.AvataImage = NameFiletimeupload + Path.GetExtension(uploadfileid_avata.FileName);
                try
                {
                    IdentityResult result = await UserManager.UpdateAsync(user);
                    if (result.Succeeded)
                    {
                        //ViewBag.imageUrlAvata = imageUrl;
                        return "YES|" + imageUrl;
                    }
                    else
                    {
                        return "Cập nhật dữ liệu thất bại";
                    }
                }
                catch (Exception)
                {
                    return "Cập nhật dữ liệu thất bại";                    
                }
                
               
                #endregion

            }

        }
        
        [HttpPost]
        public async Task<string> CoverUpload()
        {
            var uploadfileid_cover = HttpContext.Request.Files["UploadedImage"];
            #region check valid file

            var validImageTypes = new string[]
                                                {
                                                    "image/gif",
                                                    "image/jpeg",
                                                    "image/pjpeg",
                                                    "image/png"
                                                };
            if (uploadfileid_cover == null || uploadfileid_cover.ContentLength == 0) // check file null or file corrupt
            {
                return "Chưa chọn file upload";
            }

            if (!validImageTypes.Contains(uploadfileid_cover.ContentType)) // check file type
            {
                return "Please choose either a GIF, JPG or PNG image.";
            }

            if (uploadfileid_cover.ContentLength > 5000000) // check file size
            {
                return "File's very large: File must be less than 700KB";
            }

            #endregion
            else
            {
                //save file
                #region get directory

                ApplicationUser user = UserManager.FindById(User.Identity.GetUserId()); // get user's logging
                var uploadDir = "~" + AppHelper.ImageURLCover;
                string NameFiletimeupload = user.Id + DateTime.Now.ToString("HHmmss") + "_cover";
                var imagePath = Path.Combine(Server.MapPath(uploadDir), NameFiletimeupload + Path.GetExtension(uploadfileid_cover.FileName));
                var imageUrl = AppHelper.ImageURLCover + NameFiletimeupload + Path.GetExtension(uploadfileid_cover.FileName);
                uploadfileid_cover.SaveAs(imagePath);



                #endregion
                //delete old avata image

                #region delete old avata image

                string fullPath = Server.MapPath(uploadDir) + user.UserExtentLogin.AvataCover;
                if (System.IO.File.Exists(fullPath))
                {
                    System.IO.File.Delete(fullPath);
                }

                #endregion
                //
                #region update new avata on server

                user.UserExtentLogin.AvataCover = NameFiletimeupload + Path.GetExtension(uploadfileid_cover.FileName);
                user.UserExtentLogin.CoverPosition = "";
                IdentityResult result = await UserManager.UpdateAsync(user);
                if (result.Succeeded)
                {
                    //ViewBag.imageUrlAvata = imageUrl;
                    return "YES|" + imageUrl;
                }
                else
                {
                    return "Cập nhật dữ liệu thất bại";
                }
                #endregion

            }

        }

        [HttpPost]
        public  async Task<string> resizeImage(int positionHeight)
        {
            ApplicationUser user = UserManager.FindById(User.Identity.GetUserId()); // get user's logging
            user.UserExtentLogin.CoverPosition = positionHeight + "px";
            try
            {
                IdentityResult result = await UserManager.UpdateAsync(user);
                return "Y";
            }
            catch (Exception)
            {
                return "N" ;
            }            
        }

        public int getRightHeight(int defaultWidth, int defaultHeight, int tyleMoi)
		{


            return (defaultHeight * tyleMoi) / defaultWidth;			
			
		}
      
        // GET: /Account/Manage
        public ActionResult Manage(ManageMessageId? message)
        {
            ViewBag.StatusMessage =
                message == ManageMessageId.ChangePasswordSuccess ? "Your password has been changed."
                : message == ManageMessageId.SetPasswordSuccess ? "Your password has been set."
                : message == ManageMessageId.RemoveLoginSuccess ? "The external login was removed."
                : message == ManageMessageId.Error ? "An error has occurred."
                : "";
            ViewBag.HasLocalPassword = HasPassword();
            ViewBag.ReturnUrl = Url.Action("Manage");
            return View();
        }

        //
        // POST: /Account/Manage
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Manage(ManageUserViewModel model)
        {
            bool hasPassword = HasPassword();
            ViewBag.HasLocalPassword = hasPassword;
            ViewBag.ReturnUrl = Url.Action("Manage");
            if (hasPassword)
            {
                if (ModelState.IsValid)
                {
                    IdentityResult result = await UserManager.ChangePasswordAsync(User.Identity.GetUserId(), model.OldPassword, model.NewPassword);
                    if (result.Succeeded)
                    {
                        return RedirectToAction("Manage", new { Message = ManageMessageId.ChangePasswordSuccess });
                    }
                    else
                    {
                        AddErrors(result);
                    }
                }
            }
            else
            {
                // User does not have a password so remove any validation errors caused by a missing OldPassword field
                ModelState state = ModelState["OldPassword"];
                if (state != null)
                {
                    state.Errors.Clear();
                }

                if (ModelState.IsValid)
                {
                    IdentityResult result = await UserManager.AddPasswordAsync(User.Identity.GetUserId(), model.NewPassword);
                    if (result.Succeeded)
                    {
                        return RedirectToAction("Manage", new { Message = ManageMessageId.SetPasswordSuccess });
                    }
                    else
                    {
                        AddErrors(result);
                    }
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // POST: /Account/ExternalLogin
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult ExternalLogin(string provider, string returnUrl)
        {
            // Request a redirect to the external login provider
            return new ChallengeResult(provider, Url.Action("ExternalLoginCallback", "Account", new { ReturnUrl = returnUrl }));
        }

        //
        // GET: /Account/ExternalLoginCallback
        [AllowAnonymous]
        public async Task<ActionResult> FacebookLogin(string token)
        {
            WebClient client = new WebClient();            
            string JsonResult = client.DownloadString(string.Concat(
                   "https://graph.facebook.com/me?access_token=", token));
          
            JObject jsonUserInfo = JObject.Parse(JsonResult);         
            string id = jsonUserInfo.Value<string>("id");
            string nameonFb = jsonUserInfo.Value<string>("name");
            
            // store user's information here...
            var getUserFacebook = await db.UserLogins.FirstOrDefaultAsync(u => u.IdFacebook == id);
            if (getUserFacebook!=null)
            {
                if (getUserFacebook.AvatarSyn == true) // cập nhật avatar tự động từ facebook
                {
                    // update avatar
                    await AppHelper.AvatarSyn(getUserFacebook.IdFacebook);
                }
                // login\
                var user = await UserManager.FindAsync(getUserFacebook.UserNameCopy, "cungphim.com@9999");
                await SignInAsync(user, false);
                AppHelper.SetCookieOfFace();
                return RedirectToAction("","myprofile"); // Returun URL
            }
            else
            {

                return View("ExternalLoginConfirmation", new ExternalLoginConfirmationViewModel { UserName = AppHelper.ConvertToNonUnicode(nameonFb.RemoveSpecialString().Replace(" ","")), Token = token });
            }
            
            //return View();
        }
        [AllowAnonymous]
        public async Task<ActionResult> ExternalLoginCallback(string returnUrl)
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync();
            if (loginInfo == null)
            {
                return RedirectToAction("Login");
            }

            // Sign in the user with this external login provider if the user already has a login
            var user = await UserManager.FindAsync(loginInfo.Login);
            if (user != null)
            {
                await SignInAsync(user, isPersistent: false);
                return RedirectToLocal(returnUrl);
            }
            else
            {
                // If the user does not have an account, then prompt the user to create an account
                ViewBag.ReturnUrl = returnUrl;
                ViewBag.LoginProvider = loginInfo.Login.LoginProvider;
                return View("ExternalLoginConfirmation", new ExternalLoginConfirmationViewModel { UserName = loginInfo.DefaultUserName });
            }
        }

        //
        // POST: /Account/LinkLogin
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LinkLogin(string provider)
        {
            // Request a redirect to the external login provider to link a login for the current user
            return new ChallengeResult(provider, Url.Action("LinkLoginCallback", "Account"), User.Identity.GetUserId());
        }

        //
        // GET: /Account/LinkLoginCallback
        public async Task<ActionResult> LinkLoginCallback()
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync(XsrfKey, User.Identity.GetUserId());
            if (loginInfo == null)
            {
                return RedirectToAction("Manage", new { Message = ManageMessageId.Error });
            }
            var result = await UserManager.AddLoginAsync(User.Identity.GetUserId(), loginInfo.Login);
            if (result.Succeeded)
            {
                return RedirectToAction("Manage");
            }
            return RedirectToAction("Manage", new { Message = ManageMessageId.Error });
        }

        //
        // POST: /Account/ExternalLoginConfirmation
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ExternalLoginConfirmation(ExternalLoginConfirmationViewModel model, string returnUrl)
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Manage");
            }

            if (ModelState.IsValid)
            {
                WebClient client = new WebClient();
                string JsonResult = client.DownloadString(string.Concat(
                       "https://graph.facebook.com/me?access_token=", model.Token));
                // Json.Net is really helpful if you have to deal
                // with Json from .Net http://json.codeplex.com/
                JObject jsonUserInfo = JObject.Parse(JsonResult);
                // you can get more user's info here. Please refer to:
                //     http://developers.facebook.com/docs/reference/api/user/
                string name = jsonUserInfo.Value<string>("name");
                string email = jsonUserInfo.Value<string>("email");
                //string locale = jsonUserInfo.Value<string>("locale");
                //string facebook_userID = jsonUserInfo.Value<string>("id");
                string id = jsonUserInfo.Value<string>("id");

                // Get the information about the user from the external login provider
                var user = new ApplicationUser()
                {
                    UserName = model.UserName,
                    PasswordHash = "cungphim.com@9999",                   
                };
                user.UserExtentLogin = new UserExtentLogin { Email = email, KeyLogin = user.Id, CreatedDate = DateTime.Now, FullName = name, Verify = Verify.NO, UserNameCopy = model.UserName, IdFacebook = id, AvatarSyn = true };


                // check email
                if (!string.IsNullOrEmpty(email))
                {
                    var checkEmail = await db.UserLogins.FirstOrDefaultAsync(ul => ul.Email == email);
                    if (checkEmail != null)
                    {
                        OutputErrors("Email đã tồn tại trong hệ thống");
                    }
                }               
                else
                {
                    var result = await UserManager.CreateAsync(user, user.PasswordHash);
                    if (result.Succeeded)
                    {
                        await SignInAsync(user, isPersistent: false);
                        //send mail
                        // download avatar      
                        await AppHelper.AvatarSyn(id);
                        AppHelper.SetCookieOfFace();
                        return RedirectToAction("Index", "MyProfile");
                    }
                    else
                    {
                        AddErrors(result);
                    }
                }
            }            
            ViewBag.ReturnUrl = returnUrl;
            return View(model);
        }

        //
        // POST: /Account/LogOff
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff(string returnUrl)
        {
            AuthenticationManager.SignOut();
            AppHelper.ReleaseCookieOfFace();
            if (returnUrl.Equals("/myprofile"))
            {
                return RedirectToAction("Index", "Home"); 
            }
            else
            {
                return RedirectToLocal(returnUrl); // Returun URL
            }
            
        }

        //
        // GET: /Account/ExternalLoginFailure
        [AllowAnonymous]
        public ActionResult ExternalLoginFailure()
        {
            return View();
        }

        [ChildActionOnly]
        public ActionResult RemoveAccountList()
        {
            var linkedAccounts = UserManager.GetLogins(User.Identity.GetUserId());
            ViewBag.ShowRemoveButton = HasPassword() || linkedAccounts.Count > 1;
            return (ActionResult)PartialView("_RemoveAccountPartial", linkedAccounts);
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

        #region Helpers
        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private async Task SignInAsync(ApplicationUser user, bool isPersistent)
        {
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ExternalCookie);
            var identity = await UserManager.CreateIdentityAsync(user, DefaultAuthenticationTypes.ApplicationCookie);
            AuthenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = isPersistent }, identity);
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }
        private void OutputErrors(string error)
        {
            ModelState.AddModelError("", error);
        }

        private bool HasPassword()
        {
            var user = UserManager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                return user.PasswordHash != null;
            }
            return false;
        }

        public enum ManageMessageId
        {
            ChangePasswordSuccess,
            SetPasswordSuccess,
            RemoveLoginSuccess,
            Error,
            UpdateSucess,
            NotExist
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        private class ChallengeResult : HttpUnauthorizedResult
        {
            public ChallengeResult(string provider, string redirectUri) : this(provider, redirectUri, null)
            {
            }

            public ChallengeResult(string provider, string redirectUri, string userId)
            {
                LoginProvider = provider;
                RedirectUri = redirectUri;
                UserId = userId;
            }

            public string LoginProvider { get; set; }
            public string RedirectUri { get; set; }
            public string UserId { get; set; }

            public override void ExecuteResult(ControllerContext context)
            {
                var properties = new AuthenticationProperties() { RedirectUri = RedirectUri };
                if (UserId != null)
                {
                    properties.Dictionary[XsrfKey] = UserId;
                }
                context.HttpContext.GetOwinContext().Authentication.Challenge(properties, LoginProvider);
            }
        }
        #endregion
    }
}
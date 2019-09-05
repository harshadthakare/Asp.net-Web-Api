using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebApiAssetMate.AES256Encryption;
using WebApiAssetMate.Auth;
using WebApiAssetMate.Context;
using WebApiAssetMate.Models;
using WebApiAssetMate.Repository;
using WebApiAssetMate.Repository.Interfaces;

namespace WebApiAssetMate.Controllers
{

    public class AuthorizationController : ApiController
    {
        private DatabaseContext db = new DatabaseContext();

        IUser repository;


        public AuthorizationController()
        {
            repository = new UserRepo();
        }



        // GET: api/Authorization

        [HttpGet]
        [ResponseType(typeof(User))]
        [ActionName("GetUser")]
        [Route("api/Authorization/GetUser")]

        public IQueryable<User> GetUser()
        {
            return db.User;
        }


        // GET: api/Authorization/5
        [JwtAuthentication]
        [HttpGet]
        [ResponseType(typeof(User))]
        [ActionName("GetUser")]
        [Route("api/Authorization/GetUser/{id:int}")]
        public IHttpActionResult GetUser(int id)
        {
            User user = db.User.Find(id);
            if (user == null)
            {
                return NotFound();
            }

            return Ok(user);
        }



        // POST: api/Authorization/SignUp
        [AllowAnonymous]
        [ResponseType(typeof(User))]
        [ActionName("SignUp")]
        [Route("api/Authorization/SignUp")]
        public HttpResponseMessage PostSignUp(User user)
        {
            var message = new HttpResponseMessage(HttpStatusCode.NotAcceptable);


            if (!ModelState.IsValid)
            {
                message.Content = new StringContent("Invalid Model");
                return message;
            }

            db.User.Add(user);
            db.SaveChanges();

            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, user);
            return response;

        }


        // POST: api/Authorization/Login
        [AllowAnonymous]
        [ResponseType(typeof(User))]
        [ActionName("Login")]
        public HttpResponseMessage PostLogin(User user)
        {
            var message = new HttpResponseMessage(HttpStatusCode.NotAcceptable);

            if (!ModelState.IsValid)
            {
                message.Content = new StringContent("Invalid Model");
                return message;
            }

            if (repository.ValidateRegisteredUser(user))
            {
                var mId = repository.GetLoggedUserID(user);
                User mUser = db.User.Find(mId);
                mUser.Token =  JwtAuthManager.GenerateJWTToken(mId + "");
                if (mUser != null)
                {
                    db.Entry(mUser).State = EntityState.Modified;

                    try
                    {
                        db.SaveChanges();
                        HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, mUser);
                        return response;
                    }
                    catch (DbUpdateConcurrencyException)
                    {
                        if (!UserExists(mId))
                        {

                            message.Content = new StringContent("User not exist");
                            return message;
                        }
                        else
                        {
                            throw;
                        }
                    }

                }
                else
                {
                    message.Content = new StringContent("User not exist");
                    return message;
                }
            }
            else
            {
                message.Content = new StringContent("Wrong user name or password");
                return message;
            }
        }

        // PUT: api/AssetMate/UpdateUser
        [HttpPost]
        [ResponseType(typeof(void))]
        [ActionName("UpdateUser")]
        [Route("api/Authorization/UpdateUser/{id:int}")]
        [Authorize]
        public HttpResponseMessage PutUpdateUser(int id, User user)
        {

            var message = new HttpResponseMessage(HttpStatusCode.NotAcceptable);

            var mToken = Request.Headers.Authorization.Scheme;
            if (!repository.isValidToken(mToken))
            {
                message.Content = new StringContent("Invalid user");
                return message;
            }

            if (!ModelState.IsValid)
            {
                message.Content = new StringContent("Invalid Model");
                return message;
            }

            if (id != user.UserId)
            {
                message.Content = new StringContent("Invalid user Id");
                return message;
            }

            db.Entry(user).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, user);
                return response;
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
                {
                    message.Content = new StringContent("User not exist");
                    return message;
                }
                else
                {
                    throw;
                }
            }
        }
        [HttpPost]
        [ResponseType(typeof(User))]
        [ActionName("PostByHeader")]
        public string PostByHeader([FromBody]dynamic jsonData)
        {

            var headers = Request.Headers;
            if (headers.Contains("Authorization"))
            {
                string token = headers.GetValues("Authorization").First();
                if (!repository.isValidToken(token))
                {
                    return "Invalid token";
                }
                else
                {
                    string username = EncryptionLibrary.DecryptText(token);
                    return username;
                }

            }

            return "";




            //// GET: api/ProductDetails
            //[HttpGet]
            //public IEnumerable<Asset> GetProducts()
            //{
            //    try
            //    {
            //        var assets = db.Asset.ToList();
            //        return assets;
            //    }
            //    catch (System.Exception)
            //    {
            //        throw;
            //    }
            //}

        }



        // POST: RegisterUser/Create
        /*     [HttpPost]
             public IHttpActionResult Create(User RegisterUser)
             {*//*
                 try
                 {
                     if (!ModelState.IsValid)
                     {
                         return View("Create", RegisterUser);
                     }

                     // Validating Username 
                     if (repository.ValidateUsername(RegisterUser))
                     {
                         ModelState.AddModelError("", "User is Already Registered");
                         return View("Create", RegisterUser);
                     }
                     RegisterUser.CreateOn = DateTime.Now;

                     // Encrypting Password with AES 256 Algorithm
                     RegisterUser.Password = EncryptionLibrary.EncryptText(RegisterUser.Password);

                     // Saving User Details in Database
                     repository.Add(RegisterUser);
                     TempData["UserMessage"] = "User Registered Successfully";
                     ModelState.Clear();
                     return View("Create", new RegisterUser());
                 }
                 catch
                 {
                     return View();
                 }*//*
             }
          */




        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UserExists(int id)
        {
            return db.User.Count(e => e.UserId == id) > 0;
        }
    }
}

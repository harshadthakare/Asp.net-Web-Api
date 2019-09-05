using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApiAssetMate.Auth;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Controllers
{
    public class RequestTokenController : ApiController
    {
         DatabaseContext db = new DatabaseContext();
        public HttpResponseMessage Get(string username, string password)
        {
            if (CheckUser(username, password))
            {
                return Request.CreateResponse(HttpStatusCode.OK,
             JwtAuthManager.GenerateJWTToken(username));
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.Unauthorized,
             "Invalid Request");
            }
        }
        public bool CheckUser(string username, string password)
        {
            // for demo purpose, I am simply checking username and password with predefined strings. you can have your own logic as per requirement.
            if (username == "codeadda" && password == "abc123")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
       
        
            
        //    [Route("UserLogin")]
        //    [HttpPost]
        //    public ResponseVM UserLogin(LoginVM objVM)
        //    {

        //        var objlst = wmsEN.Usp_Login(objVM.UserName, UtilityVM.Encryptdata(objVM.Passward), "").ToList<Usp_Login_Result>().FirstOrDefault();
        //        if (objlst.Status == -1)
        //            return new ResponseVM { Status = "Invalid", Message = "Invalid User." };
        //        //if (objlst.Status == 2)
        //        //    return new ResponseVM { Status = "Invalid", Message = "Already Logged In." };
        //        if (objlst.Status == 0)
        //            return new ResponseVM { Status = "Inactive", Message = "User Inactive." };
        //        else
        //            return new ResponseVM { Status = "Success", Message = TokenManager.GenerateToken(objVM.UserName) };
        //    }
        //    [Route("Validate")]
        //    [HttpGet]
        //    public ResponseVM Validate(string token, string username)
        //    {
        //        int UserId = new UserRepository().GetUser(username);
        //        if (UserId == 0) return new ResponseVM { Status = "Invalid", Message = "Invalid User." };
        //        string tokenUsername = TokenManager.ValidateToken(token);
        //        if (username.Equals(tokenUsername))
        //        {
        //            return new ResponseVM
        //            {
        //                Status = "Success",
        //                Message = "OK",
        //            };
        //        }
        //        return new ResponseVM { Status = "Invalid", Message = "Invalid Token." };
        //    }
        //}
    }
}


using System;
using System.Linq;
using WebApiAssetMate.Context;
using WebApiAssetMate.Models;
using WebApiAssetMate.Repository.Interfaces;

namespace WebApiAssetMate.Repository
{
    public class UserRepo : IUser
    {
        DatabaseContext _context;
        public UserRepo()
        {
            _context = new DatabaseContext();
        }



        public void Add(User mUser)
        {
            _context.User.Add(mUser);
            _context.SaveChanges();
        }

        public int GetAllUser()
        {
            var usercount = (from User in _context.User
                             select User.UserId).Count();
            return usercount;
        }

        public int GetLoggedUserID(User registeruser)
        {
            var usercount = (from User in _context.User
                             where User.EmailId == registeruser.EmailId && User.Password == registeruser.Password
                             select User.UserId).FirstOrDefault();

            return usercount;
        }

        public bool ValidateRegisteredUser(User registeruser)
        {
            var usercount = (from User in _context.User
                             where User.EmailId == registeruser.EmailId && User.Password == registeruser.Password
                             select User).Count();
            if (usercount > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        public bool isValidToken(string mToken)
        {
            var usercount = (from User in _context.User
                             where User.Token == mToken
                             select User).Count();
            if (usercount > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        internal static void SaveChanges()
        {
            throw new NotImplementedException();
        }

        public bool ValidateUsername(User registeruser)
        {
            var usercount = (from User in _context.User
                             where User.EmailId == registeruser.EmailId
                             select User).Count();
            if (usercount > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
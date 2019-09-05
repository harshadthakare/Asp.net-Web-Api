using System;
using WebApiAssetMate.Models;

namespace WebApiAssetMate.Repository.Interfaces
{
    interface IUser
    {
        //   void Add(User registeruser);

        int GetAllUser();
        bool ValidateRegisteredUser(User registeruser);
        bool ValidateUsername(User registeruser);
        int GetLoggedUserID(User registeruser);

        bool isValidToken(String mToken);
    }
}

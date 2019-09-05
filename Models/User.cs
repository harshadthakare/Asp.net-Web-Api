using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebApiAssetMate.Context;

namespace WebApiAssetMate.Models
{
    [Table("User")]
    public partial class User
    {
        DatabaseContext mDBContext;
        public User()
        {
            mDBContext = new DatabaseContext();
        }

        [Key]
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ProfileImage { get; set; }
        public int DepartmentIdFK { get; set; }
        public string MobileNumber { get; set; }
        public string Roles { get; set; }
        public string EmailId { get; set; }
        public string Password { get; set; }
        public DateTime CreatedOn { get; }
        public DateTime UpdatedOn { get; }
        public int IsDeleted { get; set; }

        public string Token { get; set; }

    }
}
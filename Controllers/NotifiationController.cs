using System.Linq;
using System.Web.Http;
using System.Web.Http.Description;
using WebApiAssetMate.Auth;
using WebApiAssetMate.Context;
using WebApiAssetMate.Models;

namespace WebApiAssetMate.Controllers
{
    public class NotifiationController : ApiController
    {
        // GET: api/Notification
        [JwtAuthentication]
        [HttpGet]
        [ResponseType(typeof(Notification))]
        [ActionName("getAsset")]
        [Route("api/Notification/getNotification")]
        public IHttpActionResult getNotification()
        {
            DatabaseContext db = new DatabaseContext();

            var query = (from s in db.Notification

                         select new
                         {
                             s.NotificationId,
                             s.Title,
                             s.Image,
                             s.Message
                         });

            if (query == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(query);
            }


        }

    }
}

using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;
using System.Web.Http.Description;
using WebApiAssetMate.Auth;
using WebApiAssetMate.Context;
using WebApiAssetMate.Models;

namespace WebApiAssetMate.Controllers
{
    public class AnswerController : ApiController
    {
        [JwtAuthentication]
        [ResponseType(typeof(User))]
        [ActionName("AddAnswer")]
        public HttpResponseMessage addAnswer_post([FromBody] JObject data )
            {
                try
                {
                    using (DatabaseContext dbContext = new DatabaseContext())
                    {


                    var userId = ClaimsPrincipal.Current.Identity.Name;

                           List<Answer> answers = data["answers"].ToObject<List<Answer>>();
                            int assetIdFK = data["assetIdFK"].ToObject<int>();
                            int assetmentTypeIdFK = data["assetmentTypeIdFK"].ToObject<int>();

                            Assessment assessment = new Assessment();
                            assessment.AssetIdFK = assetIdFK;
                            assessment.AssessmentTypeIdFK = assetmentTypeIdFK;
                            assessment.DoneBy = int.Parse(userId);
                    assessment.OnDate = DateTime.Now;

                    dbContext.Assessment.Add(assessment);
                            dbContext.SaveChanges();

                    /*  foreach (Answer element in answers)
                         {
                             dbContext.Answer.Add(element);
                             dbContext.SaveChanges();
                         }*/



                    var message = Request.CreateResponse(HttpStatusCode.Created,assessment);

                           return message;
                }
            }
                catch (Exception ex)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
                }
            }
        }
    }



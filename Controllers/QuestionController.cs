using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;
using System.Web.Http.Description;
using WebApiAssetMate.Auth;
using WebApiAssetMate.Context;
using WebApiAssetMate.Models;
using WebApiAssetMate.Repository;
using WebApiAssetMate.Repository.Interfaces;

namespace WebApiAssetMate.Controllers
{
    public class QuestionController : ApiController
    {
        IQuestion repository;


        public QuestionController()
        {
            repository = new QuestionRepo();
        }
        [HttpPost]
        [JwtAuthentication]
        [ResponseType(typeof(Questionoption))]
        [ActionName("getQuestions")]
        [Route("api/Question/getQuestions")]
        public HttpResponseMessage viewQuestionPost([FromBody] JObject data)
        {
            int categoryId = data["categoryId"].ToObject<int>();
            int assetmentTypeIdFK = data["assetmentTypeIdFK"].ToObject<int>();

          


            List<Object> questions = repository.getQuestionDetails(categoryId,assetmentTypeIdFK);
            Object prop = questions[0];

            //  var questionId= prop.GetType().GetProperty("questionId").GetValue(prop, null);

            List<Object> questionOptions=null;
            //List<Object> questions1 = null;

            foreach (Object element in questions)
            {
              
                var questionId = element.GetType().GetProperties()[0].GetValue(element, null).ToString();
                
                questionOptions = repository.getQuestionoptions(4);
                questionOptions.Add(element);
                dynamic obj = new ExpandoObject();

               
            }
            
        
            var message = Request.CreateResponse(HttpStatusCode.Created, questionOptions);

            return message;

        }

    }

}

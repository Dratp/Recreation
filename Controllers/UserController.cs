using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Recreation.Models;
using Recreation.Services;

namespace Recreation.Controllers
{
    [Route("api/User")]
    [ApiController]
    public class UserController : ControllerBase
    {
        IDAL db;
        public UserController(IDAL _db)
        {
            db = _db;
        }

        [HttpPost]
        [Route("new")]
        public User CreateUser(User newUser)
        {
            //HTTPPost does not reach this point!
            User user = CreateUser(newUser);
            user.Password = "";
            return user;
        }

        [HttpGet]
        [Route("login/{userName}/{password}")]
        public object Login(string userName, string password)
        {
            return db.Login(userName, password);
        }

        [HttpGet]
        [Route("like/{userID}/{RIDBActivity}")]
        public List<Likes> DoOrDoNot(long userID, long RIDBActivity)
        {
            return db.GetLikes(userID, RIDBActivity);
        }

        [HttpGet]
        [Route("like/{userID}")]
        public List<SavedLikeInfo> GetUserLikes(long userID)
        {

            return db.GetLikes(userID);
            //Returns likes
        }
    }
}

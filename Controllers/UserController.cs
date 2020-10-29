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
        [Route("{userName}/{password}/{firstName}/{lastName}/{zip}/{city}/{state}")]
        public User CreateUser(string userName, string password, string firstName, string lastName, string zip, string city, string state)
        {
            User user = db.CreateUser(userName, password, firstName, lastName, zip, city, state);
            user.Password = "";
            return user;

        }

        [HttpGet]
        [Route("login")]
        public object Login(string userName, string password)
        {
            return db.Login(userName, password);
        }


    }
}

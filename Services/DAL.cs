using Dapper;
using Dapper.Contrib.Extensions;
using Microsoft.Extensions.Configuration;
using Recreation.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Recreation.Services
{
    public class DAL : IDAL
    {
        IDbConnection db;

        public DAL(IConfiguration config)
        {
            db = new SqlConnection(config.GetConnectionString("Connection"));
        }

        public User CreateUser(string userName, string password, string firstName, string lastName, string zip, string city, string state)
        {
            User user = new User()
            {
                UserName = userName,
                Password = password,
                FirstName = firstName,
                LastName = lastName,
                ZIP = zip,
                City = city,
                State = state
            };

            long id = db.Insert(user);

            user.UserId = id;

            return user;
        }


        public List<ActivityData> GetActivityDataList()
        {
            List<ActivityData> data = db.Query<ActivityData>("SELECT RIDB.FacilityID, RIDB.FacilityName, RIDBAct.Activity, RIDB.FacilityLatitude, RIDB.FacilityLongitude FROM RIDB JOIN RIDBAct on RIDB.FacilityID=RIDBAct.FacilityID").AsList<ActivityData>();
            return data;
        }


        public List<Likes> GetLikes(long userID)
        {
            List<Likes> data = db.Query<Likes>($"SELECT * FROM [Likes] WHERE UserID = {userID}").AsList<Likes>();
            return data;
        }

        public User GetUser(string userName)
        {
            User user = db.QuerySingle<User>($"SELECT * FROM [Users] WHERE UserName = {userName}");

            return user;
        }

        public object Login(string userName, string password)
        {
            User user = GetUser(userName);

            //If Username or password are blank or null, return error
            if (user.UserName == "" || user.UserName == null)
            {
                return new { Login = false, reason = "User does not exist." };
            }
            else if (user.Password != password)
            {
                return new { Login = false, reason = "Password did not match." };
            }
            else
            {
                return new { Login = true };
            }

        }

    }
}

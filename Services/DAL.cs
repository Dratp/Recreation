using Dapper;
using Dapper.Contrib.Extensions;
using Microsoft.Extensions.Configuration;
using Recreation.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
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


        public User CreateUser(User newUser)
        {
            long id = db.Insert(newUser);
            newUser.UserID = id;
            return newUser;
        }


        public List<ActivityData> GetActivityDataList()
        {
            List<ActivityData> data = db.Query<ActivityData>("SELECT RIDBAct.id, RIDB.FacilityID, RIDB.FacilityName, RIDBAct.Activity, RIDB.FacilityLatitude, RIDB.FacilityLongitude, RIDB.FacilityDescription FROM RIDB JOIN RIDBAct on RIDB.FacilityID=RIDBAct.FacilityID").AsList<ActivityData>();
            return data;
        }

        public List<SavedLikeInfo> GetLikes(long userID)
        {
            List<SavedLikeInfo> data = db.Query<SavedLikeInfo>($"SELECT Likes.id, Likes.UserID, Likes.RIDBActivity, RIDBAct.FacilityID, RIDB.FacilityName, RIDB.FacilityLatitude, RIDB.FacilityLongitude, RIDB.FacilityTypeDescription From RIDB Join RIDBAct On RIDB.FacilityID = RIDBAct.FacilityID Join Likes On Likes.RIDBActivity = RIDBAct.id Where UserID = { userID}").AsList<SavedLikeInfo>();

            //This pulls data 
            return data;
        }


        public List<Likes> GetLikes(long userID, long activityID)
        {
            List<Likes> data = db.Query<Likes>($"SELECT * FROM [Likes] WHERE UserID = {userID}").AsList<Likes>();

            foreach (Likes like in data)
            {
                if (activityID == like.RIDBActivity)
                {
                    DeleteLike(like);
                    data.Remove(like);
                    return data;
                }
            }

            long id = AddLike(userID, activityID);
            data.Add(new Likes()
            {
                ID = id,
                UserID = userID,
                RIDBActivity = activityID
            }
            );
            return data;
        }

        public long AddLike(long userID, long activityID)
        {
            Likes like = new Likes()
            {
                UserID = userID,
                RIDBActivity = activityID
            };

            long id = db.Insert(like);

            return id;
        }


        public void DeleteLike(Likes like)
        {
            db.Delete(like);
        }


        public User GetUser(string userName)
        {
            try
            {
                User user = db.QuerySingle<User>($"SELECT * FROM [Users] WHERE UserName = '{userName}'");
                return user;
            }
            catch
            {
                User user = new User();
                return user;
            }
        }


        public object Login(string userName, string password)
        {
            User user = GetUser(userName);

            //If Username or password are blank or null, return error
            if (user.UserName == "" || user.UserName == null)
            {
                return new { response = false, reason = "User does not exist." };
            }
            else if (user.Password != password)
            {
                return new { response = false, reason = "Password did not match." };
            }
            else
            {
                return new { response = true, userID = user.UserID ,userName = user.UserName, reason = " " };

            }
        }


        public List<string> GetUniqueActivityList()
        {
            List<string> data = db.Query<string>($"SELECT distinct Activity FROM RIDBAct").AsList<string>();
            return data;
        }
    }
}
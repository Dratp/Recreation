using Dapper;
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
            db = new SqlConnection(config.GetConnectionString("kathryn"));
        }

        public List<ActivityData> GetActivityDataList()
        {
            List<ActivityData> data = db.Query<ActivityData>("SELECT RIDB.FacilityID, RIDB.FacilityName, RIDBAct.Activity, RIDB.FacilityLatitude, RIDB.FacilityLongitude FROM RIDB JOIN RIDBAct on RIDB.FacilityID=RIDBAct.FacilityID").AsList<ActivityData>();
            return data;
        }
    }
}

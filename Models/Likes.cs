using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Recreation.Models
{
    [Table("Likes")]
    public class Likes
    {
        [Key]
        public long LikeID { get; set; }
        public long UserID { get; set; }
        public long RIDBActivity { get; set; }

    }
    public class SavedLikeInfo
    {
        
        public long LikeID { get; set; }
        public long UserID { get; set; }
        public long RIDBActivity { get; set; }
        public long FacilityID { get; set; }
        public string FacilityName { get; set; }
        public string FacilityLatitude { get; set; }
        public string FacilityLongitude { get; set; }
        public string FacilityDescription { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Recreation.Models
{
    public class ActivityData
    {
        public long ID { get; set; }
        public string FacilityID { get; set; }
        public string FacilityName { get; set; }
        public string Activity { get; set; }
        public string FacilityLongitude { get; set; }
        public string FacilityLatitude { get; set; }
        public string FacilityDescription { get; set; }
    }
}

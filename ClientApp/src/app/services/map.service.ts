import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

import { ActivityDataService } from './activity-data.service';


@Injectable()
export class MapService {
  activities: any;
  constructor(private activitydataservice: ActivityDataService) {

  }



  getActivityList() {
    this.activitydataservice.getActivityDataList().subscribe(
      activities => (this.activities = activities));
  }

  getActivityByName(activityname) {
    //return list of activites from service call.
    this.activitydataservice.getActivityByName(activityname).subscribe(
      activities => (this.activities = activities));
  }

  whatIsDisplayed(ChosenActivity: string) {
    if (this.activitydataservice.ChosenActivity = "") {
      this.getActivityList();
    }
    if (this.activitydataservice.ChosenActivity != "") {
      this.activitydataservice.getActivityByName(this.activitydataservice.ChosenActivity)
    }
  }
}

import { Component } from '@angular/core';
import { ActivityData } from '../interfaces/activity';
import { ActivityDataService } from '../services/activity-data.service';
import { ActivityComponent } from '../activity/activity.component';

@Component({
    selector: 'app-mapdisplay',
    templateUrl: './mapdisplay.component.html',
    styleUrls: ['./mapdisplay.component.css']
})
/** mapdisplay component*/
export class MapdisplayComponent {
  activities: ActivityData[];
  activity: ActivityData;
  title = 'My first AGM project';
  lat :number;
  lng : number;

  constructor(private activitydataservice: ActivityDataService) {

  }

  ngOnInit(): void {
    this.getActivityByLocation('Hiking');
  }

  getActivityList() {
    this.activitydataservice.getActivityDataList().subscribe(
      activities => (this.activities = activities));
  }

  getActivityByLocation(activityname) {
    //return list of activites from service call.
    this.activitydataservice.getActivityByLocation(activityname).subscribe(
      activities => (this.activities = activities));
  }
}

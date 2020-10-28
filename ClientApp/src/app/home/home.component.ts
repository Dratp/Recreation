import { Component } from '@angular/core';

import { ActivityData, ActivityDatas } from '../interfaces/activitydata';
import { ActivityDataService } from '../services/activity-data.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
})
export class HomeComponent {
  activities: ActivityData[];
  activity : ActivityData;

constructor (private activitydataservice: ActivityDataService ) {}

ngOnInit(): void {
 this.getActivityList();
}

getActivityList() {
  this.activitydataservice.getActivityDataList().subscribe(
    activities => (this.activities = activities));
}


}
import { Component } from '@angular/core';
import { ActivityData, ActivityDatas } from '../interfaces/activity';
import { ActivityDataService } from '../services/activity-data.service';

@Component({
    selector: 'app-activity',
    templateUrl: './activity.component.html',
    styleUrls: ['./activity.component.css']
})

export class ActivityComponent {
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
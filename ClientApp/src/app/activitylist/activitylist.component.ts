import { Component, OnInit } from '@angular/core';
import { ActivityData } from '../interfaces/activity';
import { ActivityDataService } from '../services/activity-data.service';

@Component({
  selector: 'app-activitylist',
  templateUrl: './activitylist.component.html',
  styleUrls: ['./activitylist.component.css']
})
export class ActivitylistComponent implements OnInit {

  activities: ActivityData[];
  uniqueActs: string[];
  chosenActivity: string;

  constructor(private activitydataservice: ActivityDataService) {
    this.uniqueActs = [];
    //this.activities = activitydataservice.getActivityDataList();
  }

  ngOnInit(): void {
    this.getActivityList();
  }

  getActivityList() {
    this.activitydataservice.getUniqueActivities().subscribe(
      results => (this.uniqueActs = results));
  }

  chooseActivity(activity: string): void {
    this.chosenActivity = activity;
  }


}

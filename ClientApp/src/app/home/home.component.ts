import { Component } from '@angular/core';
import { ActivityData } from '../interfaces/activity';
import { ActivityDataService } from '../services/activity-data.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
})
export class HomeComponent {
  activities: ActivityData[];
  uniqueActs: string[];

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
}

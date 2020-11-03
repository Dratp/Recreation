import { Component } from '@angular/core';
import { ActivityDataService } from '../services/activity-data.service';
import { ActivityData } from '../interfaces/activity';

@Component({
    selector: 'app-facilitydescription',
    templateUrl: './facilitydescription.component.html',
    styleUrls: ['./facilitydescription.component.css']
})
/** facilitydescription component*/
export class FacilitydescriptionComponent {
  facilityDescriptions: ActivityData[];
  facilities: string[];
  
  constructor(private activitydataservice: ActivityDataService) {
    this.facilities = [];
  }

  

  ngOninit(): void{
    this.getActivityList();
  }

  getActivityList() {
    this.activitydataservice.getUniqueActivities().subscribe(
      results => (this.facilities = results));
  }


}

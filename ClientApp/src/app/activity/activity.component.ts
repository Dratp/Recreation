import { Component } from '@angular/core';
import { ActivityData, ActivityDatas } from '../interfaces/activity';
import { ActivityDataService } from '../services/activity-data.service';
import { SignedInUserService } from '../services/signed-in-user.service';
import { UserInfo, UserFavorite } from '../interfaces/user';
import { FavoriteService } from '../services/favorite.service';

@Component({
  selector: 'app-activity',
  templateUrl: './activity.component.html',
  styleUrls: ['./activity.component.css']
})

export class ActivityComponent {
  activities: ActivityData[];
  activity: ActivityData;
  userFavorite: UserFavorite;
  activityname: string;
  

  constructor(private activitydataservice: ActivityDataService, private userdataservice: SignedInUserService, private favoriteservice: FavoriteService) { }

  ngOnInit(): void {
    this.getActivityList();
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


  addLikedActivity(activity: ActivityData) {
    let favorite: UserFavorite = {
      id: 0,
      UserID: this.userdataservice.userId,
      RIDBActivity: activity.id
    }

    this.favoriteservice.FavoriteManager(favorite);
    
  }
}


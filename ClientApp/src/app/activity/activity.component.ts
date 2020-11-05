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
  activity: ActivityData;
  userFavorite: UserFavorite;
  activityname: string;
  favorites: UserFavorite[]


  constructor(
    private activitydataservice: ActivityDataService,
    private userdataservice: SignedInUserService,
    private favoriteservice: FavoriteService
  ) { }

  ngOnInit(): void {
    this.favoriteservice.GetUserFavorites(this.userdataservice.userId);
    this.favorites = this.favoriteservice.favorites
    this.GetFavorites();
  }

  //getActivityList() {
  //  this.activitydataservice.getActivityDataList().subscribe(
  //    activities => (this.activitydataservice.activities = activities));
  //}

  //getActivityByName(activityname) {
  //  //return list of activites from service call.
  //  this.activitydataservice.getActivityByName(activityname).subscribe(
  //    activities => (this.activitydataservice.activities = activities));
  //}

  GetFavorites() {
    console.log("Get Favorites method setting to False")
    for (let act of this.activitydataservice.activities) {
      act.favorite = false;
    }

    if (this.userdataservice.userId > 0) {
      console.log(`Someone is logged in!! thier userID is ${this.userdataservice.userId}`);
      console.log(this.favorites);
      for (const fav of this.favorites) {
        console.log(`${fav.RIDBActivity}`)
        for (const act of this.activitydataservice.activities) {
          if (fav.RIDBActivity == act.id) {
            act.favorite = true;
            console.log(`Setting ${act.id} to ${act.favorite}`);
            break;
          }
        }
      }
    }
    
  }

  addLikedActivity(activity: ActivityData) {
    let favorite: UserFavorite = {
      id: 0,
      UserID: this.userdataservice.userId,
      RIDBActivity: activity.id
    }

    this.favoriteservice.FavoriteManager(favorite);
  }

  FavoriteCheck(act: ActivityData) {
    
    if (act.favorite) {
      return true;
    }
    return false;
  }

}

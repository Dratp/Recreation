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
  searchField: string;
  favorites: UserFavorite[]
  filteredList: ActivityData[];

  constructor(
    private activitydataservice: ActivityDataService,
    private userdataservice: SignedInUserService,
    private favoriteservice: FavoriteService
  ) { }

  ngOnInit(): void {
    console.log("Activity component ngOnInt");
    this.favoriteservice.GetUserFavorites(this.userdataservice.userId);
    this.favorites = this.favoriteservice.favorites;
    this.filteredList = [];
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
   


  addLikedActivity(activity: ActivityData) {
    let favorite: UserFavorite = {
      id: 0,
      UserID: this.userdataservice.userId,
      RIDBActivity: activity.id
    }
    activity.favorite = !activity.favorite;
    this.favoriteservice.FavoriteManager(favorite);
  }

  FavoriteCheck(act: ActivityData) {
    if (act.favorite) {
      return true;
    }
    return false;
  }

  Search() {
    this.filteredList = this.activitydataservice.activities.filter(res => {
      return res.facilityName.toLocaleLowerCase().match(this.searchField.toLocaleLowerCase());
    });
  }


}

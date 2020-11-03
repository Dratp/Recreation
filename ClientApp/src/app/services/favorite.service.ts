import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { UserInfo, UserFavorite } from '../interfaces/user';
import { Observable } from 'rxjs';
import { ActivityComponent } from '../activity/activity.component';

@Injectable({
  providedIn: 'root'
})
export class FavoriteService {
  currentUser: UserInfo;
  activity: ActivityComponent;
  favorite: UserFavorite;


  constructor(private http: HttpClient) { }

    apiUrl = '/api/user/like';

  AddFavorite(favorite) {
    return this.http.get<UserFavorite>(this.apiUrl + `/${favorite.UserID}/${this.favorite.activityid})`)
  }
}

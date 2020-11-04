import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { UserInfo, UserFavorite } from '../interfaces/user';
import { Observable } from 'rxjs';
import { ActivityComponent } from '../activity/activity.component';
import { SignedInUserService } from './signed-in-user.service';

@Injectable({
  providedIn: 'root'
})
export class FavoriteService {
  currentUser: UserInfo;
  activity: ActivityComponent;
  favorite: UserFavorite;
  favorites: UserFavorite[];
  userInfo: UserInfo;
  


  constructor(private http: HttpClient, private signinuserservice: SignedInUserService) {
    this.favorites = [];
  }

    apiUrl = '/api/user/like';

  // This is the API call
  FavoriteAPICall(favorite): Observable<UserFavorite[]> {
    return this.http.get<UserFavorite[]>(this.apiUrl + `/${favorite.UserID}/${favorite.RIDBActivity}`)
  }

  // This subscribes to the API Call
  FavoriteManager(favorite)
  {
    this.FavoriteAPICall(favorite).subscribe(results => this.FavListManager(results));
  }

  // This actually does something
  FavListManager(favorites: UserFavorite[]) {
    this.ClearFavs();
    this.PopulateFavs(favorites);
  }

  ClearFavs() {
    this.favorites = [];
  }

  PopulateFavs(favs: UserFavorite[]) {
    for (let i = 0; i < favs.length; i++) {
      this.favorites.push(favs[i]);
    }
  }

  GetFavoriteList(userID: number){
    return this.http.get(this.apiUrl + `/${userID}`)

  }

}

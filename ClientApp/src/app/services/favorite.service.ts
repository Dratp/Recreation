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
  //api call
  GetFavoriteList(userID: number): Observable<UserFavorite[]>{

    console.log(userID, 'at GetFavoriteList in favorite service')

    return this.http.get<UserFavorite[]>(this.apiUrl + `/${userID}`);
    
  }

  GetUserFavorites(userID: number) {
    this.GetFavoriteList(userID).subscribe(results => this.makeFavoriteList(results));
  }

  makeFavoriteList(favs: UserFavorite[]) {
    for (let i = 0; i < favs.length; i++) {
      this.favorites.push(favs[i]);
    }
  }

}

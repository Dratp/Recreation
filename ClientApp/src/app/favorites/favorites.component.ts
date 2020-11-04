import { Component, OnInit } from '@angular/core';
import { SignedInUserService } from '../services/signed-in-user.service';
import { UserInfo, UserFavorite } from '../interfaces/user';
import { Router } from '@angular/router';
import { FavoriteService } from '../services/favorite.service';

@Component({
  selector: 'app-favorites',
  templateUrl: './favorites.component.html',
  styleUrls: ['./favorites.component.css']
})
export class FavoritesComponent implements OnInit {
  user: UserInfo;
  favorites : UserFavorite[]
  
 

  constructor(private UserService: SignedInUserService, private route: Router, private favoritesService: FavoriteService) { }

  ngOnInit() {
    this.favoritesService.GetUserFavorites(this.UserService.userId);


    console.log(this.UserService.userId)
    console.log(this.favoritesService.favorites)
    this.favorites = this.favoriteService.favorites
  }

  callLogout() {
    console.log("button pressed!");
    this.UserService.logout();
  }


  //getFavoriteList(userId: number) {
  //  this.favoritesService.GetFavoriteList
  //    (userId).subscribe(
  //      results => (this.favorites = results));

   // console.log(this.UserService.userId) // this prints}


  }


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
  favorites: UserFavorite[];
  
 

  constructor(private UserService: SignedInUserService, private route: Router, private favoritesService: FavoriteService) { }

  ngOnInit() {
    this.favoritesService.GetFavoriteList(this.user.userID).subscribe(
      (data: UserFavorite[]) => this.favorites = data)

  }

  callLogout() {
    console.log("button pressed!");
    this.UserService.logout();
  }



  }


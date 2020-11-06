import { Component, OnInit } from '@angular/core';
import { SignedInUserService } from '../services/signed-in-user.service';
import { UserInfo, UserFavorite, SavedLikeInfo } from '../interfaces/user';
import { Router } from '@angular/router';
import { FavoriteService } from '../services/favorite.service';

@Component({
  selector: 'app-favorites',
  templateUrl: './favorites.component.html',
  styleUrls: ['./favorites.component.css']
})
export class FavoritesComponent implements OnInit {
  user: UserInfo;

  //favorites : SavedLikeInfo[]  nothing should call favorites
  likedFavorites: SavedLikeInfo[];
 


  constructor(private UserService: SignedInUserService, private route: Router, private favoritesService: FavoriteService) { }

  ngOnInit() {
    this.favoritesService.likedFavorites = [];
    this.favoritesService.GetUserFavorites(this.UserService.userId);
    this.likedFavorites = this.favoritesService.likedFavorites;

    console.log(this.favoritesService.likedFavorites);

  }

  DeleteFav(favoriteID: number) {
    console.log("Delete button pressed!!!!");
    console.log(`Like ID is: ${favoriteID}`);
    this.favoritesService.DeleteFavorite(favoriteID);


  }



  }


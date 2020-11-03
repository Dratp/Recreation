import { Component, OnInit } from '@angular/core';
import { SignedInUserService } from '../services/signed-in-user.service';
import { UserInfo } from '../interfaces/user';
import { Router } from '@angular/router';
import { FavoriteService } from '../services/favorite.service';

@Component({
  selector: 'app-favorites',
  templateUrl: './favorites.component.html',
  styleUrls: ['./favorites.component.css']
})
export class FavoritesComponent implements OnInit {
  user: UserInfo;


  constructor(private UserService: SignedInUserService, private route: Router, private favorites: FavoriteService) { }

  ngOnInit() {
  }

  callLogout() {
    console.log("button pressed!");
    this.UserService.logout();
  }



  }


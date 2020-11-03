import { Component, OnInit } from '@angular/core';
import { SignedInUserService } from '../services/signed-in-user.service';
import { UserInfo } from '../interfaces/user';
import { Router } from '@angular/router';

@Component({
  selector: 'app-favorites',
  templateUrl: './favorites.component.html',
  styleUrls: ['./favorites.component.css']
})
export class FavoritesComponent implements OnInit {
  user: UserInfo;

  constructor(private UserService: SignedInUserService, private route: Router) { }

  ngOnInit() {
  }

  logout() {
    this.user = {};
    this.route.navigate([""]);
    }
  }


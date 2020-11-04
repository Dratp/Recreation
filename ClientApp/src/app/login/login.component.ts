import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { SignedInUserService } from '../services/signed-in-user.service';
import { UserInfo } from '../interfaces/user';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  user: UserInfo;

  constructor(private UserService: SignedInUserService, private route: Router) {
    this.user = {};
  }

  ngOnInit() {
  }

  login(username: string, password: string) {
    //console.log("Button pressed");
    if (username != "" && password != "") {
      this.UserService.signIn(username, password);
    }
  }


  CreateUser(firstNameBox: string, lastNameBox: string, cityBox: string, stateBox: string, zipBox: string, newUserNameBox: string, passBox: string) {
    this.UserService.CreateUser(firstNameBox, lastNameBox, cityBox, stateBox, zipBox, newUserNameBox, passBox);
  };

}

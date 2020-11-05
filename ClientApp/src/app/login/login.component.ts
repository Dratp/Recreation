import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { SignedInUserService } from '../services/signed-in-user.service';
import { UserInfo, CreatedUser } from '../interfaces/user';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  user: UserInfo;
  newUser: CreatedUser;

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

  createProfile(firstName: string, lastName: string, zip: string, newUserName: string, pass: string) {
    this.UserService.CreateUser(firstName, lastName, zip, newUserName, pass);
    this.UserService.signIn(newUserName, pass);

  }
  /*createUser(firstName: string, lastName: string, city: string, state: string, zip: string, newUserName: string, pass: string) {
    this.UserService.CreateUser(firstName, lastName, city, state, zip, newUserName, pass);
  };*/

}

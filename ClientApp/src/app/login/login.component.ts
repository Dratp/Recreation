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
    console.log(`username = ${username} password = ${password}`)
    this.UserService.signIn(username, password);
    
    console.log(`response = ${this.user.response} name = ${this.user.userID} ${this.user.userName} reason = ${this.user.reason}`)

    if (this.UserService.userResponse) {
      console.log(`${this.UserService.username} , ${this.UserService.userId}`);
      this.route.navigate([""]);
    }
    
  }


  createUser(firstNameBox: string, lastNameBox: string, cityBox: string, stateBox: string, zipBox: string, newUserNameBox: string, passBox: string) {

  };

}

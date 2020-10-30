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

  constructor(private User: SignedInUserService, private route: Router) { }

  ngOnInit() {
  }

  login(username: string, password: string) {
    this.User.signIn(username, password).subscribe(user => this.user = user);

    console.log(`response = ${this.user.response} name = ${this.user.userID} ${this.user.userName} reason = ${this.user.reason}`)

    if (this.user.response) {
      this.route.navigate([""]);
    }
    
  }

  createUser(firstNameBox: string, lastNameBox: string, cityBox: string, stateBox: string, zipBox: string, newUserNameBox: string, passBox: string) {

  };

}

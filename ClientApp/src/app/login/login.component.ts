import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { SignedInUserService } from '../services/signed-in-user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(private user: SignedInUserService, private route: Router) { }

  ngOnInit() {
  }

  login(username: string, password: string) {
    let result = this.user.validateUser(username, password);
    if (result) {
      this.route.navigate([""]);
    }
  }

  createUser(firstNameBox: string, lastNameBox: string, cityBox: string, stateBox: string, zipBox: string, newUserNameBox: string, passBox: string) {

  };

}

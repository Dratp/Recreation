import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { UserInfo } from '../interfaces/user';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class SignedInUserService {
  currentUser: UserInfo;
  username: string;
  userId: number;
  userResponse: boolean;
  apiUrl = '/api/User/Login';
  

  constructor(private http: HttpClient, private route: Router) {
    this.username = "";
    this.userId = 0;
    this.userResponse = false;
  }

  SetUser(user: UserInfo) {
    this.username = user.userName;
    this.userId = user.userID;
    this.userResponse = user.response;
    if (user.response) {
      this.route.navigate([""]);
    }
  }

  authUser(username, password): Observable<UserInfo> {
    return this.http.get<UserInfo>
      (`${this.apiUrl}/${username}/${password}`);
  }

  signIn(username, password)
  {
    this.authUser(username, password).subscribe(results => this.SetUser(results));
  }

validateUser(user: string, pass: string):
boolean {
    if (user != '') {
      this.signIn(user, pass);
      return true;
    }
    return false;
  }
}

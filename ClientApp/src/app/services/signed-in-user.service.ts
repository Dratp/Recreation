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

  // This is the function that actually does something in this case sets the username and user ID
  SetUser(user: UserInfo) {
    this.username = user.userName;
    this.userId = user.userID;
    this.userResponse = user.response;
    if (user.response) {
      this.route.navigate([""]);
    }
  }

  // This is the API Call
  authUser(username, password): Observable<UserInfo> {
    return this.http.get<UserInfo>
      (`${this.apiUrl}/${username}/${password}`);
  }

  // This is the function that subscribes to the API call and then send the "results" to the function that actually does something!
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

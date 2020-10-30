import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { UserInfo } from '../interfaces/user';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SignedInUserService {
  currentUser: UserInfo;
  username: string;
  userId: number;
  apiUrl = '/api/User/Login';
  

  constructor(private http: HttpClient) {
    this.username = "";
    this.userId = 0;
    this.refresh();
  }

  refresh() {
    this.signIn("username", "password")
  }
  
  signIn(username, password): Observable<UserInfo>
  {
    console.log("Sign in service called");
    return this.http.get<UserInfo>
      (`${this.apiUrl}/${username}/${password}`);

    /*if (this.user.response) {
      return
    } else if (!this.user.response)
    {return
    };*/
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

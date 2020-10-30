import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { UserInfo } from '../interfaces/user';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SignedInUserService {
  user: UserInfo;
  username: string;
  password: string;
  

  constructor(private http: HttpClient) {}

  apiUrl = '/api/User/Login';

  signIn(username, password): Observable<UserInfo>
  {
    return this.http.get<UserInfo>
     (`${this.apiUrl}/{username}/{password}`)
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

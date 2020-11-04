import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { UserInfo, CreatedUser } from '../interfaces/user';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { state } from '@angular/animations';

@Injectable({
  providedIn: 'root'
})
export class SignedInUserService {
  // username and user ID are assigned when a user is logged in and then passed around the components
  username: string;
  userId: number;

  // user response and user reason are for the login function
  // if true / success a user logged in
  // if false a reason will be given why the login failed
  userResponse: boolean;
  userReason: string;
  apiUrl = '/api/User/Login';

  newUser: CreatedUser;

  constructor(private http: HttpClient, private route: Router) {
    this.username = "";
    this.userId = 0;
    this.userResponse = false;
    this.userReason = "";
    this.newUser = { firstName: "", lastName: "", city: "", state: "", zip: "", userName: "", password: ""};
  }

  CreateUser(firstNameBox: string, lastNameBox: string, cityBox: string, stateBox: string, zipBox: string, newUserNameBox: string, passBox: string) {
    this.newUser = { firstName: firstNameBox, lastName: lastNameBox, city: cityBox, state: stateBox, zip: zipBox, userName: newUserNameBox, password: passBox };

    //Not posting! :(
    this.http.post<CreatedUser>(`/api/User/new`, this.newUser);
    console.log(this.newUser);
  }

  // This is the function that actually does something in this case sets the username and user ID
  SetUser(user: UserInfo) {
    //console.log(`Set User Called ${user.userName}`);
    this.username = user.userName;
    this.userId = user.userID;
    this.userResponse = user.response;
    this.userReason = user.reason;
    if (user.response) {
      this.route.navigate([""]);
    }
  }

  // This is the API Call
  authUser(username, password): Observable<UserInfo> {
    //console.log("API call made");
    return this.http.get<UserInfo>
      (`${this.apiUrl}/${username}/${password}`);
  }

  // This is the function that subscribes to the API call and then send the "results" to the function that actually does something!
  signIn(username, password)
  {
    //console.log("Sign In called");
    this.authUser(username, password).subscribe(results => this.SetUser(results));
  }

  logout() {
    console.log("user service logout called");
    this.username = "";
    this.userId = 0;
    this.route.navigate([""]);
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

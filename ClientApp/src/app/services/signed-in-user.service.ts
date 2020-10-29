import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class SignedInUserService {
  username: string;
  password: string;

  constructor(private http: HttpClient) {
    this.username = '';
  }

  apiUrl = '/api/Login';



  signIn(user: string): void {
    this.username = user;
  }

  validateUser(user: string, pass: string): boolean {
    if (user != '') {
      this.signIn(user);
      return true;
    }
    return false;
  }
}

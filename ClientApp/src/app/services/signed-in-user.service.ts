import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SignedInUserService {
  username: string;
  password: string;

  constructor() {
    this.username = '';
  }

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

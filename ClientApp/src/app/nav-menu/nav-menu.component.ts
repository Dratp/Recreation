import { Component } from '@angular/core';
import { SignedInUserService } from '../services/signed-in-user.service';

@Component({
  selector: 'app-nav-menu',
  templateUrl: './nav-menu.component.html',
  styleUrls: ['./nav-menu.component.css']
})
export class NavMenuComponent {
  constructor(private user: SignedInUserService) { }
  isExpanded = false;

  collapse() {
    this.isExpanded = false;
  }

  toggle() {
    this.isExpanded = !this.isExpanded;
  }

  callLogout() {
    //console.log("button pressed!");
    this.user.logout();
  }
}

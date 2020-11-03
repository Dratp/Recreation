import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { HomeComponent } from './home/home.component';
import { AppRoutingModule } from './app-routing.module';
import { ActivityComponent } from './activity/activity.component';
import { LoginComponent } from './login/login.component';
import { FavoritesComponent } from './favorites/favorites.component';
import { AgmCoreModule } from '@agm/core';
import { MapdisplayComponent } from './mapdisplay/mapdisplay.component';
import { ActivitylistComponent } from './activitylist/activitylist.component';

@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    ActivityComponent,
    LoginComponent,
    FavoritesComponent,
    MapdisplayComponent,
    ActivitylistComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,

    AppRoutingModule,
    AgmCoreModule.forRoot({
      apiKey: 'AIzaSyDzw-ESc6jKPGUM5BfZZguBuVN6eEvsxVg'
    })
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

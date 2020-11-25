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
import { FacilitydescriptionComponent } from './facilitydescription/facilitydescription.component';
import { FilterPipe } from './pipes/filter.pipe';
import { SortPipe } from './pipes/sort.pipe';


@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    ActivityComponent,
    LoginComponent,
    FavoritesComponent,
    MapdisplayComponent,
    ActivitylistComponent,
    FacilitydescriptionComponent,
    FilterPipe,
    SortPipe
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    AppRoutingModule,
    AgmCoreModule.forRoot({
      apiKey: 'Place your google API Key here'
     
    })
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import {ActivityComponent} from './activity/activity.component';

const routes: Routes = [
 { path: '', component: HomeComponent, pathMatch: 'full' },
 { path: 'activity', component: ActivityComponent}
]

@NgModule({
  declarations: [],
  imports: [ RouterModule.forRoot(routes)],
  exports : [RouterModule]
  
})
export class AppRoutingModule { }

import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ActivityData } from '../interfaces/activity';
import { SignedInUserService } from './signed-in-user.service';

@Injectable({
  providedIn: 'root'
})
export class ActivityDataService {
  ChosenActivity: string;
  activities: ActivityData[];
  selectedActivity: ActivityData;


  constructor(private http: HttpClient, private user: SignedInUserService) {
    this.ChosenActivity = "";
    this.activities = [];
  }

  apiUrl = '/api/Activity';

  getActivityDataList(): Observable<ActivityData[]> {
    return (this.http.get<ActivityData[]>(this.apiUrl));
  }

  populateList(thing: string) {
    this.getActivityByName(thing).subscribe(results => this.makeList(results));
  }

  getActivityByName(activityname): Observable<ActivityData[]> {
    if (this.user.userId > 0) {
      return (this.http.get<ActivityData[]>(`${this.apiUrl}/${activityname}/${this.user.userId}`));
    }

    console.log("Getting activites");
    return (this.http.get<ActivityData[]>(`${this.apiUrl}/${activityname}`));
  }

  makeList(stuff: ActivityData[]) {
    this.ClearList();
    for (let i = 0; i < stuff.length; i++) {
      this.activities.push(stuff[i]);
    }
  }

  ClearList() {
    this.activities = [];
  }​​​​​​

  //API call
  getUniqueActivities(): Observable<string[]> {
    return (this.http.get<string[]>(`${this.apiUrl}/list`));
  }




}

import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ActivityData } from '../interfaces/activity';

@Injectable({
  providedIn: 'root'
})
export class ActivityDataService {
  ChosenActivity: string;

  constructor(private http: HttpClient) {
    this.ChosenActivity = "";
  }

  apiUrl = '/api/Activity';

  getActivityDataList(): Observable<ActivityData[]>{
    return (this.http.get<ActivityData[]>(this.apiUrl));
  }
  
  getActivityByLocation(activityname): Observable<ActivityData[]>{
    return (this.http.get<ActivityData[]>(`${this.apiUrl}/${activityname}`));
  }


  //API call
  getUniqueActivities(): Observable<string[]>{
    return (this.http.get<string[]>(`${this.apiUrl}/list`));
  }
}

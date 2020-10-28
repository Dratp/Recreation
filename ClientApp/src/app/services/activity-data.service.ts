import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { ActivityData } from '../interfaces/activitydata';



@Injectable({
  providedIn: 'root'
})
export class ActivityDataService {

  constructor(private http: HttpClient) { }



apiUrl = '/api/Activity';

getActivityDataList(): Observable<ActivityData[]>{
  return (this.http.get<ActivityData[]>(this.apiUrl));
}

}
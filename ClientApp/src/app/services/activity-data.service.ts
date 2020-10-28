import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ActivityData } from '../interfaces/activity';

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
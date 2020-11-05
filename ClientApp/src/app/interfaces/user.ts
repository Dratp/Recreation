export interface UserInfo {
  response?: boolean;
  userName?: string;
  password?: string;
  userID?: number;
  reason?: string;
  
}

export interface UserFavorite {
  id: number;
  UserID?: number;
  RIDBActivity: number;
}

export interface CreatedUser {
  userID?: number;
  userName: string;
  password: string;
  firstName: string;
  lastName: string;
  zip: string;
  city?: string;
  state?: string;
}

export interface SavedLikeInfo {
  id: number;
  UserID?: number;
  RIDBActivity: number;
  facilityID: number;
  facilityName: string;
  facilityLatitude: string;
  facilityLongitude: string;
  facilityDescriptions: string
  activity: string //activity name

}

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

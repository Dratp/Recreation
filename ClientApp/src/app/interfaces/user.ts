export interface UserInfo {
  response?: boolean;
  userName?: string;
  password?: string;
  userID?: number;
  reason?: string;
  
}

export interface UserFavorite {
  userID?: number;
  activityname?: string;
  activityid: number;
}

export interface ActivityData {
    facilityID: string;
    facilityName: string;
    activity: string;
    facilityLongtitude: string;
    facilityLatitude: string;
}

export interface ActivityDatas {
    results: ActivityData[];
    activity: ActivityData;
}

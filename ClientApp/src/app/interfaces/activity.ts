export interface ActivityData {
    facilityID: string;
    facilityName: string;
    activity: string;
    facilityLongitude: string;
    facilityLatitude: string;
    facilityDescription: string;
    id: number;
}

export interface ActivityDatas {
    results: ActivityData[];
    activity: ActivityData;
}

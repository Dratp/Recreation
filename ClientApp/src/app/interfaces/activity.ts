export interface ActivityData {
    facilityID: string;
    facilityName: string;
    activity: string;
    facilityLongitude: string;
    facilityLatitude: string;
    facilityDescription: string;
    id: number;
    favorite?: boolean;
}

export interface ActivityDatas {
    results: ActivityData[];
    activity: ActivityData;
}

import { TestBed } from '@angular/core/testing';

import { ActivityDataService } from './activity-data.service';

describe('ActivityDataService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: ActivityDataService = TestBed.get(ActivityDataService);
    expect(service).toBeTruthy();
  });
});

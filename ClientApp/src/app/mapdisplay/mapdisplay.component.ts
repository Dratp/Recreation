import { Component } from '@angular/core';

@Component({
    selector: 'app-mapdisplay',
    templateUrl: './mapdisplay.component.html',
    styleUrls: ['./mapdisplay.component.css']
})
/** mapdisplay component*/
export class MapdisplayComponent {

  title = 'My first AGM project';
  lat = 51.678418;
  lng = 7.809007;
    constructor() {

    }
}

import { Component } from '@angular/core';
import { AppService } from './app.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  constructor(public appService: AppService) {
  }
  isApiResponseVisible = false;
  title = 'angular-ssr';
  helloWorld$ = this.appService.callSpringBootBackend();

  showApiResponse(): void {
    this.isApiResponseVisible = true;
  }
}

import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs";

@Injectable({providedIn: 'root'})
export class AppService {
    constructor(private http: HttpClient) {
    }

    callSpringBootBackend(): Observable<string> {
        return this.http.get('https://angularssrwebappbackend.azurewebsites.net/api/ssr', {responseType: 'text'});
    }
}
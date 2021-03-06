import { HttpHeaders, HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

const httpOptions: any = {
	headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};
@Injectable()
export class HttpService {
	apiEndPoint: string;
	locationArray: any = [];

	constructor(public httpClient: HttpClient) {
		this.apiEndPoint = environment.apiEndPoint;
	}

	httpGet(endpoint: string = '', queryValues: string = ''): Observable<any> {
		return this.httpClient.get(this.apiEndPoint + endpoint + (queryValues ? ('/' + queryValues) : ''), httpOptions);
	}

	httpPost(endpoint: string = '', data: any): Observable<any> {
		return this.httpClient.post(this.apiEndPoint + endpoint, data, httpOptions);
	}
}

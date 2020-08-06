import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders} from '@angular/common/http';
import { student_class } from "../classes/student_class";
import { exam_class } from "../classes/exam_class";
import { url } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class LoginServiceService {
  private url= url.endPoints+'faculty_login_admin/';
  private email_url= url.endPoints+'email/';
  private exam=url.endPoints+'exambybatch_admin/'

  constructor(private _http:HttpClient) { }
  login(item)
  {
    let _abc=new HttpHeaders().set('Content-Type','application/json');
    let body=JSON.stringify(item);
    console.log(body);
    return this._http.post(this.url,body,{headers:_abc});
  }
  getfacultyById(id)
  {
    return this._http.get(this.url+id);
  }
  changePassword(item:any)
  {
    let _abc=new HttpHeaders().set('Content-Type','application/json');
    let body=JSON.stringify(item);
    return this._http.put(this.url,body,{headers:_abc});

  }
  sentMail(item)
  {
    let _abc=new HttpHeaders().set('Content-Type','application/json');
    let body=JSON.stringify(item);
    console.log(body);
    return this._http.post(this.email_url,body,{headers:_abc});
  }

}

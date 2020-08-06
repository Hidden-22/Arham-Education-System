import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import { url } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class DashboardService {

  private student=url.endPoints+"dashboardstudent_admin/";
  private barchart3=url.endPoints+"dashboardperformance_admin/";
  private faculty=url.endPoints+"dashboardfaculty_admin/";
  private batch=url.endPoints+"dashboardbatch_admin/";
  private question=url.endPoints+"dashboardquestion_admin/";
  private barchart1=url.endPoints+"barchart1Router_admin/";
  private barchart2=url.endPoints+"barchart2Router_admin/";
  private linechart=url.endPoints+"linechart_admin/";

  constructor(private _http:HttpClient) { }


  TotalSalaryPay()
  {
    return this._http.get(this.barchart2);
  }

  TotalFeesget()
  {
    return this._http.get(this.barchart1);
  }
  TotalExamget()
  {
    return this._http.get(this.linechart);

  }
  getAllStudent()
  {
    return this._http.get(this.student);
  }


  getAllFaculty()
  {
    return this._http.get(this.faculty);
  }

  getAllQuestion()
  {
    return this._http.get(this.question);
  }


  getAllBatch()
  {
    return this._http.get(this.batch);
  }

  getAllperformance()
  {
    return this._http.get(this.barchart3);
  }

}

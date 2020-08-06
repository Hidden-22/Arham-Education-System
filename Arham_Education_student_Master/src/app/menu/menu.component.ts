import { Component } from '@angular/core';
import { BreakpointObserver, Breakpoints } from '@angular/cdk/layout';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';

import { map, shareReplay } from 'rxjs/operators';
@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent {

  isHandset$: Observable<boolean> = this.breakpointObserver.observe(Breakpoints.Handset)
    .pipe(
      map(result => result.matches),
      shareReplay()
    );

    email:string="";
    constructor(private breakpointObserver: BreakpointObserver,private _route:Router) {

      this.email=localStorage.getItem('email_id');
    }

logout()
  {


    localStorage.setItem('email_id',"");

     this._route.navigate(['']);

  }

}

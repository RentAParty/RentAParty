import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})

export class HomePage {

  constructor(private route: Router) {}


nextpage(controle) {

  if (controle==1) {
  this.route.navigate(['/login']);
}else{
  this.route.navigate(['/cadastro'])
}
}
}
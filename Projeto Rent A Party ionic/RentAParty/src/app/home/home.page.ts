import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})

export class HomePage {

  constructor(private route: Router) { }


  nextpage(controle: number) {

    switch (controle) {
      case 1:
        this.route.navigate(['./login']);
        break;
      case 2:
        this.route.navigate(['./cadastro'])
    }
  }
}

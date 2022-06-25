import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AlertController } from '@ionic/angular';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage {

  constructor(
    private route: Router,
    private alertController: AlertController) { }

  email: string;
  senha: string;
  cli: boolean;
  fun: boolean;

  validar(numero: number) {
    switch (numero) {
      case 1:
        this.fun = false
        break;
      case 2:
        this.cli = false
        break;
    }
  }

  proximapag() {

    if (this.email == "" || this.email==undefined) {
      this.alertController.create({
        header: 'ESPERA AI!!!',
        subHeader: 'Endereço de email vazio!',
        message: 'Por favor, preencha o seu endereço de email.',
        buttons: ['OK']
      }).then(res => {
        res.present();
      });

    } else if (this.senha == "" || this.senha==undefined) {

      this.alertController.create({
        header: 'ESPERA AI!!!',
        subHeader: 'Senha vazia!',
        message: 'Por favor, insira a sua senha!',
        buttons: ['OK']
      }).then(res => {
        res.present();
      });

    } else if (this.cli == true) {
      this.route.navigate(['./cliente']);

    } else if (this.fun == true) {
      this.route.navigate(['./funcionario']);

    } else {
      this.alertController.create({
        header: 'ESPERA AI!!!',
        subHeader: 'O que você é?',
        message: 'Selecione uma das opções entre cliente ou funcionário.',
        buttons: ['OK']
      }).then(res => {
        res.present();
      });
    }
  }
}




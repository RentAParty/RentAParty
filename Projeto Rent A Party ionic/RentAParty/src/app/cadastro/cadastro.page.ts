import { Component, OnInit } from '@angular/core';
import { AlertController } from '@ionic/angular';

@Component({
  selector: 'app-cadastro',
  templateUrl: './cadastro.page.html',
  styleUrls: ['./cadastro.page.scss'],
})
export class CadastroPage implements OnInit {
  regexemail = new RegExp(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/);
  regexsenha = new RegExp(/^ (?=.* [A - Za - z])(?=.*\d)[A - Za - z\d]{ 8, }$/)
  constructor(private alertController: AlertController) { }

  ngOnInit() {
  }
  
 /* if (this.regexemail.test(this.email) == false) {
    this.alertController.create({
      header: 'ESPERA AI!!!',
      subHeader: 'Email inválido',
      message: 'Por favor, insira um endereço de email válido!',
      buttons: ['OK']
    }).then(resposta => {
      resposta.present();
    });
  } else if (this.regexsenha.test(this.senha)==false) {

    alert(this.senha)
    this.alertController.create({
      header: 'ESPERA AI!!!',
      subHeader: 'Senha inválida',
      message: 'A senha deve conter ao menos 8 caracteres e no máximo 20. Deve conter também uma letra e um número!',
      buttons: ['OK']
    }).then(resposta => {
      resposta.present();
    });
  }*/
}

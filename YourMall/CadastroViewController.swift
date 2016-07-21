//
//  CadastroViewController.swift
//  YourMall
//
//  Created by Juan Munhoes Junior on 7/20/16.
//  Copyright © 2016 Hackatruck. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var viewPerfil:UIView!
    @IBOutlet weak var imgProfile:UIImageView!
    @IBOutlet weak var botaoImagem:UIButton!
    @IBOutlet weak var txtEmail:UITextField!
    @IBOutlet weak var txtSenha:UITextField!
    @IBOutlet weak var botaoCadastrar:UIButton!
    @IBOutlet weak var scrollView:UIScrollView!
    @IBOutlet weak var txtNome:UITextField!
    
    @IBOutlet weak var viewSpinner:UIView!
    @IBOutlet weak var spinner:UIActivityIndicatorView!
    
    override func viewWillAppear(animated: Bool) {
        self.viewSpinner.hidden = true
        self.spinner.stopAnimating()
        self.navigationController?.navigationBar.hidden = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Cadastrar"
        
        botaoCadastrar.layer.cornerRadius = 2.0
        botaoCadastrar.clipsToBounds = true
        txtSenha.delegate = self
        txtEmail.delegate = self
        txtNome.delegate = self
    }

    
    @IBAction func alterarImagemUsuario(){
        
    }
    
    @IBAction func cadastrarUsuario(){
        self.viewSpinner.hidden = false
        self.spinner.startAnimating()
        if(txtEmail.text != "" && txtSenha.text != "" && txtNome.text != ""){
        
          FIRAuth.auth()?.createUserWithEmail(txtEmail.text!, password: txtSenha.text!, completion: { (user, error) in
            
            if error != nil{
                self.mostrarAlerta("Erro", mensagem: (error?.localizedDescription)!)
                self.viewSpinner.hidden = true
                self.spinner.stopAnimating()
            }
            else{
                self.mostrarAlerta("Sucesso", mensagem: "Usuário cadastrado com sucesso")
                
                let changeRequest = user!.profileChangeRequest()
                
                changeRequest.displayName = self.txtNome.text!
                
                // Altera Imagem
                //changeRequest.photoURL =
                //    NSURL(string: "https://example.com/jane-q-user/profile.jpg")
                changeRequest.commitChangesWithCompletion { error in
                    if error != nil {
                        // An error happened.
                        print(error?.localizedDescription)
                        self.viewSpinner.hidden = true
                        self.spinner.stopAnimating()
                    } else {
                        // Profile updated.
                        print("commited update user")
                        self.viewSpinner.hidden = true
                        self.spinner.stopAnimating()
                    }
                }
            }
          })
        }
        else{
            mostrarAlerta("Campos em branco", mensagem: "O nome, e-mail e senha deve ser preenchido.")
            self.viewSpinner.hidden = true
            self.spinner.stopAnimating()
        }
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        if textField == txtNome{
            scrollView.contentOffset.y = -30
        }
        else if textField == txtEmail{
            scrollView.contentOffset.y = 0
        }
        else if textField == txtSenha{
            scrollView.contentOffset.y = 30
        }
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        scrollView.contentOffset.y = -64
      
        return true
    }
    
    func mostrarAlerta(titulo:String, mensagem:String){
        let alert = UIAlertController(title:titulo, message: mensagem, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

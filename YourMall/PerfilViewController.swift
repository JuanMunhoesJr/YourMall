//
//  PerfilViewController.swift
//  YourMall
//
//  Created by Juan Munhoes Junior on 7/19/16.
//  Copyright © 2016 Hackatruck. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController,UITextFieldDelegate,FBSDKLoginButtonDelegate {

    @IBOutlet weak var txtEmail:UITextField!
    @IBOutlet weak var txtSenha:UITextField!
    @IBOutlet weak var botaoEntrar:UIButton!
    @IBOutlet weak var botaoFacebook:FBSDKLoginButton!
    @IBOutlet weak var botaoCadastrar:UIButton!
    @IBOutlet weak var viewSpinner:UIView!
    @IBOutlet weak var spinner:UIActivityIndicatorView!
    
    override func viewWillAppear(animated: Bool) {
        
        self.viewSpinner.hidden = true
        self.spinner.stopAnimating()
        self.navigationController?.navigationBar.hidden = true
        
        if (FIRAuth.auth()?.currentUser) != nil {
            // User is signed in.
            self.performSegueWithIdentifier("segueConectado", sender: nil)
        } else {
            // No user is signed in.
        }
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtEmail.delegate = self
        txtSenha.delegate = self
        
        botaoEntrar.layer.cornerRadius = 2.0
        botaoFacebook.layer.cornerRadius = 2.0
        botaoEntrar.clipsToBounds = true
        botaoFacebook.clipsToBounds = true
        botaoFacebook.delegate = self
        botaoFacebook.readPermissions = ["public_profile", "email", "user_friends"];
    }

    @IBAction func entrar(){
    
        self.viewSpinner.hidden = false
        self.spinner.startAnimating()
        if txtEmail.text == "" || txtSenha.text == ""{
            mostrarAlerta("Campos em branco", mensagem: "Necessário preencher o campo de e-mail e senha para autenticação.")
            self.viewSpinner.hidden = true
            self.spinner.stopAnimating()
        }
        else{
            FIRAuth.auth()?.signInWithEmail(txtEmail.text!, password: txtSenha.text!, completion: { (user, error) in
                if error != nil{
                    // Error
                    self.mostrarAlerta("Erro", mensagem: (error?.localizedDescription)!)
                    self.viewSpinner.hidden = true
                    self.spinner.stopAnimating()
                }
                else{
                    // Authenticated
                    self.txtEmail.text = ""
                    self.txtSenha.text = ""
                    self.performSegueWithIdentifier("segueConectado", sender: nil)
                    self.viewSpinner.hidden = true
                    self.spinner.stopAnimating()
                }
            })
        }
    }
    
    @IBAction func cadastrar(){
        self.performSegueWithIdentifier("segueCadastrar", sender: nil)
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
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

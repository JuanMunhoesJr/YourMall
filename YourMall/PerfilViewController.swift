//
//  PerfilViewController.swift
//  YourMall
//
//  Created by Juan Munhoes Junior on 7/19/16.
//  Copyright © 2016 Hackatruck. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtEmail:UITextField!
    @IBOutlet weak var txtSenha:UITextField!
    @IBOutlet weak var botaoEntrar:UIButton!
    @IBOutlet weak var botaoFacebook:UIButton!
    @IBOutlet weak var botaoCadastrar:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtEmail.delegate = self
        txtSenha.delegate = self
        
        
        botaoEntrar.layer.cornerRadius = 2.0
        botaoFacebook.layer.cornerRadius = 2.0
        botaoEntrar.clipsToBounds = true
        botaoFacebook.clipsToBounds = true
    }

    
    @IBAction func entrar(){
        
    }
    
    @IBAction func cadastrar(){
        
    }
    
    @IBAction func facebook(){
        
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

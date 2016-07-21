//
//  UsuarioAutenticadoViewController.swift
//  YourMall
//
//  Created by Juan Munhoes Junior on 7/21/16.
//  Copyright © 2016 Hackatruck. All rights reserved.
//

import UIKit

class UsuarioAutenticadoViewController: UIViewController {

    @IBOutlet weak var imgProfile:UIImageView!
    @IBOutlet weak var lblNome:UILabel!
    @IBOutlet weak var lblEmail:UILabel!
    @IBOutlet weak var botaoDesconectar:UIButton!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let user = FIRAuth.auth()?.currentUser
        
        if user?.displayName != nil{
            lblNome.text = user?.displayName
        }
        if user?.email != nil{
            lblEmail.text = user?.email
        }
        
        botaoDesconectar.clipsToBounds = true
        botaoDesconectar.layer.cornerRadius = 2.0
        
    }
    
    @IBAction func desconectar(){
        do {
            try FIRAuth.auth()?.signOut()
            self.navigationController?.popViewControllerAnimated(true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
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

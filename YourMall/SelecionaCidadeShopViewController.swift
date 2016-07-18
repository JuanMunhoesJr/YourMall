//
//  SelecionaCidadeShopViewController.swift
//  YourMall
//
//  Created by Student on 7/18/16.
//  Copyright © 2016 Hackatruck. All rights reserved.
//

import UIKit

class SelecionaCidadeShopViewController: UIViewController {

    
    @IBOutlet weak var txtCidade:UITextField!
    @IBOutlet weak var txtShopping:UITextField!
    @IBOutlet weak var botaoBuscar:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        botaoBuscar.layer.cornerRadius = 2.0
        botaoBuscar.clipsToBounds = true
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

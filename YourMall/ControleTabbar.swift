//
//  ControleTabbar.swift
//  YourMall
//
//  Created by Juan Munhoes Junior on 7/19/16.
//  Copyright © 2016 Hackatruck. All rights reserved.
//

import UIKit

class ControleTabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Imagem fundo ao selecionar um Tab.
        UITabBar.appearance().selectionIndicatorImage = UIImage(named:"tabBarSelectionIndicator")
       
        // Setar item selecionado.
        self.selectedIndex = 2
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

//
//  SobreViewController.swift
//  YourMall
//
//  Created by Juan Munhoes Junior on 7/19/16.
//  Copyright © 2016 Hackatruck. All rights reserved.
//

import UIKit

class SobreViewController: UIViewController {

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false
    }
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Sobre"
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

//
//  TopOfertasViewController.swift
//  YourMall
//
//  Created by Juan Munhoes Junior on 7/19/16.
//  Copyright © 2016 Hackatruck. All rights reserved.
//

import UIKit

class TopOfertasViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView:UITableView!
    
    var listaOfertas:[Oferta] = [Oferta]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     
        let o1 = Oferta(nome: "Lacoste", total: 100, descricao: "asudhua ushu adhud uah audu shau suahuduafubagjajs fja gjka fj aksjk ka dska kd agqkj wke am,s  ag ,asf", url: "lacoste", categoria: "Roupas", preco: 200.00)
        
        let o2 = Oferta(nome: "Calvin Klein", total: 99, descricao: " asjd saj d gja ng w qke qkd qk dkjqw dj ak g as, gm,a s,dam sdjq j s dan a ajs fajs djkq wdqdw, ga ,s fajdka d af asga skd adjk sakjasdu ahus hudauhhua uha ausdhuaushduhqwneq dk qwdkqw ddqdq", url: "ck", categoria: "Roupas", preco: 53.90)
        
        listaOfertas.append(o1)
        listaOfertas.append(o2)
        
        
        self.tableView.estimatedRowHeight = 134
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaOfertas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellOfertas", forIndexPath: indexPath) as! CellOfertas
        
        let oferta = listaOfertas[indexPath.row]
        
        if oferta.imagemUrl != ""{
            cell.imgPerfil.image = UIImage(named: oferta.imagemUrl!)
        }
        cell.lblNomeLoja.text = oferta.nomeLoja
        cell.lblCategoria.text = oferta.categoria
        cell.lblDescricao.text = oferta.descricao
        cell.lblValor.text = String(format: "R$ %.2f", oferta.preco)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
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

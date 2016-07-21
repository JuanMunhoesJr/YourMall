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
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let o1 = Oferta(nome: "Lacoste", total: 100, descricao: "Venha conferir a nossa promoção de camisas compre 3 e leve 4! Válido até o dia 28.06. Não perca esta oportunidade!", url: "lacoste", categoria: "Roupas", preco: 200.00)
        
        let o2 = Oferta(nome: "Calvin Klein", total: 99, descricao: "Promoção tudo em dobro! Confira nossas camisetas, a cada uma compra você pode escolher outra peça! ", url: "ck", categoria: "Roupas", preco: 63.90)
        
        
        let o3 = Oferta(nome: "Calvin Klein", total: 99, descricao: "Sandália salto Lara 7021, confeccionado em couro. Tira ankle strap com fecho em fivela. A palmilha é revestida em PU macio para maior conforto. O salto é robusto com meia pata em tecido com estampa listrada. Solado micro. Medidas Aproximadas: Altura do Salto: 13cm | Meia Pata: 5cm | Circunferência: 25cm | Largura do Solado: 7cm | Peso: 996g.", url: "ck", categoria: "Roupas", preco: 112.90)
        
        
        let o4 = Oferta(nome: "Lacoste", total: 99, descricao: "Bolsa Dumond Tote preta, confeccionada em material sintético, possui detalhe metalizado da marca e pespontos aparentes. Alça dupla de mão e fechamento por botão de encaixe. Mede 47cm de largura, 32cm de altura e 16cm de profundidade. Interior em material têxtil, com compartimento único.", url: "lacoste", categoria: "Roupas", preco: 300.00)
        
        
        let o5 = Oferta(nome: "Eletronicos", total: 99, descricao: "Apresenta design Premium, com cuidado em cada mínimo detalhe. Todos os elementos foram combinados, desde as linhas naturalmente fluidas até ao formato ultrafino, a fim de proporcionar uma aderência confortável. Quais as possibilidades que o seu celular pode oferecer? É algo que você irá repensar. Com o Galaxy S7 e S7 Edge, você pode curti-los dentro da piscina, tirar selfies na praia sem risco e até chamar um taxi na chuva. Eles possuem a certificação IP68 (proteção contra elementos exteriores), que os torna mais resistentes e irresistíveis. *Podem ser imersos em 1.5 metros de água, com duração de até 30 minutos.", url: "", categoria: "Roupas", preco: 3200.00)
        
        listaOfertas.append(o1)
        listaOfertas.append(o2)
        listaOfertas.append(o3)
        listaOfertas.append(o4)
        listaOfertas.append(o5)
        
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
        else{
            cell.imgPerfil.image = nil
        }
        cell.lblNomeLoja.text = oferta.nomeLoja
        cell.lblCategoria.text = oferta.categoria
        cell.lblDescricao.text = oferta.descricao
        
        if FIRAuth.auth()?.currentUser != nil{
            cell.lblValor.text = String(format: "R$ %.2f", oferta.preco)
        }
        else{
            cell.lblValor.text = "Efetue o login para saber mais informações."
        }
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

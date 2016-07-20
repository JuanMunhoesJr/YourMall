//
//  SelecionaCidadeShopViewController.swift
//  YourMall
//
//  Created by Student on 7/18/16.
//  Copyright © 2016 Hackatruck. All rights reserved.
//

import UIKit

class SelecionaCidadeShopViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var txtCidade:UITextField!
    @IBOutlet weak var txtShopping:UITextField!
    @IBOutlet weak var botaoBuscar:UIButton!
    @IBOutlet weak var viewPicker:UIView!
    @IBOutlet weak var pickerView:UIPickerView!
    @IBOutlet weak var botaoOk:UIBarButtonItem!
    
    weak var referenciaTextField:UITextField!
    
    var cidades:[String]  = ["Campinas","Itu","Sorocaba"]
    var shoppingsItu:[String] = ["Plaza Shopping Itu"]
    var shoppingsCampinas:[String] = ["Campinas Shopping","Central Shopping Campinas","Shopping Center Iguatemi"]
    var shoppingsSorocaba:[String] = ["Shopping Cidade Sorocaba","Shopping Iguatemi","Sorocaba Shopping Center","Pátio Cianê Shopping"]
    
    var pickerData: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        botaoBuscar.layer.cornerRadius = 2.0
        botaoBuscar.clipsToBounds = true
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        txtCidade.delegate = self
        txtShopping.delegate = self
        
        esconderCombo()
        
    }
    @IBAction func selecionarAlvo(){
        if txtCidade.text == "" || txtShopping.text == ""{
            mostrarAlerta("Campos em branco", mensagem: "A cidade e o shopping precisa ser selecionado.")
        }
        else{
            Sessao.singleton.salvarObjeto(txtCidade.text!, chave: "Cidade")
            Sessao.singleton.salvarObjeto(txtShopping.text!, chave: "Shopping")
            self.performSegueWithIdentifier("tabsegue", sender: self)
        }
    }
    @IBAction func fecharOk(){
        esconderCombo()
    }
    func esconderCombo(){
        self.viewPicker.hidden = true
        self.pickerView.hidden = true
    }
    func showCidades(){
        pickerData = cidades
        pickerView.selectRow(0, inComponent: 0, animated: true)
        referenciaTextField.text = pickerData[0]
        pickerView.reloadAllComponents()
        self.viewPicker.hidden = false
        self.pickerView.hidden = false
        txtShopping.text = ""
    }
    func showShoppings(){
        if txtCidade.text == ""{
            mostrarAlerta("Alerta", mensagem: "Selecione uma cidade primeiro.")
        }
        else{
            if txtCidade.text == "Itu"{
                pickerData = shoppingsItu
            }
            else if txtCidade.text == "Sorocaba"{
                pickerData = shoppingsSorocaba
                pickerView.selectRow(0, inComponent: 0, animated: true)
            }
            else if txtCidade.text == "Campinas"{
                pickerData = shoppingsCampinas
                pickerView.selectRow(0, inComponent: 0, animated: true)
            }
            
            referenciaTextField.text = pickerData[0]
            self.viewPicker.hidden = false
            self.pickerView.hidden = false
            pickerView.reloadAllComponents()
        }
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        referenciaTextField = textField
        if txtCidade == textField{
            showCidades()
        }
        else if txtShopping == textField{
            showShoppings()
        }
        return false
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Catpure the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        referenciaTextField.text = pickerData[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func mostrarAlerta(titulo:String, mensagem:String){
            let alert = UIAlertController(title:titulo, message: mensagem, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
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

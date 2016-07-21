//
//  Sessao.swift
//  YourMall
//
//  Created by Juan Munhoes Junior on 7/19/16.
//  Copyright © 2016 Hackatruck. All rights reserved.
//

import UIKit

class Sessao:NSObject {
    
    static let singleton = Sessao()
    private override init(){} // Previne terceiros da utilização
    
    func salvarObjeto(objeto:String, chave:String){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(objeto, forKey: chave)
    }
    
    func getObjeto(chave:String) -> String{
        let defaults = NSUserDefaults.standardUserDefaults()
        if existeObjeto(chave){
            return defaults.stringForKey(chave)!
        }
        return ""
    }
    func existeObjeto(chave:String) -> Bool{
        let defaults = NSUserDefaults.standardUserDefaults()
        if defaults.stringForKey(chave) != nil {
            return true
        }
        return false
    }
    
    func removeObjeto(chave:String){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(nil, forKey: chave)
    }
}

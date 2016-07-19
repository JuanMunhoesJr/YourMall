//
//  Oferta.swift
//  YourMall
//
//  Created by Student on 7/19/16.
//  Copyright © 2016 Hackatruck. All rights reserved.
//

import UIKit

class Oferta: NSObject {

    var imagemUrl:String?
    var totalVisualizacoes:Int = 0
    var nomeLoja:String!
    var descricao:String!
    var categoria:String!
    var preco:Double = 0

    init(nome:String,total:Int, descricao:String, categoria:String, preco:Double){
        self.nomeLoja = nome
        self.totalVisualizacoes = total
        self.descricao = descricao
        self.imagemUrl = ""
        self.categoria = categoria
        self.preco = preco
    }
    
    init(nome:String,total:Int, descricao:String, url:String, categoria:String, preco:Double){
        self.nomeLoja = nome
        self.totalVisualizacoes = total
        self.descricao = descricao
        self.imagemUrl = url
        self.categoria = categoria
        self.preco = preco
    }
}

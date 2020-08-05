//
//  Producto.swift
//  LiverpooliOS
//
//  Created by Hector Aguilar on 7/30/20.
//  Copyright © 2020 Hector Aguilar. All rights reserved.
//

import Foundation
import UIKit

class Producto{
    //var imagen: UIImage
    var nombre: String
    var descripcion: String
    var precio: String
    
    init(nombre: String, descripcion: String, precio: String){
    
    //init(imagen: UIImage, nombre: String, descripcion: String, precio: String){
        //self.imagen = imagen
        self.nombre = nombre
        self.descripcion = descripcion
        self.precio = precio
        
    }
    func setProducto(producto: Producto){
        
        self.nombre = producto.nombre
        
        self.descripcion = producto.descripcion
        
        self.precio = producto.precio
        
        
        
        
        
    }
    
}


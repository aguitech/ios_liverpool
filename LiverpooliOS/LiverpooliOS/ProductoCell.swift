//
//  ProductoCell.swift
//  LiverpooliOS
//
//  Created by Hector Aguilar on 7/30/20.
//  Copyright © 2020 Hector Aguilar. All rights reserved.
//

import UIKit
class ProductoCell: UITableViewCell{
    
    
    //@IBOutlet weak var imagen: UIImageView!
    
    
    @IBOutlet weak var nombre: UILabel!
    
    @IBOutlet weak var descripcion: UILabel!
    
    @IBOutlet weak var precio: UILabel!
    
    func setProducto(producto: Producto){
        
        nombre.text = producto.nombre
        
        descripcion.text = producto.descripcion
        
        precio.text = producto.precio
        
        //imagen.image = producto.imagen
        
        
        
        
    }
    /*
    func setPublicacion(publicacion: Publicacion){
        
        blogTitleLabel.text = publicacion.title
        
        blogLikesLabel.text = publicacion.likes
        
        blogFechaLabel.text = publicacion.fecha
        
        blogImageView.image = publicacion.image
        
        
        
        
    }
    */
    
    //@IBOutlet weak var blogTitleLabel: UILabel!
    
    //@IBOutlet weak var blogLikesLabel: UILabel!
    //@IBOutlet weak var blogFechaLabel: UILabel!
    
    //@IBOutlet weak var blogImageView: UIImageView!
    /*
    func setPublicacion(publicacion: Publicacion){
        
        blogTitleLabel.text = publicacion.title
        
        blogLikesLabel.text = publicacion.likes
        
        blogFechaLabel.text = publicacion.fecha
        
        blogImageView.image = publicacion.image
        
        
        
        
    }
    */
}


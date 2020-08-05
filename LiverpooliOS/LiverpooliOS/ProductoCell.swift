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
  @IBOutlet weak var precio: UILabel!

  func setProducto(producto: Records){

    nombre.text = producto.productDisplayName

    if let price = producto.listPrice {
      precio.text = "$\(price)"
    }
    
    //imagen.image = producto.imagen
  }
}


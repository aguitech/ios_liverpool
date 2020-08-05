//
//  ProductoCell.swift
//  LiverpooliOS
//
//  Created by Hector Aguilar on 7/30/20.
//  Copyright © 2020 Hector Aguilar. All rights reserved.
//

import UIKit
class ProductoCell: UITableViewCell{


  @IBOutlet weak var imagen: UIImageView!
  @IBOutlet weak var nombre: UILabel!
  @IBOutlet weak var precio: UILabel!

  func setProducto(producto: Records){

    nombre.text = producto.productDisplayName

    if let price = producto.listPrice {
      precio.text = "$\(price)"
    }
    
    imagen.imageFromUrl(urlString: producto.smImage ?? "")
  }
}

extension UIImageView {
  public func imageFromUrl(urlString: String) {
    if let url = URL(string: urlString) {
      let request = NSURLRequest(url: url)
      URLSession.shared.dataTask(with: request as URLRequest){ data, response, error in
        if let imageData = data as NSData? {
          DispatchQueue.main.async {
            self.image = UIImage(data: imageData as Data)
          }
        }
      }.resume()
    }
  }
}

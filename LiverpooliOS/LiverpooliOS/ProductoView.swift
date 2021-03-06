//
//  ProductoView.swift
//  LiverpooliOS
//
//  Created by Hector Aguilar on 8/8/20.
//  Copyright © 2020 Hector Aguilar. All rights reserved.
//

import UIKit

class ProductoView: UIViewController {
    
    var producto: [Records] = [Records]()
    
  var contactSelected = 0
    var idUsuario: String = ""
  var productos: [Records] = [Records]()

    @IBOutlet weak var txtTitulo: UILabel!
    
    @IBOutlet weak var txtPrecio: UILabel!
    
    @IBOutlet weak var imagenProducto: UIImageView!
    
    
override func viewDidLoad() {
    super.viewDidLoad()
    
    print("Detalle")
    print(producto)
    //print(producto->LiverpooliOS as String)
    
    print(producto[0])
    
    
    print(producto[0].productDisplayName)
    
    print(producto[0].minimumListPrice)
    
    txtTitulo.text = producto[0].productDisplayName
    
    
    
    if let price = producto[0].listPrice {
      txtPrecio.text = "$\(price)"
    }

    //imagen.imageFromUrl(urlString: producto.smImage ?? "")
     
    imagenProducto.imageFromUrl(urlString: producto[0].smImage ?? "")
    
    //guard let name = producto->Records else {return};print("Hello \(name)!")
    
    
    print(producto[0].brand)
    
    //guard let location = person["location"] else {print("I hope the weather is nice near you.")return}print("I hope the weather is nice in \(location).")
    
   
    
    
    
    
    
    
        /*
         Detalle
         [LiverpooliOS.Records(productId: Optional("1090567924"), skuRepositoryId: Optional("1090567949"), productDisplayName: Optional("Corbata Scappino regular seda con diseño gráfico"), productType: Optional("Soft Line"), productRatingCount: Optional(1), productAvgRating: Optional(5.0), listPrice: Optional(990.0), minimumListPrice: Optional(990.0), maximumListPrice: Optional(990.0), promoPrice: Optional(495.0), minimumPromoPrice: Optional(495.0), maximumPromoPrice: Optional(495.0), isHybrid: Optional(false), isMarketPlace: Optional(false), isImportationProduct: Optional(false), brand: Optional("SCAPPINO"), seller: Optional("Liverpool"), category: Optional("Accesorios"), smImage: Optional("https://ss261.liverpool.com.mx/sm/1090567924.jpg"), lgImage: Optional("https://ss261.liverpool.com.mx/lg/1090567924.jpg"), xlImage: Optional("https://ss261.liverpool.com.mx/xl/1090567924.jpg"), groupType: Optional("Not Specified"), plpFlags: Optional([]), variantsColor: Optional([LiverpooliOS.VariantsColor(colorName: Optional("AZUL MARINO"), colorHex: Optional("#19157e"), colorImageURL: Optional("")), LiverpooliOS.VariantsColor(colorName: Optional("MORADO"), colorHex: Optional("#652f71"), colorImageURL: Optional("")), LiverpooliOS.VariantsColor(colorName: Optional("ROJO"), colorHex: Optional("#d60303"), colorImageURL: Optional("")), LiverpooliOS.VariantsColor(colorName: Optional("VERDE OBSCURO"), colorHex: Optional("#3f510c"), colorImageURL: Optional("")), LiverpooliOS.VariantsColor(colorName: Optional("VIOLETA"), colorHex: Optional("#651197"), colorImageURL: Optional(""))]))]

        */
    
    //sendRequest()
    // Do any additional setup after loading the view.
  }
}

/*
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
*/

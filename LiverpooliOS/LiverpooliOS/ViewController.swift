//
//  ViewController.swift
//  LiverpooliOS
//
//  Created by Hector Aguilar on 7/30/20.
//  Copyright © 2020 Hector Aguilar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


  @IBOutlet weak var listadoProductos: UITableView!


  @IBOutlet weak var txtBuscar: UITextField!

  var contactSelected = 0;
  var text: String = "";
  var idUsuario: String = "";

  var resultados:NSDictionary = NSDictionary();
  var misproductos: [String] = []
  var idsproductos: [String] = []

  var productos: [Producto] = []

  @IBAction func buscar(_ sender: UIButton) {

    let url = URL(string: "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?force-plp=true&search-string=playera&page-number=1&number-of-items-per-page=20")
    var request : URLRequest = URLRequest(url: url!)
    request.httpMethod = "GET"

    let dataTask = URLSession.shared.dataTask(with: request) {
      data,response,error in
      print("anything")
      do {
        if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
          //DESCOMENTAR
          self.resultados = jsonResult
          print(jsonResult)
          //Use GCD to invoke the completion handler on the main thread

          DispatchQueue.main.async() {
            print("probando")

          }

        }
      } catch let error as NSError {
        print(error.localizedDescription)
      }
    }
    dataTask.resume()
  }


  override func viewDidLoad() {
    super.viewDidLoad()

    sendRequest()
    // Do any additional setup after loading the view.
  }

  func sendRequest() {
    /* Configure session, choose between:
     * defaultSessionConfiguration
     * ephemeralSessionConfiguration
     * backgroundSessionConfigurationWithIdentifier:
     And set session-wide properties, such as: HTTPAdditionalHeaders,
     HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
     */
    let sessionConfig = URLSessionConfiguration.default

    /* Create session, and optionally set a URLSessionDelegate. */
    let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

    /* Create the Request:
     Request (GET https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp)
     */

    guard var URL = URL(string: "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp") else {return}
    let URLParams = [
      "force-plp": "true",
      "search-string": "playera",
      "page-number": "1",
      "number-of-items-per-page": "20",
    ]
    URL = URL.appendingQueryParameters(URLParams)
    var request = URLRequest(url: URL)
    request.httpMethod = "GET"

    /* Start a new Task */
    let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
      guard let dataResponse = data,
        error == nil else {
          print(error?.localizedDescription ?? "Response Error")
          return }

        print(dataResponse)
        
        
        
      let decoder = JSONDecoder()
      do{
        let object = try JSONDecoder().decode(LiverpoolObject.self, from: data!)
        print(object.plpResults?.plpState?.lastRecNum)

        //print(object)
        
        //print(object.plpResults?.records)
        /*
         ptional([LiverpooliOS.Records(productId: Optional("1093720014"), skuRepositoryId: Optional("1093720179"), productDisplayName: Optional("Playera polo LIEB Basics manga corta"), productType: Optional("Soft Line"), productRatingCount: Optional(21), productAvgRating: Optional(4.4), listPrice: Optional(299.0), minimumListPrice: Optional(299.0), maximumListPrice: Optional(299.0), promoPrice: Optional(119.6), minimumPromoPrice: Optional(119.6), maximumPromoPrice: Optional(119.6), isHybrid: Optional(false), isMarketPlace: Optional(false), isImportationProduct: Optional(false), brand: Optional("LIEB BASICS"), seller: Optional("Liverpool"), category: Optional("Blusas y Playeras"), smImage: Optional("https://ss553.liverpool.com.mx/sm/1093720014.jpg"), lgImage: Optional("https://ss553.liverpool.com.mx/lg/1093720014.jpg"), xlImage: Optional("https://ss553.liverpool.com.mx/xl/1093720014.jpg"), groupType: Optional("Not Specified"), plpFlags: Optional([]), variantsColor: Optional([LiverpooliOS.VariantsColor(colorName: Optional("AZUL REY"), colorHex: Optional("#117db5"), colorImageURL: Optional("")), LiverpooliOS.VariantsColor(colorName: Optional("ROSA"), colorHex: Optional("#f76ea5"), colorImageURL: Optional(""))])), LiverpooliOS.Records(productId: Optional("1093715509"), skuRepositoryId: Optional("1093719871"), productDisplayName: Optional("Playera polo LIEB Basics con diseño floral"), productType: Optional("Soft Line"), productRatingCount: Optional(29), productAvgRating: Optional(4.3), listPrice: Optional(349.0), minimumListPrice: Optional(349.0), maximumListPrice: Optional(349.0), promoPrice: Optional(139.6), minimumPromoPrice: Optional(139.6), maximumPromoPrice: Optional(139.6), isHybrid: Optional(false), isMarketPlace: Optional(false), isImportationProduct: Optional(false), brand: Optional("LIEB BASICS"), seller: Optional("Liverpool"), category: Optional("Blusas y Playeras"), smImage: Optional("https://ss553.liverpool.com.mx/sm/1093715509.jpg"), lgImage: Optional("https://ss553.liverpool.com.mx/lg/1093715509.jpg"), xlImage: Optional("https://ss553.liverpool.com.mx/xl/1093715509.jpg"), groupType: Optional("Not Specified"), plpFlags: Optional([]), variantsColor: Optional([LiverpooliOS.VariantsColor(colorName: Optional("ROSA"), colorHex: Optional("#f76ea5"), colorImageURL: Optional(""))])), LiverpooliOS.Records(productId: Optional("1085713158"), skuRepositoryId: Optional("1085714623"), productDisplayName: Optional("Playera Aéropostale cuello redondo estampada"), productType: Optional("Soft Line"), productRatingCount: Optional(1), productAvgRating: Optional(4.0), listPrice: Optional(399.0), minimumListPrice: Optional(399.0), maximumListPrice: Optional(399.0), promoPrice: Optional(159.6), minimumPromoPrice: Optional(159.6), maximumPromoPrice: Optional(159.6), isHybrid: Optional(false), isMarketPlace: Optional(false), isImportationProduct: Optional(false), brand: Optional("AÉROPOSTALE"), seller: Optional("Liverpool"), category: Optional("Playeras"), smImage: Optional("https://ss224.liverpool.com.mx/sm/1085713158.jpg"), lgImage: Optional("https://ss224.liverpool.com.mx/lg/1085713158.jpg"), xlImage: Optional("https://ss224.liverpool.com.mx/xl/1085713158.jpg"), groupType: Optional("Not Specified"), plpFlags: Optional([]), variantsColor: Optional([LiverpooliOS.VariantsColor(colorName: Optional("BLANCO"), colorHex: Optional("#FFFFFF"), colorImageURL: Optional("")), LiverpooliOS.VariantsColor(colorName: Optional("VERDE"), colorHex: Optional("#568a0b"), colorImageURL: Optional(""))])), LiverpooliOS.Records(productId: Optional("1082068022"), skuRepositoryId: Optional("1082068097"), productDisplayName: Optional("Playera polo Aéropostale a rayas"), productType: Optional("Soft Line"), productRatingCount: Optional(24), productAvgRating: Optional(4.6), listPrice: Optional(499.0), minimumListPrice: Optional(499.0), maximumListPrice: Optional(499.0), promoPrice: Optional(199.6), minimumPromoPrice: Optional(199.6), maximumPromoPrice: Optional(199.6), isHybrid: Optional(false), isMarketPlace: Optional(false), isImportationProduct: Optional(false), brand: Optional("AÉROPOSTALE"), seller: Optional("Liverpool"), category: Optional("Playeras y Polos"), smImage: Optional("https://ss224.liverpool.com.mx/sm/1082068022.jpg"), lgImage: Optional("https://ss224.liverpool.com.mx/lg/1082068022.jpg"), xlImage: Optional("https://ss224.liverpool.com.mx/xl/1082068022.jpg"), groupType: Optional("Not Specified"), plpFlags: Optional([]), variantsColor: Optional([LiverpooliOS.VariantsColor(colorName: Optional("VERDE"), colorHex: Optional("#568a0b"), colorImageURL: Optional("")), LiverpooliOS.VariantsColor(colorName: Optional("VINO"), colorHex: Optional("#581e2a"), colorImageURL: Optional(""))])), LiverpooliOS.Records(productId: Optional("1089989743"), skuRepositoryId: Optional("1089989805"), productDisplayName: Optional("Playera Aéropostale jaspeada con parche"), productType: Optional("Soft Line"), productRatingCount: Optional(17), productAvgRating: Optional(4.8), listPrice: Optional(399.0), minimumListPrice: Optional(399.0), maximumListPrice: Optional(399.0), promoPrice: Optional(199.5), minimumPromoPrice: Optional(199.5), maximumPromoPrice: Optional(199.5), isHybrid: Optional(false), isMarketPlace: Optional(false), isImportationProduct: Optional(false), brand: Optional("AÉROPOSTALE"), seller: Optional("Liverpool"), category: Optional("Blusas y Playeras"), smImage: Optional("https://ss524.liverpool.com.mx/sm/1089989743.jpg"), lgImage: Optional("https://ss524.liverpool.com.mx/lg/1089989743.jpg"), xlImage: Optional("https://ss524.liverpool.com.mx/xl/1089989743.jpg"), groupType: Optional("Not Specified"), plpFlags: Optional([]), variantsColor: Optional([LiverpooliOS.VariantsColor(colorName: Optional("VINO"), colorHex: Optional("#581e2a"), colorImageURL: Optional(""))])), LiverpooliOS.Records(productId: Optional("1089990067"), skuRepositoryId: Optional("1089990722"), productDisplayName: Optional("Playera Aéropostale estampada"), productType: Optional("Soft Line"), productRatingCount: Optional(2), productAvgRating: Optional(4.5), listPrice: Optional(399.0), minimumListPrice: Optional(399.0), maximumListPrice: Optional(399.0), promoPrice: Optional(159.6),
         */
        
        
        print(object.plpResults?.records?[0])
        for item in (object.plpResults?.records)!{
            print("Uno")
            print(item)
        }
        
      } catch let parsingError {
        print("Error", parsingError)
      }
    })
    task.resume()
    session.finishTasksAndInvalidate()
  }
}

protocol URLQueryParameterStringConvertible {
  var queryParameters: String {get}
}

extension Dictionary : URLQueryParameterStringConvertible {
  /**
   This computed property returns a query parameters string from the given NSDictionary. For
   example, if the input is @{@"day":@"Tuesday", @"month":@"January"}, the output
   string will be @"day=Tuesday&month=January".
   @return The computed parameters string.
   */
  var queryParameters: String {
    var parts: [String] = []
    for (key, value) in self {
      let part = String(format: "%@=%@",
                        String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                        String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
      parts.append(part as String)
    }
    return parts.joined(separator: "&")
  }
}

extension URL {
  /**
   Creates a new URL by adding the given query parameters.
   @param parametersDictionary The query parameter dictionary to add.
   @return A new URL.
   */
  func appendingQueryParameters(_ parametersDictionary : Dictionary<String, String>) -> URL {
    let URLString : String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
    return URL(string: URLString)!
  }
}



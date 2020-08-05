//
//  ViewController.swift
//  LiverpooliOS
//
//  Created by Hector Aguilar on 7/30/20.
//  Copyright © 2020 Hector Aguilar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


  @IBOutlet weak var tableView: UITableView!


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
        
        print("Hello")
        
        var tempProds: [Producto] = []
        
        for item in (object.plpResults?.records)!{
            print("Uno")
            print(item)
            
            print(item.productId!)
            
            
            self.misproductos.append(item.productDisplayName! as! String)
            
            self.idsproductos.append(item.productDisplayName! as! String)
                //let pex = Mascota(image: UIImage(imageLiteralResourceName: "icono_perro"), title: "Tom"
            
            
            
            
            
            
            
            
            
            
            
            
            
            //var pex = Producto(imagen: UIImage(imageLiteralResourceName: "Liverpool_logo"), nombre: item.productDisplayName! as! String, descripcion: item.productId! as! String, precio: item.listPrice! as! String )
            let prodAppend = Producto(nombre: item.productDisplayName! as! String, descripcion: item.productId! as! String, precio: item.productDisplayName! as! String )
                
                tempProds.append(prodAppend)
        }
        
        self.productos = tempProds
        DispatchQueue.main.async { // Correct
               self.tableView.reloadData()
        }
        
        
        /*
        for item in (object.plpResults?.records)!{
            print("Uno")
            print(item)
        }
        */
        
      } catch let parsingError {
        print("Error", parsingError)
      }
    })
    task.resume()
    session.finishTasksAndInvalidate()
  }
}


func numberOfSections(in tableView: UITableView) -> Int {
  
  
  //return 2
  //return daysOfTheWeek.count
  
  //return daysOfTheWeek.count
  //return 13
  return 1
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
  return 100
}
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  //Numero de filas
  //return 5;
  //return 5;
  //return daysOfTheWeek.count;
  //return daysOfTheWeek[section].count;
  return productos.count
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  //let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
  //let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
  //let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
  let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductoCell
  //let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PetCell
  
    let mascotarrr = productos[indexPath.row]
  
  //let dayOfTheWeek = daysOfTheWeek[1]
  //para uno ESTO ES PARA UNO
  //let dayOfTheWeek = daysOfTheWeek[indexPath.row]
  //para multiples secciones
  
  //ESTO ES PARA LA SECCIONES
  //let dayOfTheWeek = daysOfTheWeek[indexPath.section][indexPath.row]
  
  /*
   //cell.textLabel?.text = "HEllow" + dayOfTheWeek;
   cell.textLabel?.text = "HEllow \(dayOfTheWeek)" + dayOfTheWeek;
   //cell.textLabel2?.text = "HEllo2"
   cell.detailTextLabel?.text = "HElslow" + dayOfTheWeek;
   */
  //cell.textLabel?.text = "HEllow" + dayOfTheWeek;
  
  
  //cell.textLabel?.text = "HEllow \(dayOfTheWeek)" + dayOfTheWeek;
  //cell.detailTextLabel?.text = "HElslow" + dayOfTheWeek;
  ////cell.textLabel?.text = "HEllow \(dayOfTheWeek)" + dayOfTheWeek;
  //cell.detailTextLabel?.text = "HElslow" + dayOfTheWeek;
  cell.setProducto(producto: mascotarrr)
  return cell
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



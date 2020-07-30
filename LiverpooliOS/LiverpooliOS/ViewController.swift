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
        
        createArray()
        // Do any additional setup after loading the view.
    }
    
    func createArray() {
      
      var tempProductos: [Producto] = []
      
      //let url = URL(string: "https://pekits.info/json/mascotas.php?id_usuario=\(idUsuario))")
      let url = URL(string: "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?force-plp=true&search-string=playera&page-number=1&number-of-items-per-page=20")
      
      var request : URLRequest = URLRequest(url: url!)
      request.httpMethod = "GET"
      
      let postString = ""
      
      print(postString)
      
      request.httpBody = postString.data(using: .utf8)
      
      
      let dataTask = URLSession.shared.dataTask(with: request) {
        data,response,error in
        
        
        if error != nil {
          print("ocurrio un error)
        } else {
          
          if let urlContent =  data {
            
            do{
              let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
              
              // I would not recommend to use NSDictionary, try using Swift types instead
              guard let jsonValue = jsonResult as? [String: Any] else {
                print("invalid format")
                return
              }
                print(jsonValue)
                
                print("Resultado")
                
                print(jsonValue["plpResults"])
                
                print("RecordsX")
                
                print(jsonValue["plpResults"])
                
                let resultadosPrevios = jsonValue["plpResults"];
                
                
            if let resultado = jsonValue["plpResults"] as? [[String: Any]], let description = resultado.first?["nombre"] as? String {
                
                print("Hola")
                
                print(description)
                
                print(resultado.count)
                
                for item in resultado{
                  print(item)
                  
                  
                  self.misproductos.append(item["nombre"]! as! String)
              
                  self.idsproductos.append(item["id_producto"]! as! String)
                  //let pex = Mascota(image: UIImage(imageLiteralResourceName: "icono_perro"), title: "Tom")
                  var pex = Producto(imagen: UIImage(imageLiteralResourceName: "url"), nombre: item["nombre"]! as! String, descripcion: item["descripcion"]! as! String, precio: item["precio"]! as! String)
                  
                  tempProductos.append(pex)
                  
                }
                self.productos = tempProductos
                DispatchQueue.main.async { // Correct
                       self.listadoProductos.reloadData()
                }
              }
              
            }catch {
              print("JSON Preocessing failed")
            }
          }
        }
        
      }
      dataTask.resume()
      
     
      
    }


}


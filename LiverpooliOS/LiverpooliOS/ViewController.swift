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
    
    //var mascotas: [Mascota] = []
    var productos: [Producto] = []
    
    @IBAction func buscar(_ sender: UIButton) {
        
        let url = URL(string: "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?force-plp=true&search-string=playera&page-number=1&number-of-items-per-page=20")
        var request : URLRequest = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        /*
        let postString = "id_mascota=12&id_usuario=\(idUsuario)&buscar=\(String(txtBuscar.text!))&sexo=\(String(sexoInput.text!))&peso=\(String(pesoInput.text!))&edad=\(String(edadInput.text!))&altura=\(String(alturaInput.text!))&raza=\(String(razaInput.text!))&esterilizado=\(String(esterilizadoInput.text!))"
        
        print(postString)
        
        request.httpBody = postString.data(using: .utf8)
        */

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
                        
                        /*
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Forms", bundle: nil)
                        let Pet = storyBoard.instantiateViewController(withIdentifier: "MyPets") as! MyPets
                        Pet.idUsuario = self.idUsuario
                        self.present(Pet, animated: false, completion: nil)
                        
                        */
                        
                      //completion(NSArray(object: teamResult), Int(teamInput.text!)!)
                        //completion(NSArray(object: teamResult)!)
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
      
      //http://pekits.info/json/mascotas.php?id_usuario=2
      
      //let url = URL(string: "https://api-aguitech.casidios.com/api_login.php?aguitech=backend")
      //https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?force-plp=true&search-string=playera&page-number=1&number-of-items-per-page=20
      //let url = URL(string: "https://pekits.info/json/mascotas.php?id_usuario=\(idUsuario))")
      let url = URL(string: "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?force-plp=true&search-string=playera&page-number=1&number-of-items-per-page=20")
      
        //let url = URL(string: "https://pekits.info/json/mascotas_ios.php?id_usuario=2")
      //let url = URL(string: "https://pekits.info/json/alta_mascota_basico.php")
      var request : URLRequest = URLRequest(url: url!)
      request.httpMethod = "GET"
      
      let postString = ""
      
      print(postString)
      
      request.httpBody = postString.data(using: .utf8)
      
      
      let dataTask = URLSession.shared.dataTask(with: request) {
        data,response,error in
        
        
        if error != nil {
          print("some error occured")
        } else {
          
          print("jalo")
          if let urlContent =  data {
            
            do{
              let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
              
              // I would not recommend to use NSDictionary, try using Swift types instead
              guard let newValue = jsonResult as? [String: Any] else {
                print("invalid format")
                return
              }
              
              // Check for the weather parameter as an array of dictionaries and than excess the first array's description
              if let weather = newValue["data"] as? [[String: Any]], let description = weather.first?["nombre"] as? String {
                print(description)
                
                print(weather.count)
                
                for item in weather{
                  print(item)
                  
                  //self.results = item["edad"] as! [Array]
                  //self.results = item["edad"] as! NSArray
                  
                  print(item["edad"]!)
                  
                  //let pex = Mascota(image: UIImage(imageLiteralResourceName: "icono_perro"), title: item["nombre"]! as! String)
                  
                  //self.mismascotas.append("Tom")
                  self.misproductos.append(item["nombre"]! as! String)
              
                  self.idsproductos.append(item["id_mascota"]! as! String)
                  //let pex = Mascota(image: UIImage(imageLiteralResourceName: "icono_perro"), title: "Tom")
                  var pex = Producto(imagen: UIImage(imageLiteralResourceName: "icono_perro"), nombre: item["nombre"]! as! String, nombre: item["descripcion"]! as! String, nombre: item["precio"]! as! String)
                  
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


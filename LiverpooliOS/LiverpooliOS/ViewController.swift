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
      var mismascotas: [String] = []
      var idsmascotas: [String] = []
    
    //var mascotas: [Mascota] = []
    
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
        // Do any additional setup after loading the view.
    }


}


//
//  ViewController.swift
//  LiverpooliOS
//
//  Created by Hector Aguilar on 7/30/20.
//  Copyright © 2020 Hector Aguilar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var txtBuscar: UITextField!

  var contactSelected = 0
  var text: String = ""
  var idUsuario: String = ""
  var productos: [Records] = [Records]()

  @IBAction func buscar(_ sender: UIButton) {

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
      do{
        let object = try JSONDecoder().decode(LiverpoolObject.self, from: dataResponse)
        self.productos = object.plpResults?.records ?? []
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }

      } catch let parsingError {
        print("Error", parsingError)
      }
    })
    task.resume()
    session.finishTasksAndInvalidate()
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return productos.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! ProductoCell
    let mascotarrr = productos[indexPath.row]
    cell.setProducto(producto: mascotarrr)
    cell.selectionStyle = .none
    return cell
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



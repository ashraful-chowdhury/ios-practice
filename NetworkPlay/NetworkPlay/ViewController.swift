//
//  ViewController.swift
//  NetworkPlay
//
//  Created by Ashraful on 12/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func postDataButton(_ sender: Any) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let json : [String : Any] = [
            "title": "Ash",
            "body": "Learning iOS",
            "userId": 1
        ]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        
        let task = URLSession.shared.uploadTask(with: request, from: jsonData) {data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
            }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print(dataString)
            }
        }
        
        task.resume()
    }
    
    @IBAction func fetchDataButton(_ sender: Any) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("Error", error)
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: [])
            
            print(json)
        }
        
        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}


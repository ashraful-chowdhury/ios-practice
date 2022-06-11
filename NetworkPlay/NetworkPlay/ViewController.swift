//
//  ViewController.swift
//  NetworkPlay
//
//  Created by Ashraful on 12/6/22.
//

import UIKit

class ViewController: UIViewController {
    
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


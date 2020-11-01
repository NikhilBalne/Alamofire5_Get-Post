//
//  ViewController.swift
//  Alamofire5_Get
//
//  Created by Nikhil Balne on 31/10/20.
//

import UIKit
import Alamofire

struct Login: Encodable {
    let email: String
    let password: String
}

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.text = "eve.holt@reqres.in"
        passwordTextField.text = "pistol"
        
//        callListofTodos()
    }

    func callListofTodos(){
        
        let todosUrl = "https://jsonplaceholder.typicode.com/todos"
        
        NetworkingClient.networkingClient.makeGetServiceCall(url:todosUrl, controller:self){ response in
            
            if response.response?.statusCode == 200 {
                print("StatusCode:\(response.response!.statusCode)")
            
            do {
                
                let results = try JSONDecoder().decode([TodoResponse].self, from: response.data!)
            
//                print("Response:\(results)")
                
                for todo in results {
                    print(todo.title)
                }
                
            } catch let error {
                print("Error:",error.localizedDescription)
                }
            
            } else {
                print("StatusCode:\(response.response!.statusCode)")
            
                }
            }
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        
        let loginUrl = "https://reqres.in/api/login"
        let requestObj = Login(email: emailTextField.text!, password: passwordTextField.text!)

        NetworkingClient.networkingClient.makePostServiceCall(url: loginUrl, controller: self, parameters: requestObj) { (response) in

            if response.response?.statusCode == 200 {
                print("StatusCode:\(response.response!.statusCode)")

            do {

                let results = try JSONDecoder().decode(LoginResponse.self, from: response.data!)

                print("NikhilBalneResponse:\(results)")

            } catch let error {
                print("Error:",error.localizedDescription)
                }

            } else {
                print("StatusCode:\(response.response!.statusCode)")

                }

        }
    
    }
}


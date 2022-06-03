//
//  ViewController.swift
//  TestIntermediario
//
//  Created by user208023 on 6/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    let loginScreenViewModel = LoginScreenViewModel()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func loginButton(_ sender: UIButton) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if loginScreenViewModel.validateUser(email: email, password: password) {
            self.performSegue(withIdentifier: "TableViewSegue", sender: nil)
        } else {
            let alert = UIAlertController(title: "Erro", message: "Login inválido", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
    }
}


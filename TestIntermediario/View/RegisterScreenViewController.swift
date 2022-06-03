//
//  RegisterScreenViewController.swift
//  TestIntermediario
//
//  Created by user208023 on 6/2/22.
//

import UIKit

class RegisterScreenViewController: UIViewController {
    
    let registerScreenViewModel = RegisterScreenViewModel()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        let name = nameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        if registerScreenViewModel.registerUser(name: name, email: email, password: password) {
            

            let alert = UIAlertController(title: "Parabéns", message: "Usuário cadastrado com sucesso!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        } else {
            
            let alert = UIAlertController(title: "Erro", message: "Erro ao cadastrar usuário.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

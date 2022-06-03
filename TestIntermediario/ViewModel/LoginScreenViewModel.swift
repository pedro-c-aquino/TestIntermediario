//
//  LoginScreenViewModel.swift
//  TestIntermediario
//
//  Created by user208023 on 6/3/22.
//

import UIKit
import CoreData

class LoginScreenViewModel {
    
    func validateUser(email: String, password: String) -> Bool {
    
    var usuarios: [NSManagedObject] = []
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return false
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Usuario")
    
    do {
        usuarios = try managedContext.fetch(fetchRequest)
        for user in usuarios {
            let userEmail = user.value(forKey: "email") as? String
            let userPassword = user.value(forKey: "password") as? String
            
            if email == "" || password == "" {
                return false
            }
            
            if userEmail != nil && userPassword != nil {
                if userEmail! == email {
                    if userPassword! == password {
                        return true
                    }
                }
            }
            
        }
        
    } catch let error as NSError {
        print("Não foi possível retornar os registros. \(error)")
        return false
    }
    return false
}

}

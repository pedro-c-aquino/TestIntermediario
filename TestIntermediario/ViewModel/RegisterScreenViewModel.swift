//
//  RegisterScreenViewModel.swift
//  TestIntermediario
//
//  Created by user208023 on 6/3/22.
//

import UIKit
import CoreData

class RegisterScreenViewModel {
    
    func registerUser(name: String?, email: String?, password: String?) -> Bool {
        let newUser = User(name: name, email: email, password: password)
        
        if newUser.name == "" || newUser.email == "" || newUser.password == "" {
            return false
        }
        if save(name: newUser.name, email: newUser.email, password: newUser.password) {
            return true
        }
        return false
    }
    
    func save(name: String?, email: String?, password: String?) -> Bool {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Usuario", in: managedContext)!
        
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        user.setValue(name ?? "", forKey: "name")
        user.setValue(email ?? "", forKey: "email")
        user.setValue(password ?? "", forKey: "password")
        
        do {
            
            try managedContext.save()
            return true
            
        } catch let error as Error{
            print("Erro ao salvar novo nome \(error)")
            return false
        }
        
    }
}

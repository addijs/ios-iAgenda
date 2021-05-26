//
//  File.swift
//  iAgenda
//
//  Created by IFPB on 26/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PessoaDAO {
    var delegate: AppDelegate!
    
    init() {
        self.delegate = (UIApplication.shared.delegate as! AppDelegate)
    }
    
    func add(name: String, age: Int16) {
        let pessoa = Pessoa(context: self.delegate.persistentContainer.viewContext)
        pessoa.nome = name
        pessoa.idade = age
        
        self.delegate.saveContext()
    }
    
    func get() -> Array<Pessoa> {
        let request:NSFetchRequest<Pessoa> = Pessoa.fetchRequest()
        
        do {
            let pessoas = try self.delegate.persistentContainer.viewContext.fetch(request)
            return pessoas
        } catch {
            return Array<Pessoa>()
        }
    }
    
    func getByName(name: String) -> Array<Pessoa> {
        let request:NSFetchRequest<Pessoa> = Pessoa.fetchRequest()
        request.predicate = NSPredicate(format: "nome CONTAINS %@", name)
        
        do {
            let pessoas = try self.delegate.persistentContainer.viewContext.fetch(request)
            return pessoas
        } catch {
            return Array<Pessoa>()
        }
    }
    
    func del(pessoa: Pessoa) {
        self.delegate.persistentContainer.viewContext.delete(pessoa)
        self.delegate.saveContext()
    }
    
    func update() {
        self.delegate.saveContext()
    }
}

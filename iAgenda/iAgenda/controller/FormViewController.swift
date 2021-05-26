//
//  ViewController.swift
//  iAgenda
//
//  Created by IFPB on 26/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    var pessoaToEdit: Pessoa!

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    
    @IBAction func save(_ sender: Any) {
        let name = self.tfName.text
        let age = Int16(self.tfAge.text!)
        
        if (self.pessoaToEdit != nil) {
            self.pessoaToEdit.nome = name
            self.pessoaToEdit.idade = age!
            PessoaDAO().update()
        } else {
            PessoaDAO().add(name: name!, age: age!)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if (self.pessoaToEdit != nil) {
            self.tfName.text = pessoaToEdit.nome
            self.tfAge.text = String(pessoaToEdit.idade)
        }
    }
}


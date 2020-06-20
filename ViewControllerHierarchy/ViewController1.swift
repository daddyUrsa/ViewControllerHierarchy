//
//  ViewController1.swift
//  ViewControllerHierarchy
//
//  Created by Alexey Golovin on 20.06.2020.
//  Copyright © 2020 Alexey Pavlov. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    private let myTextField: UITextField = {
        let myTextField = UITextField()
        myTextField.placeholder = "Enter your text"
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        return myTextField
    }()
    
    private let myButton: UIButton = {
        let myButton = UIButton()
        myButton.setTitle("Press me", for: .normal)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        return myButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
    }
    

}

extension ViewController1 {
    func setupView() {
        view.addSubview(myTextField)
        view.addSubview(myButton)
        
        myTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        myTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

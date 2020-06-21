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
        myTextField.borderStyle = .line
        myTextField.placeholder = "Enter your text"
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        return myTextField
    }()
    
    private let myButton: UIButton = {
        let myButton = UIButton()
        myButton.setTitle("Press me", for: .normal)
        myButton.setTitleColor(.black, for: .normal)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.addTarget(self, action: #selector(tapMyButton), for: .touchUpInside)
        return myButton
    }()


    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupView()
//        let segue = UIStoryboardSegue(identifier: "segueFrom1To3", source: self, destination: ViewController3())
//        self.performSegue(withIdentifier: "segueFrom1To3", sender: self)
    }
    

}

extension ViewController1 {
    func setupView() {
        view.addSubview(myTextField)
        view.addSubview(myButton)
        
        myTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        myTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myButton.topAnchor.constraint(equalTo: myTextField.topAnchor, constant: 30).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }

    @objc func tapMyButton() {
        guard let textForSend = myTextField.text else { return }
        let nextVC = ViewController3()
        nextVC.receivedText = textForSend
        navigationController?.pushViewController(nextVC, animated: true)
    }
}




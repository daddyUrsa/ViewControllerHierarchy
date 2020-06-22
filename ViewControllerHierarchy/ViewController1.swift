//
//  ViewController1.swift
//  ViewControllerHierarchy
//
//  Created by Alexey Golovin on 20.06.2020.
//  Copyright © 2020 Alexey Pavlov. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    private var controllerNameLabel: UILabel = {
        let controllerNameLabel = UILabel()
        controllerNameLabel.text = "ViewController1"
        controllerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return controllerNameLabel
    }()

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
        view.addSubview(controllerNameLabel)
        view.addSubview(myTextField)
        view.addSubview(myButton)

        [controllerNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        controllerNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
        
        myTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        myTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
        myTextField.heightAnchor.constraint(equalToConstant: 30),
        
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        myButton.topAnchor.constraint(equalTo: myTextField.topAnchor, constant: 30),
        myButton.heightAnchor.constraint(equalToConstant: 30)
            ].forEach { $0.isActive = true }
        
    }

    @objc func tapMyButton() {
        guard let textForSend = myTextField.text else { return }
        let nextVC = ViewController3()
        nextVC.receivedText = textForSend
        navigationController?.pushViewController(nextVC, animated: true)
    }
}




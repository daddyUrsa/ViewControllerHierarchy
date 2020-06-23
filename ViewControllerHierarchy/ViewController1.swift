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
    
    private var taskLabel: UILabel = {
        let taskLabel = UILabel()
        taskLabel.font = UIFont.systemFont(ofSize: 12)
        taskLabel.text = "1. Создать TabBarController с двумя вложенными контроллерами (ViewController1 и ViewController2) 2. Для Tab Bar Item вставить кастомные иконки (добавить изображение). Размер изображения для иконок Tab Bar Item 25х25 px. 3. На ViewController1 добавить TextField и Button. 5. Создать программируемый переход (переход в коде) от ViewController1 к ViewController3 с передачей текста в Segue из TextField в Label"
        taskLabel.numberOfLines = 0
        taskLabel.textAlignment = .justified
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        return taskLabel
    }()

    private let myTextField: UITextField = {
        let myTextField = UITextField()
        myTextField.layer.borderWidth = 1
        myTextField.layer.cornerRadius = 5
        myTextField.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.3)
        myTextField.textAlignment = .center
        myTextField.placeholder = "Enter your text"
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        return myTextField
    }()
    
    private let myButton: UIButton = {
        let myButton = UIButton()
        myButton.setTitle("Press me", for: .normal)
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        myButton.layer.cornerRadius = 10
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.addTarget(self, action: #selector(tapMyButton), for: .touchUpInside)
        return myButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupView()
    }
}

extension ViewController1 {
    func setupView() {
        view.addSubview(controllerNameLabel)
        view.addSubview(taskLabel)
        view.addSubview(myTextField)
        view.addSubview(myButton)

        [controllerNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        controllerNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
        
        myTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        myTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
        myTextField.heightAnchor.constraint(equalToConstant: 30),
        myTextField.widthAnchor.constraint(equalToConstant: 250),
        
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        myButton.topAnchor.constraint(equalTo: myTextField.topAnchor, constant: 80),
        myButton.heightAnchor.constraint(equalToConstant: 40),
        myButton.widthAnchor.constraint(equalToConstant: 120),
        
        taskLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        taskLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        taskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        taskLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        taskLabel.heightAnchor.constraint(equalToConstant: 150)
        ].forEach { $0.isActive = true }
    }

    @objc func tapMyButton() {
        guard var textForSend = myTextField.text else { return }
        if textForSend.isEmpty {
            textForSend = "You wrote nothing" }
        let nextVC = ViewController3()
        nextVC.receivedText = textForSend
        navigationController?.pushViewController(nextVC, animated: true)
    }
}




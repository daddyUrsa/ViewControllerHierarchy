//
//  ViewController3.swift
//  ViewControllerHierarchy
//
//  Created by Alexey Golovin on 20.06.2020.
//  Copyright © 2020 Alexey Pavlov. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    var receivedText: String = ""

    let tabBar = UIApplication.shared.keyWindow?.rootViewController as? UITabBarController

    private var controllerNameLabel: UILabel = {
        let controllerNameLabel = UILabel()
        controllerNameLabel.text = "ViewController3"
        controllerNameLabel.textColor = .black
        controllerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return controllerNameLabel
    }()
    
    private var taskLabel: UILabel = {
        let taskLabel = UILabel()
        taskLabel.font = UIFont.systemFont(ofSize: 14)
        taskLabel.text = "4. Создать ViewController3, добавить на него Label и Button. 6. На Button во ViewController3 создать переход - Unwind к ViewController2"
        taskLabel.numberOfLines = 0
        taskLabel.textAlignment = .justified
        taskLabel.textColor = .black
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        return taskLabel
    }()

    var myLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "You wrote: "
        myLabel.textColor = .black
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    private let myButton: UIButton = {
        let myButton = UIButton()
        myButton.setTitle("Go to controller 2", for: .normal)
        myButton.setTitleColor(.black, for: .normal)
        myButton.backgroundColor = UIColor(red: 0.5, green: 0.8, blue: 0, alpha: 0.3)
        myButton.layer.cornerRadius = 10
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.addTarget(self, action: #selector(tapMyButton), for: .touchUpInside)
        return myButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        setupView()

        myLabel.text = receivedText
    }
}

extension ViewController3 {
    func setupView() {
        view.addSubview(controllerNameLabel)
        view.addSubview(myLabel)
        view.addSubview(myButton)
        view.addSubview(taskLabel)
        
        [controllerNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        controllerNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),

        myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        myLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
        myLabel.heightAnchor.constraint(equalToConstant: 30),
        
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        myButton.topAnchor.constraint(equalTo: myLabel.topAnchor, constant: 80),
        myButton.heightAnchor.constraint(equalToConstant: 60),
        myButton.widthAnchor.constraint(equalToConstant: 180),
        
        taskLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        taskLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        taskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        taskLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        taskLabel.heightAnchor.constraint(equalToConstant: 150)
        ]
            .forEach{ $0.isActive = true }
        
    }

    @objc func tapMyButton() {

        navigationController?.popViewController(animated: false)
        tabBar?.selectedIndex = 1
    
//        let nextVC = TabBarController()
//        nextVC.selectedIndex = 1
//        navigationController?.pushViewController(nextVC, animated: true)
    }
}



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

    private var controllerNameLabel: UILabel = {
        let controllerNameLabel = UILabel()
        controllerNameLabel.text = "ViewController3"
        controllerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return controllerNameLabel
    }()

    var myLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "Something"
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    private let myButton: UIButton = {
        let myButton = UIButton()
        myButton.setTitle("Go to controller 2", for: .normal)
        myButton.setTitleColor(.black, for: .normal)
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
        
        [controllerNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        controllerNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),

        myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        myLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
        myLabel.heightAnchor.constraint(equalToConstant: 30),
        
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        myButton.topAnchor.constraint(equalTo: myLabel.topAnchor, constant: 30),
        myButton.heightAnchor.constraint(equalToConstant: 60)
        ]
            .forEach{ $0.isActive = true }
        
    }

    @objc func tapMyButton() {
        let nextVC2 = ViewController2()
        present(nextVC2, animated: true, completion: nil)
    }
}



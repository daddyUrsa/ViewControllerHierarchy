//
//  ViewController4.swift
//  ViewControllerHierarchy
//
//  Created by Alexey Golovin on 22.06.2020.
//  Copyright © 2020 Alexey Pavlov. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    private var controllerNameLabel: UILabel = {
        let controllerNameLabel = UILabel()
        controllerNameLabel.text = "ViewController4"
        controllerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return controllerNameLabel
    }()

    private let backToPreviousView: UIButton = {
        let backToPreviousView = UIButton()
        backToPreviousView.setTitle("Go back", for: .normal)
        backToPreviousView.setTitleColor(.black, for: .normal)
        backToPreviousView.translatesAutoresizingMaskIntoConstraints = false
        backToPreviousView.addTarget(self, action: #selector(loadPreviousView), for: .touchUpInside)
        return backToPreviousView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        setupView()
    }
}

extension ViewController4 {
    func setupView() {
        view.addSubview(controllerNameLabel)
        view.addSubview(backToPreviousView)

        [controllerNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        controllerNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),

        backToPreviousView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        backToPreviousView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        backToPreviousView.heightAnchor.constraint(equalToConstant: 30),
        backToPreviousView.widthAnchor.constraint(equalToConstant: 100)
        ].forEach{ $0.isActive = true }
    }

    @objc func loadPreviousView() {
        dismiss(animated: true, completion: nil)
        print("Back")
    }
}

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
    
    private var taskLabel: UILabel = {
        let taskLabel = UILabel()
        taskLabel.font = UIFont.systemFont(ofSize: 14)
        taskLabel.text = "7. Создать ViewController4 из xib файла, добавить на него Button с методом возврата к предыдущему контроллеру."
        taskLabel.numberOfLines = 0
        taskLabel.textAlignment = .justified
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        return taskLabel
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
        view.addSubview(taskLabel)

        [controllerNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        controllerNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),

        backToPreviousView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        backToPreviousView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        backToPreviousView.heightAnchor.constraint(equalToConstant: 30),
        backToPreviousView.widthAnchor.constraint(equalToConstant: 100),
        
        taskLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        taskLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        taskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        taskLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        taskLabel.heightAnchor.constraint(equalToConstant: 150)
        ].forEach{ $0.isActive = true }
    }

    @objc func loadPreviousView() {
        dismiss(animated: true, completion: nil)
//        print("Back")
    }
}

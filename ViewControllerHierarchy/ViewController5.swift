//
//  ViewController5.swift
//  ViewControllerHierarchy
//
//  Created by Alexey Golovin on 22.06.2020.
//  Copyright © 2020 Alexey Pavlov. All rights reserved.
//

import UIKit

class ViewController5: UIViewController {

    private var controllerNameLabel: UILabel = {
        let controllerNameLabel = UILabel()
        controllerNameLabel.text = "ViewController5"
        controllerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return controllerNameLabel
    }()
    
    private var taskLabel: UILabel = {
        let taskLabel = UILabel()
        taskLabel.font = UIFont.systemFont(ofSize: 14)
        taskLabel.text = "9. Создать ViewController5, который будет добавляться в качестве дочернего вью контроллера. Добавить на него Button, при нажатии убирающий данный вью контроллер из родительского (метод removeFromParentViewController())."
        taskLabel.numberOfLines = 0
        taskLabel.textAlignment = .justified
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        return taskLabel
    }()

    private let removeFromParentBtn: UIButton = {
        let removeFromParentBtn = UIButton()
        removeFromParentBtn.setTitle("Go back", for: .normal)
        removeFromParentBtn.setTitleColor(.black, for: .normal)
        removeFromParentBtn.translatesAutoresizingMaskIntoConstraints = false
        removeFromParentBtn.addTarget(self, action: #selector(removeFromParentBtnTapped), for: .touchUpInside)
        return removeFromParentBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange

        setupView()
    }
}

extension ViewController5 {
    func setupView() {
        view.addSubview(controllerNameLabel)
        view.addSubview(removeFromParentBtn)
        view.addSubview(taskLabel)

        [controllerNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        controllerNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),

        removeFromParentBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        removeFromParentBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        removeFromParentBtn.heightAnchor.constraint(equalToConstant: 30),
        removeFromParentBtn.widthAnchor.constraint(equalToConstant: 100),
        
        taskLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        taskLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        taskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        taskLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        taskLabel.heightAnchor.constraint(equalToConstant: 150)
        ].forEach{ $0.isActive = true }
    }

    @objc func removeFromParentBtnTapped() {
        removeChild()
    }

    func removeChild() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

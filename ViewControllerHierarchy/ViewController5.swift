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

        [controllerNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        controllerNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),

        removeFromParentBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        removeFromParentBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        removeFromParentBtn.heightAnchor.constraint(equalToConstant: 30),
        removeFromParentBtn.widthAnchor.constraint(equalToConstant: 100)
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

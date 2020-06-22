//
//  ViewController2.swift
//  ViewControllerHierarchy
//
//  Created by Alexey Golovin on 20.06.2020.
//  Copyright © 2020 Alexey Pavlov. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    private var controllerNameLabel: UILabel = {
        let controllerNameLabel = UILabel()
        controllerNameLabel.text = "ViewController2"
        controllerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return controllerNameLabel
    }()

    private let showVC4Button: UIButton = {
        let showVC4Button = UIButton()
        showVC4Button.setTitle("Move to 4", for: .normal)
        showVC4Button.setTitleColor(.black, for: .normal)
        showVC4Button.layer.borderWidth = 1
        showVC4Button.layer.cornerRadius = 10
        showVC4Button.translatesAutoresizingMaskIntoConstraints = false
        showVC4Button.addTarget(self, action: #selector(moveToVC4), for: .touchUpInside)
        return showVC4Button
    }()
    
    private let showVC5Button: UIButton = {
        let showVC5Button = UIButton()
        showVC5Button.setTitle("Move 5", for: .normal)
        showVC5Button.setTitleColor(.black, for: .normal)
        showVC5Button.layer.borderWidth = 1
        showVC5Button.layer.cornerRadius = 10
        showVC5Button.translatesAutoresizingMaskIntoConstraints = false
        showVC5Button.addTarget(self, action: #selector(moveToVC5), for: .touchUpInside)
        return showVC5Button
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        setupViews()
    }
}

extension ViewController2 {
    
    func setupViews() {
        let spaces: CGFloat = 16.0
        view.addSubview(controllerNameLabel)
        view.addSubview(showVC4Button)
        view.addSubview(showVC5Button)
        
        [controllerNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        controllerNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),

        showVC4Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spaces),
        showVC4Button.heightAnchor.constraint(equalToConstant: 50),
        showVC4Button.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - spaces * 3),
        showVC4Button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        
        showVC5Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: spaces * -1 ),
        showVC5Button.heightAnchor.constraint(equalToConstant: 50),
        showVC5Button.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - spaces * 3),
        showVC5Button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ].forEach { $0.isActive = true }
    }
    
    @objc func moveToVC4() {
        let nextVC4 = ViewController4()
        present(nextVC4, animated: true, completion: nil)
    }
    
    @objc func moveToVC5() {
        let nextVC5 = ViewController5()
        addChild(nextVC5)
        view.addSubview(nextVC5.view)
        nextVC5.didMove(toParent: self)
    }
}

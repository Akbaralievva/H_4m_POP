//
//  ViewController.swift
//  Home_4month_POP
//
//  Created by A LINA on 3/3/24.
//

import UIKit

class MainViewController: UIViewController {
    
    static var balance: Int = 10000
    
    private lazy var firstButton: UIButton = MakerView.shared.makeBTN(title: "Get Started",
                                                                      backgroundColorBT: .systemPurple,
                                                                      layerCornerBT: 25)
    
    private lazy var secondButton: UIButton = MakerView.shared.makeBTN(title: "Get Started",
                                                                       backgroundColorBT: .systemPurple,
                                                                       layerCornerBT: 25)
    
    private lazy var thirdButton: UIButton = MakerView.shared.makeBTN(title: "Get Started",
                                                                      backgroundColorBT: .systemPurple,
                                                                      layerCornerBT: 25)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        setUp()
    }
    
    private func setUp(){
        
        view.addSubview(firstButton)
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            firstButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            firstButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            firstButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        firstButton.addTarget(self, action: #selector(firstBtnTapped), for: .touchUpInside)
        
        
        view.addSubview(secondButton)
        NSLayoutConstraint.activate([
            secondButton.topAnchor.constraint(equalTo: firstButton.topAnchor, constant: 200),
            secondButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            secondButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            secondButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        secondButton.addTarget(self, action: #selector(secondBtnTapped), for: .touchUpInside)
        
        
        view.addSubview(thirdButton)
        NSLayoutConstraint.activate([
            thirdButton.topAnchor.constraint(equalTo: secondButton.topAnchor, constant: 200),
            thirdButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            thirdButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            thirdButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        thirdButton.addTarget(self, action: #selector(thirdBtnTapped), for: .touchUpInside)
    }
    
    
    @objc func firstBtnTapped(){
        let vc = FirstViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func secondBtnTapped(){
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func thirdBtnTapped(){
        let vc = ThirdViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


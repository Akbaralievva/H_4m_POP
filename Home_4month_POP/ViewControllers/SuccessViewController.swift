//
//  SuccessViewController.swift
//  Home_4month_POP
//
//  Created by A LINA on 4/3/24.
//

import UIKit

class SuccessViewController: UIViewController {
    
    private lazy var  ic_success: UIImageView = MakerView.shared.makeImage(image: "icone_success")
    
    private lazy var successLbl: UILabel = MakerView.shared.makeLbl(text: "Перевод успешно выполнен!", textColor: .white, textSize: 20, ofSize: UIFont.Weight.bold)
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal
        
        setUp()
    }
    
    private  func setUp(){
        
        view.addSubview(ic_success)
        view.addSubview(successLbl)
        NSLayoutConstraint.activate([
            ic_success.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            ic_success.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            ic_success.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            ic_success.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5),
            ic_success.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            successLbl.topAnchor.constraint(equalTo: ic_success.topAnchor,constant: 200),
            successLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            successLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ])
        
    }
}

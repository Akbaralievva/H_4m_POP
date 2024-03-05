//
//  FirstViewController.swift
//  Home_4month_POP
//
//  Created by A LINA on 3/3/24.
//

import UIKit

class FirstViewController: UIViewController, CardNumberChecker {
    
    private lazy var balanceView: UIView = MakerView.shared.makeUIView(layerCorneradius: 16,
                                                                       backgroundColor: .white)
    
    private lazy var icone_wallet: UIImageView = MakerView.shared.makeImage(image: "icone_wallet")
    
    private lazy var cardNumberLabel: UILabel = MakerView.shared.makeLbl(text: "118***** *** *** ****",
                                                                         textColor: .black,
                                                                         textSize: 13,
                                                                         ofSize: .medium)
    
    private lazy var balanceInfoLbl: UILabel = MakerView.shared.makeLbl(text: "Balance: 100000000",
                                                                        textColor: .black,
                                                                        textSize: 18,
                                                                        ofSize: .medium)
    
    private lazy var cardView: UIView = MakerView.shared.makeUIView(layerCorneradius: 16,
                                                                    backgroundColor: .white)
    
    private lazy var cardBtn: UIButton = {
        var configuration = UIButton.Configuration.plain()
        if let image = UIImage(systemName: "creditcard")?.withRenderingMode(.alwaysTemplate) {
            configuration.image = image
        }
        configuration.baseForegroundColor = .black
        let view = UIButton(configuration: configuration)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cardNumTF: UITextField = MakerView.shared.makeTF(placeholder: "7482 **** enter a card number",
                                                                      borderColor: UIColor.white.cgColor,
                                                                      backgroundColor: .white)
    
    
    private lazy var transferBtn: UIButton = {
        let but = UIButton(type: .system)
        but.setTitle("Перевод", for: .normal)
        but.tintColor = .white
        but.backgroundColor = .systemGray
        but.layer.cornerRadius = 16
        but.titleLabel?.textAlignment = .center
        but.translatesAutoresizingMaskIntoConstraints = false
        return but
    }()
    
    private lazy var enterMoneyView: UIView = MakerView.shared.makeUIView(layerCorneradius: 20,
                                                                          backgroundColor: .white)
    
    private lazy var enterMoneyTF: UITextField = MakerView.shared.makeTF(placeholder: "0 C",
                                                                         borderColor: UIColor.white.cgColor,
                                                                         backgroundColor: .white,
                                                                         alignment: .center)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBtnImage = UIImage(systemName: "chevron.left")
        let backBtn = UIBarButtonItem(image: backBtnImage, style: .plain, target: self, action: #selector(backBtnTapped))
        navigationItem.leftBarButtonItem = backBtn
        
        view.backgroundColor = .systemTeal
    
        setupUI()
    }
    
    
    private func setupUI() {
        
        view.addSubview(balanceView)
        balanceView.addSubview(icone_wallet)
        balanceView.addSubview(balanceInfoLbl)
        
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            balanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            balanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            balanceView.heightAnchor.constraint(equalToConstant: 60),
            
            icone_wallet.topAnchor.constraint(equalTo: balanceView.topAnchor,constant: 15),
            icone_wallet.leadingAnchor.constraint(equalTo: balanceView.leadingAnchor, constant: 20),
            icone_wallet.heightAnchor.constraint(equalToConstant: 35),
            icone_wallet.widthAnchor.constraint(equalToConstant: 35),
            
            balanceInfoLbl.topAnchor.constraint(equalTo: balanceView.topAnchor, constant: 20),
            balanceInfoLbl.leadingAnchor.constraint(equalTo: icone_wallet.leadingAnchor, constant: 40)
        ])
        
        
        view.addSubview(cardView)
        cardView.addSubview(cardBtn)
        cardView.addSubview(cardNumTF)
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: balanceView.topAnchor, constant: 100),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cardView.heightAnchor.constraint(equalToConstant: 60),
            
            cardBtn.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15),
            cardBtn.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            cardBtn.heightAnchor.constraint(equalToConstant: 20),
            cardBtn.widthAnchor.constraint(equalToConstant: 20),
            
            cardNumTF.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 5),
            cardNumTF.leadingAnchor.constraint(equalTo: cardBtn.leadingAnchor, constant: 30),
            cardNumTF.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            cardNumTF.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        view.addSubview(enterMoneyView)
        enterMoneyView.addSubview(enterMoneyTF)
        
        NSLayoutConstraint.activate([
            enterMoneyView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 120),
            enterMoneyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            enterMoneyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            enterMoneyView.heightAnchor.constraint(equalToConstant: 80),
            
            enterMoneyTF.topAnchor.constraint(equalTo: enterMoneyView.topAnchor, constant: 20),
            enterMoneyTF.centerXAnchor.constraint(equalTo: enterMoneyView.centerXAnchor),
            enterMoneyTF.widthAnchor.constraint(equalToConstant: 100),
            enterMoneyTF.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        view.addSubview(transferBtn)
        NSLayoutConstraint.activate([
            transferBtn.topAnchor.constraint(equalTo: enterMoneyView.topAnchor, constant: 120 ),
            transferBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            transferBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            transferBtn.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        cardNumTF.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        enterMoneyTF.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        transferBtn.addTarget(self, action: #selector(transferBtnTapped), for: .touchUpInside)
        
    }
    
    @objc func backBtnTapped() {
        for controller in navigationController?.viewControllers ?? [] {
            if let vc = controller as? MainViewController {
                navigationController?.popToViewController(vc, animated: true)
                break
            }
        }
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        updateTransferButtonState(cardNumber: cardNumTF.text, enteredMoney: enterMoneyTF.text, transferButton: transferBtn)
        
    }
    
    @objc func transferBtnTapped(_ sender: UIButton) {
        
        transferButtonTapped(amountText: enterMoneyTF.text, cardNumber: cardNumTF.text, transferButton: transferBtn, navigationController: navigationController)
        
    }
}

//
//  CardNumberChecker.swift
//  Home_4month_POP
//
//  Created by A LINA on 4/3/24.
//

import UIKit

protocol CardNumberChecker {
    
    func updateTransferButtonState(cardNumber: String?, enteredMoney: String?, transferButton: UIButton)
    
    func transferButtonTapped(amountText: String?, cardNumber: String?, transferButton: UIButton, navigationController: UINavigationController?)
}

extension CardNumberChecker {
    func validateText(_ amount: String?) -> Bool {
        guard let cardNumber = amount else {
            return false
        }
        let strippedCardNumber = cardNumber.replacingOccurrences(of: " ", with: "")
        
        guard strippedCardNumber.count == 16 else {
            return false
        }
        
        guard strippedCardNumber.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil else {
            return false
        }
        
        return true
    }
    
    func updateTransferButtonState(cardNumber: String?, enteredMoney: String?, transferButton: UIButton) {
        let isCardNumberValid = self.validateText(cardNumber)
        let isMoneyValid = enteredMoney?.count ?? 0 >= 2
        let isEnabled = isCardNumberValid && isMoneyValid
        
        transferButton.isEnabled = isEnabled
        transferButton.backgroundColor = isEnabled ? .systemBlue : .systemGray3
    }
    
    func transferButtonTapped(amountText: String?, cardNumber: String?, transferButton: UIButton, navigationController: UINavigationController?) {
        guard let amountText = amountText,
              let moneyValue = Int(amountText),
              moneyValue >= 20 else {
            transferButton.isEnabled = true
            transferButton.backgroundColor = .systemBlue
            return
        }
        
        let isCardNumberValid = self.validateText(cardNumber)
        
        if isCardNumberValid && moneyValue <= MainViewController.balance {
            transferButton.isEnabled = true
            transferButton.backgroundColor = .systemBlue
            
            let vc = SuccessViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            transferButton.isEnabled = false
            transferButton.backgroundColor = .systemGray3
        }
    }
}




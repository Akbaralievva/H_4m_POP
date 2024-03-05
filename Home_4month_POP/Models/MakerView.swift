//
//  MakerView.swift
//  Home_4month_POP
//
//  Created by A LINA on 3/3/24.
//

import UIKit

final class MakerView {
    
    static let shared = MakerView()
    
    
    func makeUIView(layerCorneradius: CGFloat? = nil,
                    backgroundColor: UIColor = .white) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        if let cornerRadius = layerCorneradius {
            view.layer.cornerRadius = cornerRadius
        }
        return view
    }
    
    func makeImage(image: String? = nil) -> UIImageView {
        let img = UIImageView()
        img.image = UIImage(named: image!)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }
    
    func makeBTN(title: String = "",
                 ofSize: UIFont.Weight = .medium,
                 for state: UIControl.State = .normal,
                 colorBtn: UIColor = .white,
                 backgroundColorBT: UIColor? = nil,
                 layerCornerBT: CGFloat = 28) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: state)
        button.tintColor = colorBtn
        button.backgroundColor = backgroundColorBT
        button.layer.cornerRadius = layerCornerBT
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    
    
    func makeLbl(text: String = "",
                 textColor: UIColor = .black,
                 textSize: CGFloat = 14, ofSize: UIFont.Weight = .medium,
                 numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = .systemFont(ofSize: textSize, weight: ofSize)
        label.numberOfLines = numberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func makeTF(placeholder: String = "Enter Something",
                keyboardType: UIKeyboardType = .asciiCapableNumberPad,
                leftViewMode: UITextField.ViewMode = .always,
                cornerRadius: CGFloat = 16,
                borderColor: CGColor = UIColor.black.cgColor,
                borderWidth: CGFloat = 1,
                backgroundColor: UIColor = .white,
                alignment: NSTextAlignment? = nil) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.keyboardType = keyboardType
        textField.backgroundColor = backgroundColor
        if let alignment = alignment {
            textField.textAlignment = alignment
        }
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 5))
        textField.leftView = view
        textField.leftViewMode = leftViewMode
        textField.layer.cornerRadius = cornerRadius
        textField.layer.borderColor = borderColor
        textField.layer.borderWidth = borderWidth
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField    }
    
}


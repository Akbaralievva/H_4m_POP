//
//  MakerView.swift
//  Home_4month_POP
//
//  Created by A LINA on 5/3/24.
//

import UIKit

class MakerView {
    
    static let shared = MakerView()
    
    func makeBTN(title: String = "",
                 for state: UIControl.State = .normal,
                 colorBT: UIColor = .blue,
                 backgroundColorBT: UIColor? = nil,
                 layerCornerBT: CGFloat = 28) -> UIButton {
        let bt = UIButton(type: .system)
        bt.setTitle(title, for: state)
        bt.tintColor = colorBT
        bt.backgroundColor = backgroundColorBT
        bt.layer.cornerRadius = layerCornerBT
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }
    
   
    
    func makeLbl(text: String = "",
                 textColor: UIColor = .black,
                 textSize: CGFloat = 14, ofSize: UIFont.Weight = .light,
                 numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = .systemFont(ofSize: textSize, weight: ofSize)
        label.numberOfLines = numberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
   
    
    func makeTF(placeholder: String = "Напишите что то",
                keyboardType: UIKeyboardType = .default,
                leftViewMode: UITextField.ViewMode = .always,
                cornerRadius: CGFloat = 16,
                borderColor: CGColor = UIColor.black.cgColor,
                borderWidth: CGFloat = 1,
                backgroundColor: UIColor = .white,
                alignment: NSTextAlignment? = nil) -> UITextField {
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.keyboardType = keyboardType
        tf.backgroundColor = backgroundColor
        if let alignment = alignment {
            tf.textAlignment = alignment
        }
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 5))
        tf.leftView = view
        tf.leftViewMode = leftViewMode
        tf.layer.cornerRadius = cornerRadius
        tf.layer.borderColor = borderColor
        tf.layer.borderWidth = borderWidth
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }
    
}


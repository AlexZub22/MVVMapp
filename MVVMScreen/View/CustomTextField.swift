//
//  CustomTextField.swift
//  MVVMScreen
//
//  Created by Alexander Zub on 30.09.2022.
//

import UIKit

class CustomTextField: UIView {

    enum FieldType {
        case name
        case age
    }
    
    let label = UILabel(text: "", font: FontsLibrary.cellText)
    let textField = UITextField(placeholder: "")
    let type: FieldType
    
    init(type: FieldType) {
        self.type = type
        super.init(frame: CGRect())
        setViews()
        setConstraints()
        
    }
    
    
    
    func setViews() {
        switch type {
            
        case .name:
            label.text = "Имя"
            textField.placeholder = "Введите имя:"
        case .age:
            label.text = "Возраст"
            textField.placeholder = "Введите возраст:"
            textField.keyboardType = .numberPad
        }
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 0)
        textField.borderStyle = .none
        textField.backgroundColor = .clear
    }
    
    func setConstraints() {
        
        let stack = UIStackView(views: [label, textField], axis: .vertical, spacing: 4)
        
        addSubview(stack)
        Helper.tamicOff(views: [stack])
        
        NSLayoutConstraint.activate([stack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 4),
                                     stack.topAnchor.constraint(equalTo: topAnchor,constant: 2),
                                     stack.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     stack.centerYAnchor.constraint(equalTo: centerYAnchor)
                                    ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

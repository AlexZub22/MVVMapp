//
//  TwoFieldsView.swift
//  MVVMScreen
//
//  Created by Alexander Zub on 30.09.2022.
//

import UIKit

class TwoFieldsView: UIView {

    let nameField = CustomTextField(type: .name)
    let ageField = CustomTextField(type: .age)
    
    init() {
        super.init(frame: CGRect())
        let stack = UIStackView(views: [nameField, ageField], axis: .vertical, spacing: 16)
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([stack.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     stack.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     stack.topAnchor.constraint(equalTo: topAnchor),
                                     stack.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     nameField.heightAnchor.constraint(equalTo: ageField.heightAnchor)
                                    ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

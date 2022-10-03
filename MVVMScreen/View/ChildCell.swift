//
//  ChildCell.swift
//  MVVMScreen
//
//  Created by Alexander Zub on 30.09.2022.
//

import UIKit


class ChildCell: UITableViewCell {

    static let reuseId = "ChildCell"
    let twoFieldsView = TwoFieldsView()
    let deleteButton = DeleteButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let stack = UIStackView(views: [twoFieldsView, deleteButton], axis: .horizontal, spacing: 12)
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false // TamicOff
        NSLayoutConstraint.activate([stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
                                     stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
                                     stack.topAnchor.constraint(equalTo: topAnchor, constant: 4),
                                     stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
                                    ])
        NSLayoutConstraint.activate([deleteButton.heightAnchor.constraint(equalTo: twoFieldsView.heightAnchor),
                                     deleteButton.widthAnchor.constraint(equalToConstant: 100)
                                    ])
    }
        
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

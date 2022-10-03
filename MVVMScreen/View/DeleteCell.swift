//
//  DeleteCell.swift
//  MVVMScreen
//
//  Created by Alexander Zub on 30.09.2022.
//

import UIKit

class DeleteCell: UITableViewCell {

    static let reuseId = "DeleteCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let label = UILabel(text: "Очистить таблицу", font: FontsLibrary.fieldButton)
        Helper.addSub(views: [label], to: self)
        Helper.tamicOff(views: [label])
        NSLayoutConstraint.activate([label.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     label.centerYAnchor.constraint(equalTo: centerYAnchor),
                                    ])
        self.layer.borderColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 14
        label.textColor = .systemRed
       // backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

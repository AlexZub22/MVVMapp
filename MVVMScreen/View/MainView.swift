//
//  MainView.swift
//  MVVMScreen
//
//  Created by Alexander Zub on 30.09.2022.
//

import UIKit

class MainView: UIView {
    
    let personalDataLabel = UILabel(text: "Персональные данные", font: FontsLibrary.smallTitle)
    let kidsLabel = UILabel(text: "Дети (макс. 5)", font: FontsLibrary.fieldButton)
    let button = UIButton(title: "Добавить ребенка", bgColor: .clear, textColor: ColorsLibrary.blueButton, font: FontsLibrary.fieldButton)
    
    let twoFields = TwoFieldsView()
    let tableView = UITableView()
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .white
        setViews()
        setConstraints()
    }
    
    func setViews() {
        button.layer.borderColor = ColorsLibrary.blueButton.cgColor
        button.layer.borderWidth = 2
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.layer.cornerRadius = 27
        tableView.register(ChildCell.self, forCellReuseIdentifier: ChildCell.reuseId)
        tableView.register(DeleteCell.self, forCellReuseIdentifier: DeleteCell.reuseId)
    }
    
    func setConstraints() {
        let kidsStack = UIStackView(views: [kidsLabel, button], axis: .horizontal, spacing: 8)
        let stack = UIStackView(views: [personalDataLabel, twoFields, kidsStack, tableView], axis: .vertical, spacing: 8)
        addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false //TamicOff
        
        NSLayoutConstraint.activate([stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                                     stack.topAnchor.constraint(equalTo: topAnchor, constant: 48),
                                     stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                                     stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
                                     twoFields.heightAnchor.constraint(equalToConstant: 140),
                                     button.heightAnchor.constraint(equalToConstant: 54)
                                    ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

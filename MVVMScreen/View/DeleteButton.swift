//
//  DeleteButton.swift
//  MVVMScreen
//
//  Created by Alexander Zub on 30.09.2022.
//

import UIKit

class DeleteButton: UIButton {

    var indexPath: IndexPath?
    
    init() {
        super.init(frame: CGRect())
        setTitle("Удалить", for: .normal)
        backgroundColor = .systemRed
        tintColor = ColorsLibrary.blueButton
        titleLabel?.font = FontsLibrary.fieldButton
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

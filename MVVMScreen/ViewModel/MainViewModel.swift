//
//  MainViewModel.swift
//  MVVMScreen
//
//  Created by Alexander Zub on 30.09.2022.
//

import Foundation
import UIKit

class MainViewModel {
    
    var children = [Person]()
    
    func addChild(name: String, age: Int) {
        let person = Person(name: name, age: age)
        self.children.append(person)
    }
    
    func getCount() -> Int {
        return children.count
    }
    
    func removeAllChildren() {
        self.children.removeAll()
    }
    
    func removeChild(index: Int) {
        self.children.remove(at: index)
    }
    
    func childCellGenerate(tableView: UITableView, indexPath: IndexPath) -> ChildCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChildCell.reuseId, for: indexPath) as! ChildCell
        cell.twoFieldsView.ageField.textField.text = "\(children[indexPath.row].age)"
        cell.twoFieldsView.nameField.textField.text = children[indexPath.row].name
        cell.deleteButton.indexPath = indexPath
       // cell.deleteButton.addTarget(self, action: #selector(ViewController.deleteChild), for: .touchUpInside)
        cell.isUserInteractionEnabled = true
        cell.deleteButton.isUserInteractionEnabled = true
        cell.selectionStyle = .none
        
        return cell
    }
    
}

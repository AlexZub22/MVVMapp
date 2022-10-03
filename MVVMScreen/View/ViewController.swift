//
//  ViewController.swift
//  MVVMScreen
//
//  Created by Alexander Zub on 30.09.2022.
//

import UIKit


class ViewController: UIViewController {

    let mainView = MainView()
    let viewModel = MainViewModel()
    let deleteButton = DeleteButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = mainView
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        addTargets()
    }
    
    func addTargets() {
        mainView.button.addTarget(self, action: #selector(addNewChild), for: .touchUpInside)
    }
   
    @objc func addNewChild() {
        let name = mainView.twoFields.nameField.textField.text!
        let age = Int(mainView.twoFields.ageField.textField.text!)!
        viewModel.addChild(name: name, age: age)
        mainView.tableView.reloadData()
    }
    
    
    @objc func deleteChild(sender: DeleteButton) {
        self.viewModel.removeChild(index: sender.indexPath!.row)
        self.mainView.tableView.reloadData()
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return viewModel.getCount()
        case 1: return 1
        default: return 0
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellModel = viewModel.childCellGenerate(tableView: tableView, indexPath: indexPath)
            cellModel.contentView.isUserInteractionEnabled = false
            cellModel.deleteButton.addTarget(self, action: #selector(deleteChild(sender:)), for: .touchUpInside)
            return cellModel
        default:
            let cellModel = tableView.dequeueReusableCell(withIdentifier: DeleteCell.reuseId, for: indexPath)
            return cellModel
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            viewModel.removeAllChildren()
            tableView.reloadData()
        default: break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 130
        default: return 40
        }
    }

}

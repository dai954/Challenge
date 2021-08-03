//
//  DropDownTableView.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/23.
//

import UIKit

class DropDownTableView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    let cellId1 = "cellId1"
    let cellId2 = "cellId2"
    let cellId3 = "cellId3"
    let cellId4 = "cellId4"
    let cellId5 = "cellId5"
    
    let tableView = UITableView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.isScrollEnabled = false
        tableView.separatorInset = .zero
        
        addSubview(tableView)
        
        tableView.fillSuperview()
        
        tableView.register(CustomCellForTextField.self, forCellReuseIdentifier: cellId1)
        tableView.register(CustomCellForCategory.self, forCellReuseIdentifier: cellId2)
        tableView.register(CustomCellForBiggerSegmented.self, forCellReuseIdentifier: cellId3)
        tableView.register(CustomCellForSmallerSegmented.self, forCellReuseIdentifier: cellId4)
        tableView.register(CustomCellForSearchButton.self, forCellReuseIdentifier: cellId5)
        
        
        // タップ認識するためのインスタンスを生成
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        tableView.addGestureRecognizer(tapGesture)
        
        tapGesture.cancelsTouchesInView = false
    }
    
    @objc public func dismissKeyboard() {
        tableView.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
        print("touched")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            cell = self.tableView.dequeueReusableCell(withIdentifier: cellId1, for: indexPath) as! CustomCellForTextField
        case 1:
            cell = self.tableView.dequeueReusableCell(withIdentifier: cellId2, for: indexPath) as! CustomCellForCategory
        case 2:
            cell = self.tableView.dequeueReusableCell(withIdentifier: cellId3, for: indexPath) as! CustomCellForBiggerSegmented
        case 3:
            cell = self.tableView.dequeueReusableCell(withIdentifier: cellId4, for: indexPath) as! CustomCellForSmallerSegmented
        default:
            cell = self.tableView.dequeueReusableCell(withIdentifier: cellId5, for: indexPath) as! CustomCellForSearchButton
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath", indexPath)
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}

//
//  TagSearchController.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/15.
//

import UIKit

class TagSearchController: UIViewController, UISearchBarDelegate {
    
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9410743117, green: 0.9412353635, blue: 0.9410640597, alpha: 1)
        
        navigationItem.titleView = searchBar
        searchBar.textField?.backgroundColor = .white
        searchBar.tintColor = .lightGray
        
        searchBar.placeholder = "キーワードを入力してください"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        searchBar.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touched")
        searchBar.textField?.endEditing(true)
    }
}

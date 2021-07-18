//
//  BaseSearchCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/14.
//

import UIKit

class BaseSearchCell: UITableViewCell {
    
    let searchController = CategorySearchController()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .red
        
        addSubview(searchController.view)
        
        searchController.view.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

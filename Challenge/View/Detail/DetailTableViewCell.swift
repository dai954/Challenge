//
//  DetailTableViewCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/29.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let sharedCellPlus = SharedCellPlus()
        addSubview(sharedCellPlus)
        sharedCellPlus.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

//
//  BaseListController.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/14.
//

import UIKit

class BaseListController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

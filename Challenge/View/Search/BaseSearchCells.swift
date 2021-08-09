//
//  BaseSearchCells.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/08/07.
//

import UIKit

class SearchFirstCell: UICollectionViewCell {
    let categorySearchController = CategorySearchController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(categorySearchController.view)
        categorySearchController.view.fillSuperview(padding: .init(top: 10, left: 10, bottom: 0, right: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SearchSecondCell: UICollectionViewCell {
    let favoriteButton: UIButton = {
       let button = UIButton()
        button.setTitle("お気に入り", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.setImage(#imageLiteral(resourceName: "star"), for: .normal)
        button.titleEdgeInsets = .init(top: 0, left: 12, bottom: 0, right: 0)
        button.layer.cornerRadius = 6
        return button
    }()
   
    let numberOfFavorite = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        favoriteButton.setTitle("お気に入り\(numberOfFavorite)チーム", for: .normal)
        
        addSubview(favoriteButton)
        favoriteButton.fillSuperview(padding: .init(top: 0, left: 10, bottom: 0, right: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class SearchThirdCell: UICollectionViewCell {
    
    let officialAppController = OfficialAppController()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "公式チャレンジ"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 32
        clipsToBounds = true
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 24, left: 0, bottom: 0, right: 0))
        addSubview(officialAppController.view)
        officialAppController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 20, right: 10))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

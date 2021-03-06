//
//  FavoriteRegisterCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/30.
//

import UIKit

class FavoriteRegisterCell: UICollectionViewCell {
    
    let topBorder = UIView(color: .lightGray)
    let favoriteLabel = UILabel(text: "現在0人がお気に入りしています", font: .systemFont(ofSize: 14))
    let favoriteButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
        button.setTitle("お気に入りに登録する", for: .normal)
        button.tintColor = .white
        let image = UIImage(systemName: "star")
        button.setImage(image, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(topBorder)
        addSubview(favoriteLabel)
        addSubview(favoriteButton)
        
        topBorder.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 0.3))
        favoriteLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 20, bottom: 0, right: 0))
        favoriteButton.anchor(top: favoriteLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 20, bottom: 10, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

//
//  OfficialAppCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/15.
//

import UIKit

class OfficialAppCell: UICollectionViewCell {
    
    let appImage: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .purple
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let appLabel: UILabel = {
        let label = UILabel()
        label.text = "アプリ名 \n みんちゃれ"
        label.font = .systemFont(ofSize: 8)
        label.numberOfLines = 2
        return label
    }()
    
//    let checkImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = .init(systemName: "checkmark")
//        imageView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
//        imageView.layer.cornerRadius = 2
//        return imageView
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .yellow
//        appImage.addSubview(checkImage)
//        checkImage.anchor(top: nil, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, size: .init(width: 6, height: 6))
        appImage.widthAnchor.constraint(equalToConstant: 48).isActive = true
        appImage.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        appLabel.textAlignment = .center
        let verticalStackView = UIStackView(arrangedSubviews: [
        UIView(),appImage, appLabel, UIView()
        ])
        verticalStackView.alignment = .center
        verticalStackView.spacing = 10
        
        verticalStackView.axis = .vertical
        
        addSubview(verticalStackView)
        verticalStackView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

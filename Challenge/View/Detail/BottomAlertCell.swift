//
//  BottomAlertCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/30.
//

import UIKit

class BottomAlertCell: UICollectionViewCell {
    
    let topBorder = UIView(color: .lightGray)
    
    let alertButton: UIButton = {
        let button = UIButton()
        button.setTitle("このチームを通報する", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        let image = UIImage(systemName: "exclamationmark.bubble")
        button.setImage(image, for: .normal)
        button.tintColor = .lightGray
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 8
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        backgroundColor = .white

        addSubview(topBorder)
        addSubview(alertButton)
        topBorder.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 0.3))
        alertButton.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 20, bottom: 0, right: 20), size: .init(width: 150, height: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

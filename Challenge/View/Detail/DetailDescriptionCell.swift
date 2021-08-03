//
//  DetailDescriptionCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/29.
//

import UIKit

class DetailDescriptionCell: UICollectionViewCell {
    
    let topBorder = UIView(color: .lightGray)
    let descriptionLabel = UILabel(text: "body ------------ body _____//// \n bodyNNNNbody ------------ body _____//// \n bodyNNNNbody ------------ body _____//// \n bodyNNNNbody ------------ body _____//// \n bodyNNNN", font: .systemFont(ofSize: 14), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(topBorder)
        addSubview(descriptionLabel)
        
        
        topBorder.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 0.3))
//        descriptionLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 4, left: 16, bottom: 4, right: 16))
        descriptionLabel.fillSuperview(padding: .init(top: 4, left: 16, bottom: 4, right: 4))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

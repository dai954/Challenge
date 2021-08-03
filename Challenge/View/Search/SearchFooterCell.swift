//
//  SearchFooterCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/14.
//

import UIKit

class SearchFooterCell: UICollectionReusableView {
    
    let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "お気に入り0チーム"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let starImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "star")
        image.widthAnchor.constraint(equalToConstant: 16).isActive = true
        image.heightAnchor.constraint(equalToConstant: 16).isActive = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 6
        
//        let dummyView1 = UIView()
//        let dummyView2
        
        let stackView = UIStackView(arrangedSubviews: [
            starImage, footerLabel
        ])
        addSubview(stackView)
        stackView.fillSuperview()
        stackView.alignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

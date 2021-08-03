//
//  SearchResultCell2.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/29.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    let sharedCellPlus = SharedCellPlus()
    
    var app: App! {
        didSet {
            sharedCellPlus.appForSharedCellPlus = app
            teamDescription.text = app.description
            }
        }
    
    let teamDescription: UILabel = {
        let label = UILabel()
        label.text = "健康な生活は健全な食事生活から、偏った食事にならないように気をつけていきましょう！　（オーナーはオーナー専用メニューからチーム名やこの説明文を編集することができます。"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 8
        clipsToBounds = true
        
        sharedCellPlus.lowerView.addSubview(teamDescription)
        teamDescription.fillSuperview(padding: .init(top: 10, left: 20, bottom: 0, right: 20))
        sharedCellPlus.lowerView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        addSubview(sharedCellPlus)
        sharedCellPlus.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

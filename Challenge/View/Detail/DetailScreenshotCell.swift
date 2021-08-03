//
//  DetailScreenShotCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/30.
//

import UIKit

class DetailScreenshotCell: UICollectionViewCell {
    let topBorder = UIView(color: .lightGray)
    let topLabel = UILabel(text: "最近のやりとり", font: .systemFont(ofSize: 14))
    let bottomLabel = UILabel(text: "発言内容を公開設定にしているメンバーの、発言のみが表示されます。", font: .systemFont(ofSize: 12), numberOfLines: 2)
    let detailScreenshotController = DetailScreenshotController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(topBorder)
        addSubview(topLabel)
        
        addSubview(detailScreenshotController.view)
        
        bottomLabel.textColor = .lightGray
        addSubview(bottomLabel)
        
        topBorder.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 0.3))
        topLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 20, bottom: 0, right: 20))
        detailScreenshotController.view.anchor(top: topLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomLabel.topAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 20, bottom: 10, right: 20))
        bottomLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 10, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

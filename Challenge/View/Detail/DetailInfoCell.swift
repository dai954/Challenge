//
//  otherInfoCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/30.
//

import UIKit

class DetailInfoCell: UICollectionViewCell {
    
    let topBorder = UIView(color: .lightGray)
    let leftLabel = UILabel(text: "最終更新", font: .systemFont(ofSize: 14))
    let rightLabel = UILabel(text: "7月29日 23:07", font: .systemFont(ofSize: 14))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(topBorder)
        addSubview(leftLabel)
        addSubview(rightLabel)
        
        
        topBorder.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 0.3))
        leftLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        rightLabel.anchor(top: topAnchor, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

class detailInfoCellPlusQButton: DetailInfoCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let button = UIButton()
        button.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
        addSubview(button)
        button.anchor(top: topAnchor, leading: leftLabel.trailingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 4, bottom: 0, right: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class detailInfoCellPlusICon: detailInfoCellPlusQButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let icon = UIImageView()
        icon.image = UIImage(named: "garden")
        addSubview(icon)
        icon.anchor(top: topAnchor, leading: nil, bottom: bottomAnchor, trailing: rightLabel.leadingAnchor, padding: .init(top: 8, left: 0, bottom: 8, right: 4), size: .init(width: 20, height: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

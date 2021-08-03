//
//  AchievementRateCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/29.
//

import UIKit

class AchievementRateCell: UICollectionViewCell {
    let topBorder = UIView(color: .lightGray)
    let lastThreeDaysLabel = UILabel(text: "直近3日の", font: .systemFont(ofSize: 14))
    let achievementRateLabel = UILabel(text: "チャレンジ達成率", font: .systemFont(ofSize: 14))
    let circleProgressView = CircleProgressView()
    let percentageLabel = UILabel(text: "0%", font: .systemFont(ofSize: 24))
    
    public var progress: CGFloat = 0 {
        didSet {
            let intProgress = Int(progress * 100)
            percentageLabel.text = "\(intProgress)%"
            var nsMakeRangeFirstPosition = 0
            if intProgress < 10 {
                nsMakeRangeFirstPosition = 1
            } else if intProgress < 100 {
                nsMakeRangeFirstPosition = 2
            } else {
                nsMakeRangeFirstPosition = 3
            }
            let attrText = NSMutableAttributedString(string: percentageLabel.text!)
            attrText.addAttributes([
                    .font: UIFont.boldSystemFont(ofSize: 12)
                ], range: NSMakeRange(nsMakeRangeFirstPosition, 1))
            percentageLabel.attributedText = attrText
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(topBorder)
        addSubview(lastThreeDaysLabel)
        addSubview(achievementRateLabel)
        
        addSubview(circleProgressView)
        addSubview(percentageLabel)
        
        topBorder.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 0.3))
        lastThreeDaysLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 16, bottom: 0, right: 0))
        achievementRateLabel.anchor(top: lastThreeDaysLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 16, bottom: 0, right: 0))
        circleProgressView.anchor(top: topAnchor, leading: trailingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: -120, bottom: 0, right: 0), size: .init(width: 60, height: 0))
        percentageLabel.anchor(top: topAnchor, leading: circleProgressView.trailingAnchor, bottom: bottomAnchor, trailing: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

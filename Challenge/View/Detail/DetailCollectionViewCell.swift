//
//  DetailCollectionViewCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/29.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    let sharedCellPlus = SharedCellPlus()
    
    var app: App? {
        didSet {
            sharedCellPlus.teamLabel.text = app?.trackName ?? ""
            sharedCellPlus.teamImage.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            
            sharedCellPlus.memberImage1.sd_setImage(with: URL(string: app?.screenshotUrls?[0] ?? ""))
            if app?.screenshotUrls?.count ?? 0 > 1 {
                sharedCellPlus.memberImage2.sd_setImage(with: URL(string: app?.screenshotUrls?[1] ?? ""))
            }
            if app?.screenshotUrls?.count ?? 0 > 2 {
                sharedCellPlus.memberImage2.sd_setImage(with: URL(string: app?.screenshotUrls?[2] ?? ""))
            }
            if app?.screenshotUrls?.count ?? 0 > 3 {
                sharedCellPlus.memberImage2.sd_setImage(with: URL(string: app?.screenshotUrls?[3] ?? ""))
            }
            if app?.screenshotUrls?.count ?? 0 > 4 {
                sharedCellPlus.memberImage2.sd_setImage(with: URL(string: app?.screenshotUrls?[4] ?? ""))
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sharedCellPlus.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        addSubview(sharedCellPlus)
        sharedCellPlus.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

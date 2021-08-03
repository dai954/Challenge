//
//  SharedCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/29.
//

import UIKit

class SharedCell: UIView {
    
    var appForSharedCell: App! {
        didSet {
            teamLabel.text = appForSharedCell.trackName
            teamImage.sd_setImage(with: URL(string: appForSharedCell.artworkUrl100))
            
            memberImage1.sd_setImage(with: URL(string: appForSharedCell.screenshotUrls?[0] ?? ""))

            if appForSharedCell.screenshotUrls!.count > 1 {
                memberImage2.sd_setImage(with: URL(string: appForSharedCell.screenshotUrls![1]))
            }
            if appForSharedCell.screenshotUrls!.count > 2 {
                memberImage3.sd_setImage(with: URL(string: appForSharedCell.screenshotUrls?[2] ?? ""))
            }
            if appForSharedCell.screenshotUrls!.count > 3 {
                memberImage4.sd_setImage(with: URL(string: appForSharedCell.screenshotUrls?[3] ?? ""))
            }
            if appForSharedCell.screenshotUrls!.count > 4 {
                memberImage5.sd_setImage(with: URL(string: appForSharedCell.screenshotUrls?[4] ?? ""))
            }
        }
    }
    
    let teamImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        return imageView
    }()
    
    let teamLabel: UILabel = {
        let label = UILabel()
        label.text = "食事記録"
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    
    lazy var memberImage1: UIImageView = createMemberImage()
    lazy var memberImage2: UIImageView = createMemberImage()
    lazy var memberImage3: UIImageView = createMemberImage()
    lazy var memberImage4: UIImageView = createMemberImage()
    lazy var memberImage5: UIImageView = createMemberImage()

    let memberImageSize: CGFloat = 48
    func createMemberImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        let imageSize: CGFloat = memberImageSize
        imageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        imageView.layer.cornerRadius = imageSize / 2
        imageView.clipsToBounds = true
        return imageView
    }
    
    let blackBlindView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        return view
    }()
    
    var lowerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        teamImage.addSubview(blackBlindView)
        blackBlindView.fillSuperview()

        let memberImageStackView = UIStackView(arrangedSubviews: [
        memberImage1, memberImage2, memberImage3, memberImage4, memberImage5
        ])
        memberImageStackView.distribution = .equalSpacing
        
        let overallStackView = UIStackView(arrangedSubviews: [
        teamImage, lowerView, UIView()
        ])
        overallStackView.axis = .vertical
        addSubview(overallStackView)
        
        overallStackView.addSubview(memberImageStackView)

        memberImageStackView.anchor(top: teamImage.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: -memberImageSize/2, left: 10, bottom: 0, right: 10))

        overallStackView.addSubview(teamLabel)
        teamLabel.textAlignment = .center
        teamLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 25, left: 64, bottom: 0, right: 64))
        
        overallStackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

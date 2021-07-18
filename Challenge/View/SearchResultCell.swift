//
//  SearchResultCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/16.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    let blurVisualEffectiveView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    
    let teamImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    lazy var memberImage1: UIImageView = createMemberImage()
    lazy var memberImage2: UIImageView = createMemberImage()
    lazy var memberImage3: UIImageView = createMemberImage()
    lazy var memberImage4: UIImageView = createMemberImage()
    lazy var memberImage5: UIImageView = createMemberImage()

    func createMemberImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        let imageSize: CGFloat = 48
        imageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        imageView.layer.cornerRadius = imageSize / 2
        return imageView
    }
    
    let teamDescription: UILabel = {
        let label = UILabel()
        label.text = "健康な生活は健全な食事生活から、偏った食事にならないように気をつけていきましょう！　（オーナーはオーナー専用メニューからチーム名やこの説明文を編集することができます。"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let teamLabel: UILabel = {
        let label = UILabel()
        label.text = "食事記録"
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    
    let beginerTag: UILabel = {
        let label = UILabel()
        label.text = "初心者歓迎"
        label.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        label.textColor = .white
        label.clipsToBounds = true
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = .white
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        layer.cornerRadius = 8
        clipsToBounds = true
    
        let dummyView1 = UIView()
        let dummyView2 = UIView()
        let dummyStackView = UIStackView(arrangedSubviews: [
        dummyView1, teamDescription, dummyView2
        ])
        dummyView1.widthAnchor.constraint(equalToConstant: 32).isActive = true
        dummyView1.widthAnchor.constraint(equalToConstant: 32).isActive = true
        teamDescription.widthAnchor.constraint(equalToConstant: frame.width - 64).isActive = true
        
        let frame = CGRect(origin:CGPoint(x:0,y:0),size: .init(width: frame.width, height: frame.height / 2))
        let tempView = UIView(frame:frame)
        tempView.backgroundColor = UIColor.black
        tempView.alpha = 0.5
        
        teamImage.addSubview(tempView)
        
        let overallStackView = UIStackView(arrangedSubviews: [
        teamImage, dummyStackView
        ])
        overallStackView.axis = .vertical
        addSubview(overallStackView)
        overallStackView.distribution = .fillEqually
        
        let memberImageStackView = UIStackView(arrangedSubviews: [
        memberImage1, memberImage2, memberImage3, memberImage4, memberImage5
        ])
        memberImageStackView.spacing = 32
        
        overallStackView.addSubview(memberImageStackView)
        overallStackView.addSubview(starImage)
        overallStackView.addSubview(teamLabel)
        overallStackView.addSubview(beginerTag)
        memberImageStackView.centerInSuperview()
        starImage.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 8),size: .init(width: 20, height: 20))
        teamLabel.textAlignment = .center
        teamLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 25, left: 20, bottom: 0, right: 20))
        beginerTag.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 4, bottom: 0, right: 0), size: .init(width: 80, height: 24))
        beginerTag.layer.cornerRadius = 12
        beginerTag.textAlignment = .center
        
        overallStackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

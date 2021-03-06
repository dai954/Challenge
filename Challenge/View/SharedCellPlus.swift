//
//  SharedCell+.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/29.
//

import UIKit

class SharedCellPlus: SharedCell {
    
    var appForSharedCellPlus: App! {
        didSet {
            super.appForSharedCell = appForSharedCellPlus
            }
        }
    
    let beginerTag: UILabel = {
        let label = UILabel()
        label.text = "初心者歓迎"
        label.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        label.textColor = .white
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
        
        backgroundColor = .white
        layer.cornerRadius = 8
        clipsToBounds = true
        
        setupBeginerTag()
        setupStarImage()
    }
    
    fileprivate func setupBeginerTag() {
        addSubview(beginerTag)
        beginerTag.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 4, bottom: 0, right: 0), size: .init(width: 80, height: 24))
        beginerTag.textAlignment = .center
        beginerTag.layer.cornerRadius = 12
        beginerTag.clipsToBounds = true
    }
    
    fileprivate func setupStarImage() {
        addSubview(starImage)
        starImage.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 8), size: .init(width: 20, height: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

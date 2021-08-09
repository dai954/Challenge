//
//  TagCollectionViewCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/08/08.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {

    var tagLabel: UILabel = {
        let label = UILabel()
        label.text = "sample"
//            label.backgroundColor = .yellow
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tagLabel)
        tagLabel.fillSuperview(padding: .init(top: 8, left: 12, bottom: 8, right: 12))
        tagLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 24).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

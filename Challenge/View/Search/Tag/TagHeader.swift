//
//  TagHeader.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/08/08.
//

import UIKit

class TagHeader: UICollectionReusableView {

    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "headerSample"
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(headerLabel)
        headerLabel.fillSuperview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

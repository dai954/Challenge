//
//  BottomView.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/30.
//

import UIKit

class BottomView: UIView {
    let topBorder = UIView(color: .lightGray)
    let firstLabel = UILabel(text: "チームが自分に合わなかったら", font: .systemFont(ofSize: 14))
    let secondLabel = UILabel(text: "退出して大丈夫ですよ。まずは一歩を踏み出そう。", font: .systemFont(ofSize: 14))
    let partInButton: UIButton = {
        let button = UIButton()
         button.backgroundColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
         button.setTitle("初チーム参加で500コインを獲得する", for: .normal)
         button.heightAnchor.constraint(equalToConstant: 42).isActive = true
         button.layer.cornerRadius = 21
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        firstLabel.textAlignment = .center
        secondLabel.textAlignment = .center
        addSubview(topBorder)
        addSubview(firstLabel)
        addSubview(secondLabel)
        addSubview(partInButton)
        topBorder.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, size: .init(width: 0, height: 0.3))
        firstLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        secondLabel.anchor(top: firstLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        partInButton.anchor(top: secondLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

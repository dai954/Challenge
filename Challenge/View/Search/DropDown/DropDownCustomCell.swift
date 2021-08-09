//
//  CustomCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/23.
//

import UIKit

class CustomCellForTextField: UITableViewCell {
    
    let keywordLabel: UILabel = {
        let label = UILabel()
        label.text = "キーワード"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let separateLabel: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let textField: UITextField = {
        let field = UITextField()
        field.placeholder = "キーワード入力"
        field.tintColor = .darkGray
        return field
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(keywordLabel)
        addSubview(separateLabel)
        addSubview(textField)
        contentView.removeFromSuperview()
        
        keywordLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil,padding: .init(top: 8, left: 8, bottom: 8, right: 0), size: .init(width: 112, height: 0))
        separateLabel.anchor(top: keywordLabel.topAnchor, leading: keywordLabel.trailingAnchor, bottom: keywordLabel.bottomAnchor,trailing: nil, size: .init(width: 8, height: 0))
        textField.anchor(top: separateLabel.topAnchor, leading: separateLabel.trailingAnchor, bottom: separateLabel.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 0))
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class CustomCellForCategory: UITableViewCell {
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "カテゴリー"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let separateLabel: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let categorySearchButton: UIButton = {
        let button = UIButton()
        button.setTitle("歩く", for: .normal)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.tintColor = .black
        button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(categoryLabel)
        addSubview(separateLabel)
        addSubview(categorySearchButton)
        contentView.removeFromSuperview()

        categoryLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil,padding: .init(top: 8, left: 8, bottom: 8, right: 0), size: .init(width: 112, height: 0))
        separateLabel.anchor(top: categoryLabel.topAnchor, leading: categoryLabel.trailingAnchor, bottom: categoryLabel.bottomAnchor,trailing: nil, size: .init(width: 8, height: 0))
        categorySearchButton.anchor(top: separateLabel.topAnchor, leading: separateLabel.trailingAnchor, bottom: separateLabel.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 0))

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



class CustomCellForBiggerSegmented: UITableViewCell {
    
    let narrowDownLabel: UILabel = {
        let label = UILabel()
        label.text = "絞り込み"
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    let items = ["全て", "開始前", "チャレンジ中"]
    let items2 = ["全て", "プレミアムチームのみ"]
    let items3 = ["性別制限なし", "性別制限あり"]
    let items4 = ["年齢制限なし", "年齢制限あり"]
    
    lazy var segmentedControl1 = CustomCellForBiggerSegmented.createSegment(items: items)
    lazy var segmentedControl2 = CustomCellForBiggerSegmented.createSegment(items: items2)
    lazy var segmentedControl3 = CustomCellForBiggerSegmented.createSegment(items: items3)
    lazy var segmentedControl4 = CustomCellForBiggerSegmented.createSegment(items: items4)
    
    class func createSegment(items: [String]) -> UISegmentedControl {
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.layer.cornerRadius = 8
        control.layer.masksToBounds = true
        
        let color = UIColor.gray

        control.selectedSegmentTintColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: color], for: .normal)
        return control
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stackView = UIStackView(arrangedSubviews: [
            narrowDownLabel ,segmentedControl1, segmentedControl2, segmentedControl3, segmentedControl4
        ])
        stackView.spacing = 10
        stackView.axis = .vertical
        
        addSubview(stackView)
        contentView.removeFromSuperview()
        stackView.fillSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class CustomCellForSmallerSegmented: UITableViewCell {
    
    let orderLabel: UILabel = {
        let label = UILabel()
        label.text = "表示順"
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    let items = ["更新順", "達成率順", "残り時間順"]
    
    lazy var segmentedControl = CustomCellForBiggerSegmented.createSegment(items: items)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stackView = UIStackView(arrangedSubviews: [
            orderLabel ,segmentedControl
        ])
        stackView.spacing = 10
        stackView.axis = .vertical
        
        addSubview(stackView)
        contentView.removeFromSuperview()
        stackView.fillSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class CustomCellForSearchButton: UITableViewCell {
    
    let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
        button.setTitle("検索する", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        searchButton.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        
        addSubview(searchButton)
        
        contentView.removeFromSuperview()
        
        searchButton.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: frame.width / 3 + 10, bottom: 10, right: frame.width / 3 + 10))
        searchButton.layer.cornerRadius = 14
    
    }
    
    @objc func handleButton() {
        print("button pressed")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

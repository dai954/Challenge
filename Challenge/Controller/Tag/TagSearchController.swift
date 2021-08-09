//
//  TagSearchController.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/15.
//

import UIKit

class TagSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    let cellId = "cellId"
    let headerId = "headerId"
    
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.9410743117, green: 0.9412353635, blue: 0.9410640597, alpha: 1)

        //   For next VC, it should be set here.
        if #available(iOS 14.0, *) {
            navigationItem.backButtonDisplayMode = .minimal
        }
        else {
            navigationItem.backButtonTitle = ""
        }
        
        navigationItem.titleView = searchBar
        searchBar.textField?.backgroundColor = .white
        searchBar.tintColor = .lightGray

        searchBar.placeholder = "キーワードを入力してください"
        searchBar.becomeFirstResponder()
        
        print(UICollectionView.elementKindSectionHeader)
        collectionView.register(TagHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 10, bottom: 10, right: 10)
        
        let tapGesture = UITapGestureRecognizer(
                    target: self,
                    action: #selector(dismissKeyboard))
                tapGesture.cancelsTouchesInView = false
                view.addGestureRecognizer(tapGesture)
    }
    
    @objc public func dismissKeyboard() {
            searchBar.endEditing(true)
        }
    
    var tagCategory: [String] = [
        "オススメ", "勉強","ダイエット","家事/仕事","趣味/創作"
    ]

    var tagItems0: [String] = [
        "2021", "住宅", "夏", "自炊", "YouTube", "断捨離", "毎日投稿", "マイペース", "楽しく会話", "早起き"
    ]

    var tagItems1: [String] = [
        "英語", "TOEIC", "リスニング","中国語", "韓国語", "ドイツ語", "スペイン語", "フランス語", "語学学習", "プログラミング", "資格", "受験勉強"
    ]

    var tagItems2: [String] = [
        "減量", "標準体重", "体脂肪", "腹筋", "ボディメイク", "ストレッチ", "ヨガ", "筋トレ", "40kg", "50kg", "60kg", "70kg", "80kg"
    ]

    var tagItems3: [String] = [
        "掃除", "料理", "子育て", "貯金", "TODO", "投資", "朝活"
    ]

    var tagItems4: [String] = [
        "絵", "読書", "ゲーム", "ブログ", "音楽", "執筆"
    ]
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! TagHeader
        headerCell.headerLabel.text = tagCategory[indexPath.section]
        return headerCell
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return tagCategory.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return tagItems0.count
        case 1: return tagItems1.count
        case 2: return tagItems2.count
        case 3: return tagItems3.count
        default: return tagItems4.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TagCollectionViewCell
        switch indexPath.section {
        case 0: cell.tagLabel.text = tagItems0[indexPath.item]
        case 1: cell.tagLabel.text = tagItems1[indexPath.item]
        case 2: cell.tagLabel.text = tagItems2[indexPath.item]
        case 3: cell.tagLabel.text = tagItems3[indexPath.item]
        default: cell.tagLabel.text = tagItems4[indexPath.item]
        }
        cell.layer.cornerRadius = 12
        cell.backgroundColor = .white
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let searchResultController = SearchResultController()
        
        var searchTerm = ""
        switch indexPath.section {
        case 0: searchTerm = tagItems0[indexPath.item]
        case 1: searchTerm = tagItems1[indexPath.item]
        case 2: searchTerm = tagItems2[indexPath.item]
        case 3: searchTerm = tagItems3[indexPath.item]
        default: searchTerm = tagItems4[indexPath.item]
        }
        searchResultController.searchTerm = searchTerm
        searchResultController.navigationItem.title = "【\(searchTerm)】"
        self.navigationController?.pushViewController(searchResultController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 20, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 30)
    }
    
    
}

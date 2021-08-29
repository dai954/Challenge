//
//  SearchController.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/14.
//

import UIKit

class CategorySearchController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    fileprivate let footerCellId = "footerCellId"
    
    static let labelData = ["Apple Watch", "体重管理", "食事記録", "トレーニング", "歩く", "ウォーキングリレー", "糖尿病改善", "フレイル予防", "ランニング", "早起き", "睡眠をとる", "マインドフルネス", "勉強", "健康・美容", "家事・仕事", "趣味・創作", "みんチャレ初心者"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.9410743117, green: 0.9412353635, blue: 0.9410640597, alpha: 1)
        
        collectionView.isScrollEnabled = false
        collectionView.register(SearchCategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(SearchFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerCellId)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 40)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategorySearchController.labelData.count
    }
    
    var handlePushView: ((String)->Void)?
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        handlePushView?(CategorySearchController.labelData[indexPath.item])
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchCategoryCell
        cell.categoryLabel.text = CategorySearchController.labelData[indexPath.item]
        return cell
    
    }
    
    static let spacing: CGFloat = 10
    
    static let cellHeight: CGFloat = 70
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width / 2 - CategorySearchController.spacing / 2, height: CategorySearchController.cellHeight)
        
    }
    
}

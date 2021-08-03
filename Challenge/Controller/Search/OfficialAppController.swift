//
//  OfficialAppController.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/15.
//

import UIKit
import SDWebImage

class OfficialAppController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var apps: [Result]? {
        didSet {
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.clipsToBounds = true
        collectionView.layer.cornerRadius = 12
        collectionView.isScrollEnabled = false
        
        collectionView.register(OfficialAppCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! OfficialAppCell
        let app = apps?[indexPath.item]
        cell.appLabel.text = app?.name
        cell.appImage.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
        return cell
    }
    
    let spacing: CGFloat = 10
    static let cellHeight: CGFloat = 100
    static let insetWidth: CGFloat = 16
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 3 - spacing * 2
        return .init(width: width, height: OfficialAppController.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: OfficialAppController.insetWidth, left: OfficialAppController.insetWidth, bottom: OfficialAppController.insetWidth, right: OfficialAppController.insetWidth)
    }
    
}

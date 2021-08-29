//
//  DetailScreenshotController.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/30.
//

import UIKit

class DetailScreenshotController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    
    var screenshotUrls: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        collectionView.register(ScreenShotCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    class ScreenShotCell: UICollectionViewCell {
        let imageView = UIImageView()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            imageView.clipsToBounds = true
            imageView.layer.borderWidth = 0.5
            imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
            imageView.contentMode = .scaleAspectFill
            addSubview(imageView)
            imageView.fillSuperview()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screenshotUrls?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenShotCell
        cell.imageView.sd_setImage(with: URL(string: screenshotUrls?[indexPath.item] ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: 150, height: view.frame.height)
    }
    
}

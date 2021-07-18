//
//  SearchResultController.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/16.
//

import UIKit

class SearchResultController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.9410743117, green: 0.9412353635, blue: 0.9410640597, alpha: 1)
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        Searvice.shared.setupAddButton(addTo: view)
    
        setupTopFloatingView()
        
        
    }
    
    var numberOfTeam: Int = 0
    
    let detailSearchViewHeight: CGFloat = 42
    
    fileprivate func setupTopFloatingView() {
        let detailSearchView = UIView()
        detailSearchView.backgroundColor = .white
        let screenWidth: CGFloat = UIScreen.main.bounds.size.width
        detailSearchView.frame = .init(x: 0, y: 0, width: screenWidth, height: detailSearchViewHeight)
        
        
        let teamNumberLabel = UILabel(text: "\(numberOfTeam)チーム募集中", font: .systemFont(ofSize: 14))
        teamNumberLabel.textColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)

        let detailSearchLabel = UILabel(text: "詳細検索", font: .systemFont(ofSize: 14))
        
        let pullDownImage: UIImageView = {
           let imageView = UIImageView()
            imageView.image = UIImage(systemName: "chevron.down")
            imageView.tintColor = .black
            imageView.clipsToBounds = true
            return imageView
        }()
        
        detailSearchView.addSubview(teamNumberLabel)
        teamNumberLabel.anchor(top: detailSearchView.topAnchor, leading: detailSearchView.leadingAnchor, bottom: detailSearchView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0))
        detailSearchView.addSubview(pullDownImage)
        pullDownImage.anchor(top: detailSearchView.topAnchor, leading: nil, bottom: nil, trailing: detailSearchView.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 12), size: .init(width: 20, height: 20))
        detailSearchView.addSubview(detailSearchLabel)
        detailSearchLabel.anchor(top: pullDownImage.topAnchor, leading: nil, bottom: pullDownImage.bottomAnchor, trailing: pullDownImage.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 8))
        
        collectionView.addSubview(detailSearchView)
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 20, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: detailSearchViewHeight + 10, left: 0, bottom: 10, right: 0)
    }
}

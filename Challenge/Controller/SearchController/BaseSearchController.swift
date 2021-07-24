//
//  BaseSearchController.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/14.
//

import UIKit

class BaseSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    let firstCellId = "firstCellId"
    let secondCellId = "secondCellId"
    let thirdCellId = "thirdCellId"
    
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = #colorLiteral(red: 0.9410743117, green: 0.9412353635, blue: 0.9410640597, alpha: 1)
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        collectionView.register(SearchFirstCell.self, forCellWithReuseIdentifier: firstCellId)
        collectionView.register(SearchSecondCell.self, forCellWithReuseIdentifier: secondCellId)
        collectionView.register(SearchThirdCell.self, forCellWithReuseIdentifier: thirdCellId)
        
        searchBar.delegate = self
        
        setupSearchBar()
        Searvice.shared.setupAddButton(addTo: view)
        fetchData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        navigationController?.pushViewController(TagSearchController(), animated: true)
        searchBar.textField?.endEditing(true)
    }
    
    private func setupSearchBar() {
        searchBar.tintColor = .white
        searchBar.tintColor = .white
        navigationItem.titleView = searchBar
        searchBar.textField?.backgroundColor = .white
        searchBar.placeholder = "キーワード検索はここをタップ"
        navigationItem.title = ""
        navigationController?.navigationBar.tintColor = .white
    }
    
    var apps = [Result]()
    
    func fetchData() {
        
        let urlString = "https://rss.itunes.apple.com/api/v1/jp/ios-apps/top-grossing/all/18/explicit.json"
        Searvice.shared.fetchJsonData(urlString: urlString) { appResults, err in
            if let err = err {
                print("Faild to fetch data", err)
            }
            
            guard let appResults = appResults else { return }
            self.apps = appResults.feed.results
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
       
    }
   
    class SearchFirstCell: UICollectionViewCell {
        let categorySearchController = CategorySearchController()
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(categorySearchController.view)
            categorySearchController.view.fillSuperview(padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class SearchSecondCell: UICollectionViewCell {
        let favoriteButton: UIButton = {
           let button = UIButton()
            button.setTitle("お気に入り", for: .normal)
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 12)
            button.setImage(#imageLiteral(resourceName: "star"), for: .normal)
            button.titleEdgeInsets = .init(top: 0, left: 12, bottom: 0, right: 0)
            button.layer.cornerRadius = 6
            return button
        }()
       
        let numberOfFavorite = 0
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            favoriteButton.setTitle("お気に入り\(numberOfFavorite)チーム", for: .normal)
            
            addSubview(favoriteButton)
            favoriteButton.fillSuperview(padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
    class SearchThirdCell: UICollectionViewCell {
        
        let officialAppController = OfficialAppController()
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "公式チャレンジ"
            label.font = .systemFont(ofSize: 12)
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            layer.cornerRadius = 32
            clipsToBounds = true
            titleLabel.textAlignment = .center
            addSubview(titleLabel)
            titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 24, left: 0, bottom: 0, right: 0))
            addSubview(officialAppController.view)
            officialAppController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 20, right: 10))
            
        }
        
        required init?(coder: NSCoder) {
            fatalError()
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstCellId, for: indexPath) as! SearchFirstCell
            cell.categorySearchController.handlePushView = { [weak self] in
                self?.navigationController?.pushViewController(SearchResultController(), animated: true)
            }
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondCellId, for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: thirdCellId, for: indexPath) as! SearchThirdCell
            cell.officialAppController.apps = self.apps
            return cell
        }
        
    }
    
    let numberOfSearchCategoryCell = CGFloat(CategorySearchController.labelData.count)
    let firstCellHeight = CategorySearchController.cellHeight
    let thirdCellHeight = OfficialAppController.cellHeight
    let thirdCellInsetWidth = OfficialAppController.insetWidth
    let topBottomInset: CGFloat = 12 + 24 + 10 + 20
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            let height = firstCellHeight * (ceil(numberOfSearchCategoryCell / 2)) + ceil(numberOfSearchCategoryCell / 2) * 10
            return .init(width: view.frame.width, height: height)
        } else if indexPath.item == 1 {
            return .init(width: view.frame.width, height: 32)
        } else {
            let numberOfOfficialAppCell = CGFloat(self.apps.count)
            let height = thirdCellHeight * (ceil(numberOfOfficialAppCell / 3)) + ceil(numberOfOfficialAppCell / 3) * 10 + thirdCellInsetWidth * 2 + topBottomInset
            
            return .init(width: view.frame.width, height: height)
        }
        
    }
    
}

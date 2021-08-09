//
//  BaseSearchController.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/14.
//

import UIKit

class BaseSearchController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let firstCellId = "firstCellId"
    let secondCellId = "secondCellId"
    let thirdCellId = "thirdCellId"
    
    let searchBarView = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.9410743117, green: 0.9412353635, blue: 0.9410640597, alpha: 1)
        
        collectionView.register(SearchFirstCell.self, forCellWithReuseIdentifier: firstCellId)
        collectionView.register(SearchSecondCell.self, forCellWithReuseIdentifier: secondCellId)
        collectionView.register(SearchThirdCell.self, forCellWithReuseIdentifier: thirdCellId)
        
        setupSearchBar()
        
        Service.shared.setupAddButton(addTo: view)
        fetchData()
    }

    private func setupSearchBar() {
        //   For next VC, it should be set here.
        if #available(iOS 14.0, *) {
            navigationItem.backButtonDisplayMode = .minimal
        }
        else {
            navigationItem.backButtonTitle = ""
        }
        
        searchBarView.tintColor = .white
        searchBarView.textField?.backgroundColor = .white
        searchBarView.placeholder = "キーワード検索はここをタップ"
        navigationController?.navigationBar.tintColor = .white
        searchBarView.textField?.isEnabled = false
        navigationItem.titleView = searchBarView
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap))

        searchBarView.addGestureRecognizer(tapGesture)
    }
    
    @objc func singleTap() {
        navigationController?.pushViewController(TagSearchController(collectionViewLayout: LeftAlignedCollectionViewFlowLayout()), animated: true)
    }
    
    
    var apps = [Result]()
    
    func fetchData() {
        
        let urlString = "https://rss.itunes.apple.com/api/v1/jp/ios-apps/top-grossing/all/18/explicit.json"
        Service.shared.fetchJsonData(urlString: urlString) { (appResults: AppResult?, err) in
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
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstCellId, for: indexPath) as! SearchFirstCell
            cell.categorySearchController.handlePushView = { [weak self] searchTerm in
                let searchResultController = SearchResultController()
                searchResultController.searchTerm = searchTerm
                searchResultController.navigationItem.title = "【\(searchTerm)】"
                self?.navigationController?.pushViewController(searchResultController, animated: true)
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
    let firstCellSpacing = CategorySearchController.spacing
    let thirdCellHeight = OfficialAppController.cellHeight
    let thirdCellInsetWidth = OfficialAppController.insetWidth
    let topBottomInset: CGFloat = 12 + 24 + 10 + 20
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            let height = firstCellHeight * (ceil(numberOfSearchCategoryCell / 2)) + ceil(numberOfSearchCategoryCell / 2) * firstCellSpacing
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

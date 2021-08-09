//
//  SearchResultController.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/16.
//

import UIKit

class SearchResultController: BaseListController, UICollectionViewDelegateFlowLayout {
    

    let cellId = "cellId"
    var dropDownFloatingView = DropDownFloatingView()
    var searchTerm = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        For next VC, it should be set here.
        if #available(iOS 14.0, *) {
          navigationItem.backButtonDisplayMode = .minimal
        }
        else {
          navigationItem.backButtonTitle = ""
        }
        
        collectionView.backgroundColor = #colorLiteral(red: 0.9410743117, green: 0.9412353635, blue: 0.9410640597, alpha: 1)
        Service.shared.setupAddButton(addTo: view)
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        setupFloatingView()
        
        fetchData()
    }
    
    
    var dummyTableView = DropDownTableView()
    
    fileprivate func calculateTableViewContentHeight(dropDownFloatingView:  DropDownFloatingView) {
        dummyTableView = DropDownTableView.init(frame: .init(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(dummyTableView)
        
        UIView.animate(withDuration: 0, animations: {
        }) { (complete) in
            var heightOfTableView: CGFloat = 0.0
            // Get visible cells and sum up their heights
            let cells = self.dummyTableView.tableView.visibleCells
            for cell in cells {
                //                print(cell.frame)
                heightOfTableView += cell.frame.height
            }
            // Edit heightOfTableViewConstraint's constant to update height of table view
            dropDownFloatingView.tableViewHeight = heightOfTableView

        }
    }
    
    fileprivate func setupFloatingView() {
        dropDownFloatingView = DropDownFloatingView.init(frame: .init(x: 0, y: 0, width: 0, height: 0))
        dropDownFloatingView.detailSearchViewHeight = self.detailSearchViewHeight
        calculateTableViewContentHeight(dropDownFloatingView: dropDownFloatingView)
        view.addSubview(dropDownFloatingView)
        
        dropDownFloatingView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: 0, height: detailSearchViewHeight))
    }
    
    override func viewDidLayoutSubviews() {
        dummyTableView.removeFromSuperview()
        dropDownFloatingView.safeAreaTop = self.view.safeAreaInsets.top
        dropDownFloatingView.floatingViewPosition = dropDownFloatingView.frame.maxY
    }
    
    
    //MARK: - Controll CollectionViewCell with Web API
    var apps = [App]()
    
    func fetchData() {
        let itemEncodeString = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let urlString = "https://itunes.apple.com/search?term=\(itemEncodeString)&country=JP&entity=software"
        Service.shared.fetchJsonData(urlString: urlString) { (res: SearchResult? , error: Error?) in
            if let err = error {
                print("Faild to fetch search data", err)
            }
            self.apps = res?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dropDownFloatingView.teamNumberlabel.text = "\(apps.count)チーム募集中"
        return apps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.app = apps[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 20, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: detailSearchViewHeight + 10, left: 0, bottom: 10, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appId = String(apps[indexPath.item].trackId)
        let detailViewController = DetailViewController(appId: appId)
        detailViewController.navigationItem.title = "\(searchTerm)"
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    
    //MARK: - Controll TopFloatingView

    let detailSearchViewHeight: CGFloat = 42
    var count = 0
    var firstScrollViewPosition: CGFloat = 0
    var savePoint: CGFloat = 0
    var turnAroundPoint: CGFloat = 0
    var flag1 = true
    var flag2 = true


    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        if count >= 3 {
        dropDownFloatingView.floatingViewPosition = dropDownFloatingView.frame.maxY
        }
      
        //        When the collectionView displayed, scrollView is called two times
        count += 1
        if count == 2 {
            firstScrollViewPosition = scrollView.contentOffset.y
            savePoint = scrollView.contentOffset.y
        }

        if scrollView.contentOffset.y > firstScrollViewPosition + detailSearchViewHeight {
            if scrollView.contentOffset.y < savePoint {
                if flag1 {
                    turnAroundPoint = scrollView.contentOffset.y
                    flag1 = false
                    flag2 = true
                }
                if turnAroundPoint - scrollView.contentOffset.y <= detailSearchViewHeight {
                    dropDownFloatingView.transform = .init(translationX: 0, y: -detailSearchViewHeight + turnAroundPoint - scrollView.contentOffset.y)
                } else {
                    dropDownFloatingView.transform = .init(translationX: 0, y: 0)
                }
            } else {
                if flag2 {
                    turnAroundPoint = scrollView.contentOffset.y
                    flag2 = false
                    flag1 = true
                }
                if scrollView.contentOffset.y - turnAroundPoint <= detailSearchViewHeight {
                    dropDownFloatingView.transform = .init(translationX: 0, y: -(scrollView.contentOffset.y - turnAroundPoint))
                } else {
                    dropDownFloatingView.transform = .init(translationX: 0, y: -detailSearchViewHeight)
                }
            }
            savePoint = scrollView.contentOffset.y
        }
    }
    
}


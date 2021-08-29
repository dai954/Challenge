//
//  DetailViewController.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/25.
//

import UIKit

class DetailViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let appId: String
    
    // dependency injection constructor
    init(appId: String) {
        self.appId = appId
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate let cellId0 = "cellId0"
    fileprivate let cellId1 = "cellId1"
    fileprivate let cellId2 = "cellId2"
    fileprivate let cellId3 = "cellId3"
    fileprivate let cellId4 = "cellId4"
    fileprivate let cellId4PlusQButton = "cellId4PlusPlusQButton"
    fileprivate let cellId4PlusIcon = "cellId4PlusPlusIcon"
    fileprivate let cellId5 = "cellId5"
    fileprivate let cellId6 = "cellId6"
    fileprivate let cellId = "cellId4Plus"
    
    let bottomView = BottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.title = "歩く"
        if #available(iOS 14.0, *) {
            navigationItem.backButtonDisplayMode = .minimal
        } else {
            navigationItem.leftBarButtonItem?.title = ""
            navigationItem.backButtonTitle = ""
        }

        self.navigationController?.hidesBarsOnSwipe = true
        self.tabBarController?.tabBar.isHidden = true
        
        collectionView.backgroundColor = #colorLiteral(red: 0.9410743117, green: 0.9412353635, blue: 0.9410640597, alpha: 1)
        collectionView.contentInset = .init(top: 16, left: 0, bottom: 150, right: 0)
        collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: cellId0)
        collectionView.register(AchievementRateCell.self, forCellWithReuseIdentifier: cellId1)
        collectionView.register(DetailDescriptionCell.self, forCellWithReuseIdentifier: cellId2)
        collectionView.register(DetailScreenshotCell.self, forCellWithReuseIdentifier: cellId3)
        collectionView.register(DetailInfoCell.self, forCellWithReuseIdentifier: cellId4)
        collectionView.register(detailInfoCellPlusQButton.self, forCellWithReuseIdentifier: cellId4PlusQButton)
        collectionView.register(detailInfoCellPlusICon.self, forCellWithReuseIdentifier: cellId4PlusIcon)
        collectionView.register(FavoriteRegisterCell.self, forCellWithReuseIdentifier: cellId5)
        collectionView.register(BottomAlertCell.self, forCellWithReuseIdentifier: cellId6)
        
        view.addSubview(bottomView)
        bottomView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 150))
        
        fetchData()
    }
    
    var app: App?
    fileprivate func fetchData() {
        let urlString = "https://itunes.apple.com/lookup?id=\(appId)"
        Service.shared.fetchJsonData(urlString: urlString) { (result: SearchResult?, err) in
            let app = result?.results.first
            self.app = app
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.hidesBarsOnSwipe = false
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId0, for: indexPath) as! DetailCollectionViewCell
            cell.app = app
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId1, for: indexPath)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath) as! DetailDescriptionCell
            cell.descriptionLabel.text = app?.description
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId3, for: indexPath) as! DetailScreenshotCell
            cell.detailScreenshotController.screenshotUrls = app?.screenshotUrls
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId4, for: indexPath) as! DetailInfoCell
            return cell
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId4PlusQButton, for: indexPath) as! detailInfoCellPlusQButton
            cell.leftLabel.text = "年齢制限"
            cell.rightLabel.text = "20代以上"
            return cell
        case 6:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId4PlusQButton, for: indexPath) as! detailInfoCellPlusQButton
            cell.leftLabel.text = "性別制限"
            cell.rightLabel.text = "制限なし"
            return cell
        case 7:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId4PlusQButton, for: indexPath) as! detailInfoCellPlusQButton
            cell.leftLabel.text = "チャレンジ期間"
            cell.rightLabel.text = "残り31日間"
            return cell
        case 8:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId4PlusQButton, for: indexPath) as! detailInfoCellPlusQButton
            cell.leftLabel.text = "自動退出期間"
            cell.rightLabel.text = "4日間"
            return cell
        case 9:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId4PlusIcon, for: indexPath) as! detailInfoCellPlusICon
            cell.leftLabel.text = "アシスタント"
            cell.rightLabel.text = "イエロー"
            return cell
        case 10:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId5, for: indexPath)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId6, for: indexPath)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item {
        case 0:
            return .init(width: view.frame.width - 20, height: 135)
        case 1:
            return .init(width: view.frame.width - 20, height: 60)
        case 2:
            let dummyCell = DetailDescriptionCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            dummyCell.descriptionLabel.text = app?.description
            dummyCell.layoutIfNeeded()
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            return .init(width: view.frame.width - 20, height: estimatedSize.height)
        case 3:
            return .init(width: view.frame.width - 20, height: 400)
        case 4:
            return .init(width: view.frame.width - 20, height: 36)
        case 5:
            return .init(width: view.frame.width - 20, height: 36)
        case 6:
            return .init(width: view.frame.width - 20, height: 36)
        case 7:
            return .init(width: view.frame.width - 20, height: 36)
        case 8:
            return .init(width: view.frame.width - 20, height: 36)
        case 9:
            return .init(width: view.frame.width - 20, height: 36)
        case 10:
            return .init(width: view.frame.width - 20, height: 80)
        default:
            return .init(width: view.frame.width - 20, height: 40)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    fileprivate var count: CGFloat = 0
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        if indexPath.item == 1 {
            let rate = CGFloat((app?.averageUserRating ?? 0) / 5)
            let rateRound = round(rate * 100) / 100
            let cell1 = cell as! AchievementRateCell
            let timer = Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true) { timer in
                self.count += 1
                DispatchQueue.main.async {
                    cell1.progress = min(0.01 * self.count, rateRound)
                    cell1.circleProgressView.progress = min(0.01 * self.count, rateRound)

                    if cell1.circleProgressView.progress == rateRound {
                        timer.invalidate()
                        self.count = 0
                    }
                }
            }
            
            RunLoop.main.add(timer, forMode:RunLoop.Mode.common)
            
        }

    }
    
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.item == 1 {
        let cell1 = cell as! AchievementRateCell
            cell1.progress = 0
            cell1.circleProgressView.progress = 0
        }
        
    }
    
}

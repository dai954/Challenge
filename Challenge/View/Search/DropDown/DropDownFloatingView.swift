//
//  DropDownFloatingView.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/23.
//

import UIKit

class DropDownFloatingView: UIView, DismissDetailSearch {
    
    var dropView = DropDownTableView()
    var dropViewHeight = NSLayoutConstraint()
    var blindViewHeight = NSLayoutConstraint()
    var dropViewTopAnchor = NSLayoutConstraint()
    var blindViewTopAnchor = NSLayoutConstraint()
    var uiViewContainer = UIView()
    
    let detailSearchlabel: UILabel = {
        let label = UILabel()
        label.text = "詳細検索"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    var teamNumberlabel: UILabel = {
        let label = UILabel()
        label.text = "100チーム募集中"
        label.font = .systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
        return label
    }()
    
    let pullDownImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.tintColor = .black
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let bottomBorder: UIView = {
        let border = UIView()
        border.backgroundColor = .lightGray
        border.alpha = 0
        return border
    }()
    
    let blindView = BlindView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        blindView.delegate = self
        
        uiViewContainer.addSubview(detailSearchlabel)
        uiViewContainer.addSubview(pullDownImage)
        detailSearchlabel.anchor(top: uiViewContainer.topAnchor, leading:  uiViewContainer.leadingAnchor, bottom:  uiViewContainer.bottomAnchor, trailing: nil)
        pullDownImage.anchor(top:  detailSearchlabel.topAnchor, leading: detailSearchlabel.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 8, bottom: 0, right: 0), size: .init(width: 20, height: 20))
        
        addSubview(uiViewContainer)
        addSubview(teamNumberlabel)
        addSubview(bottomBorder)
        
        teamNumberlabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0))
        
        uiViewContainer.anchor(top: topAnchor, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 12), size: .init(width: 72, height: 0))
        bottomBorder.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, size: .init(width: 0, height: 0.3))
        
        dropView = DropDownTableView.init(frame: .init(x: 0, y: 0, width: 0, height: 0))
        
        
    }
    
    override func didMoveToSuperview() {
        if let superview = self.superview {
            superview.addSubview(dropView)
            //            ↓↓↓ is When there are other subviews in superView, We need this function bringSubviewToFront(), but only in this case we don't need this function actually. But it should be better to be there.
            superview.bringSubviewToFront(dropView)
            superview.addSubview(blindView)
            dropView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: -20, left: 0, bottom: 0, right: 0))
            dropViewHeight = dropView.heightAnchor.constraint(equalToConstant: 0)
            dropViewTopAnchor = dropView.topAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            blindView.anchor(top: nil, leading: superview.leadingAnchor, bottom: superview.bottomAnchor, trailing: superview.trailingAnchor)
//            self.tableViewHeight + self.detailSearchViewHeight + floatingPosition
            blindViewTopAnchor = blindView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0)
        }
    }
    
    
    var isOpen = false
    var uiViewContainerOriginalPosition: CGFloat = 0
    var detailSearchViewHeight: CGFloat = 0
    var tableViewHeight: CGFloat = 0
    var safeAreaTop: CGFloat = 0
    var floatingViewPosition: CGFloat = 0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let floatingPosition: CGFloat = floatingViewPosition - safeAreaTop - detailSearchViewHeight
//        print("floatingPosition",floatingPosition)
        
        if isOpen == false {
            isOpen = true
            bottomBorder.alpha = 1
            
            NSLayoutConstraint.deactivate([self.dropViewHeight, self.dropViewTopAnchor, self.blindViewTopAnchor])
            
            self.dropViewHeight.constant = tableViewHeight
            self.dropViewTopAnchor.constant = floatingPosition
            self.blindViewTopAnchor.constant = detailSearchViewHeight
            superview?.bringSubviewToFront(dropView)
            NSLayoutConstraint.activate([self.dropViewHeight, self.dropViewTopAnchor, self.blindViewTopAnchor])
            self.blindView.layoutIfNeeded()
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
                
                self.blindView.alpha = 0.7
                
                self.pullDownImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 0.999)
                self.uiViewContainerOriginalPosition = self.uiViewContainer.center.x
                self.uiViewContainer.center.x = self.center.x
                self.teamNumberlabel.alpha = 0
                
            }, completion: nil)
            
            
        } else {
            
            dismissDetailSearchView()
            
        }
    }
    
    func dismissDetailSearchView() {
        isOpen = false
        bottomBorder.alpha = 0
        NSLayoutConstraint.deactivate([self.dropViewHeight])
        self.dropViewHeight.constant = 0
        NSLayoutConstraint.activate([self.dropViewHeight])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            
            self.blindView.alpha = 0
            
            self.pullDownImage.transform = .identity
            self.uiViewContainer.center.x = self.uiViewContainerOriginalPosition
            self.teamNumberlabel.alpha = 1
            self.dropView.layoutIfNeeded()
            
            self.dropView.endEditing(true)
        }, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}


protocol DismissDetailSearch: AnyObject {
    func dismissDetailSearchView()
}

class BlindView: UIView {
    
    weak var delegate: DismissDetailSearch?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        alpha = 0
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.dismissDetailSearchView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

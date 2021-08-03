//
//  Extension.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/16.
//

import Foundation
import UIKit

extension UISearchBar {
    /// Return text field inside a search bar
    var textField: UITextField? {
        guard let text = self.value(forKey: "searchField") as? UITextField else {
            return nil
        }

        return text
    }
}

extension UILabel {
    
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
    
}

extension UIView {
    convenience init(color: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = color
    }
}

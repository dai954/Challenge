//
//  Service.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/15.
//

import Foundation
import UIKit

class Service {
    
    static let shared = Service()
    
//    func fetchJsonData(urlString: String, completion: @escaping (AppResult?, Error?) -> Void) {
//
//        guard let url = URL(string: urlString) else { return }
//        URLSession.shared.dataTask(with: url) { data, resp, err in
//            if let err = err {
//                print("Faild to fetch data", err)
//                completion(nil, err)
//            }
//
//            guard let data = data else { return }
//
//            do {
//            let appResults = try JSONDecoder().decode(AppResult.self, from: data)
//                completion(appResults, nil)
//            } catch let JSONErr {
//                print("Faild to decode data", JSONErr)
//                completion(nil, err)
//            }
//        }.resume()
//        
//    }
    
    func fetchJsonData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, resp, err in
            if let err = err {
                print("Faild to fetch data", err)
                completion(nil, err)
            }
            
            guard let data = data else { return }
            
            do {
            let appResults = try JSONDecoder().decode(T.self, from: data)
                completion(appResults, nil)
            } catch let JSONErr {
                print("Faild to decode data", JSONErr)
                completion(nil, err)
            }
        }.resume()
        
    }
    
    
    func setupAddButton(addTo view: UIView) {
        
        let addButton: UIButton = {
            let button = UIButton(type: .system)
            button.setImage(.init(systemName: "plus"), for: .normal)
            button.tintColor = .white
            button.widthAnchor.constraint(equalToConstant: 48).isActive = true
            button.heightAnchor.constraint(equalToConstant: 48).isActive = true
            button.layer.cornerRadius = 24
            button.backgroundColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
            return button
        }()
        
        view.addSubview(addButton)
        addButton.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 16, right: 6))
    }
    
}

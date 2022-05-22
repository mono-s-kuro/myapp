//
//  TreeDataModel.swift
//  myapp
//
//  Created by shota on 2022/05/18.
//


import Foundation
import SwiftUI

// MARK: - TreeDataModelElement
struct TreeDataModelElement : Hashable,Codable{
    let id: Int
    let childTitle: String
    let childID, childOrder: Int
    let parentTitle: ParentTitle
    let parentID, parentOrder: Int
}

enum ParentTitle :Hashable,Codable {
    case mainManu
    case root
    case the2NdMenu
}

class TreeViewModel:ObservableObject{
    @Published var tree:[TreeDataModelElement] = []
    func fetch(){
//        URL生成
        guard let url = URL(string:"http://192.168.3.3:3000/content-tree") else {
            return
        }
        
//        生成したURLを使ってAPIからデータを取得
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
//            JSON変換
            do {
                let datamodelelement = try JSONDecoder().decode([TreeDataModelElement].self, from: data)
                DispatchQueue.main.async {
                    self?.tree = datamodelelement
                }
            }
            catch{
//                エラー出力
                print(error)
            }
           
        }
        task.resume()
    }
    
}

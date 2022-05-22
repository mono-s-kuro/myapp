//
//  ViewModel.swift
//  myapp
//
//  Created by shota on 2022/05/17.
//

import Foundation
import SwiftUI

struct DataModelElement: Hashable,Codable {
    let id: Int
    var title: String
    var body: String?
    let order: Int
    let createdAt, updatedAt: String
}
class ViewModel:ObservableObject{
    @Published var DME:[DataModelElement] = []
    func fetch(){
//        URL生成
        guard let url = URL(string:"http://192.168.3.3:3000/content") else {
            return
        }
        
//        生成したURLを使ってAPIからデータを取得
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
//            JSON変換
            do {
                let datamodelelement = try JSONDecoder().decode([DataModelElement].self, from: data)
                DispatchQueue.main.async {
                    self?.DME = datamodelelement
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



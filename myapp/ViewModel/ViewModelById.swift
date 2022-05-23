//
//  ViewModelById.swift
//  myapp
//
//  Created by shota on 2022/05/22.
//

import Foundation
import SwiftUI


class ViewModelById:ObservableObject{
    @Published var DME:DataModelElement = DataModelElement(id: -1, title: "", body: nil, order: -1, createdAt: "", updatedAt: "")
    
    func fetch(id:Int){
//        URL生成
        guard let url = URL(string:"\(Constants.apiEndpoint)/content/\(id)") else {
            return
        }
        
//        生成したURLを使ってAPIからデータを取得
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
//            JSON変換
            do {
                let datamodelelement = try JSONDecoder().decode(DataModelElement.self, from: data)
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



//
//  File.swift
//  acord
//
//  Created by shota on 2022/05/20.
//

import Foundation



struct TreeDataModelElement :Hashable,Codable ,Identifiable{
    let id: Int
    let childTitle: String
    let childId, childOrder:Int64
    let parentTitle: String
    let parentId:Int
    let parentOrder: Int
    var children:[TreeDataModelElement]? = []
    
    mutating func addChildlen(children:[TreeDataModelElement]){
        self.children = children
    }
}





class TreeViewModel:ObservableObject{
    @Published var tree:[TreeDataModelElement] = []
    @Published var TreeModel:[TreeDataModelElement] = []
    func fetch(){
//        URL生成
        guard let url = URL(string:"http://192.168.3.7:3000/content-tree") else {
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
//                    print(self?.tree)
                }
            }
            catch{
//                エラー出力
                print(error)
            }
           
        }
        task.resume()
//        print(tree)
    }
    
    
    
    
 
}

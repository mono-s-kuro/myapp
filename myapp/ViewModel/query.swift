//
//  query.swift
//  myapp
//
//  Created by shota on 2022/05/22.
//

import Foundation
class query:ObservableObject{
    @Published var DME:[DataModelElement] = []
    
    func put(title:String,body:String,id:Int){
    //        URL生成
        print("\(Constants.apiEndpoint)/content/\(id)")
        guard let url = URL(string:"\(Constants.apiEndpoint)/content/\(id)") else {
            return
        }
        
        let request = NSMutableURLRequest(url: url)
        
        //httpMethodの設定
        request.httpMethod = "PUT"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        //パラメータの設定
        var putParams:Dictionary<String,String> = [:]
        putParams["title"] = title
        putParams["body"] = body
        
        // パラメータをJSONに変換
        guard let httpBody = try? JSONSerialization.data(withJSONObject: putParams, options: []) else { return }
        
        // httpBodyにセット
        request.httpBody = httpBody

        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            if error != nil {
                print("error is \(error!)")
                return
            }

            do {
                let myJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                if let parseJSON = myJSON {
                    
                    print(parseJSON)
                }
            } catch {
                print(error)
            }
            print(response)
        }
        task.resume()
    }
    
}
struct RequestPut :Hashable,Codable{

        let title, body: String
}





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
        //渡したい値が複数ある場合は＆で繋げます。（web開発している人なら当たり前にわかる）
        let putParams = "title=\(title)&body=\(body)"
        request.httpBody = putParams.data(using: .utf8)

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





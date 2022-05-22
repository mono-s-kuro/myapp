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
        guard let url = URL(string:"http://192.168.3.3:3000/content/\(id)") else {
            return
        }
        
        var request = URLRequest(url: url)
        // POSTを指定
        request.httpMethod = "PUT"
        // POSTするデータをBodyとして設定
        request.httpBody = "title=\(title)&body=\(body)".data(using: .utf8)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                // HTTPヘッダの取得
                print("Content-Type: \(response.allHeaderFields["Content-Type"] ?? "")")
                // HTTPステータスコード
                print("statusCode: \(response.statusCode)")
                print(String(data: data, encoding: .utf8) ?? "")
            }
        }.resume()
    }
    
}
struct RequestPut :Hashable,Codable{

        let title, body: String
}




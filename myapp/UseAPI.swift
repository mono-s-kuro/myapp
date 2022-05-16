//
//  UseAPI.swift
//  myapp
//
//  Created by shota on 2022/05/14.
//

import Foundation

class UseAPI{
//  APIのURL
    let url = "http://192.168.3.3:3000"
    func getAll() -> String {
        var useUrl = url + "/content"
        print(useUrl)
        return ""
    }
}

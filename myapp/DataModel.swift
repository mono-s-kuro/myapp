//
//  DataModel.swift
//  myapp
//
//  Created by shota on 2022/05/14.
//
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dataModel = try? newJSONDecoder().decode(DataModel.self, from: jsonData)





//JSONをデコードするときに使う構造体
import Foundation

// MARK: - DataModelElement
struct DataModel: Codable {
    let id: Int
    let title: String
    let body: String?
    let order: Int
    let createdAt, updatedAt: String
}

typealias DataModel = [DataModelElement]

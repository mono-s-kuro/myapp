// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dataModelElement = try? newJSONDecoder().decode(DataModelElement.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.dataModelElementTask(with: url) { dataModelElement, response, error in
//     if let dataModelElement = dataModelElement {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - DataModelElement
struct DataModelElement: Codable {
    let id: Int
    let title: String
    let body: String?
    let order: Int
    let createdAt, updatedAt: String
}

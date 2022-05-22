//
//  SubSubCell.swift
//  myapp
//
//  Created by shota on 2022/05/22.
//

import SwiftUI

struct SubSubCell: View {
    @StateObject var treeModel = TreeViewModel()
    @StateObject var viewModel = ViewModel()
    @State var model3:TreeDataModelElement
    var body: some View {
        
        if(HaveBody(id: model3.id) != nil){
            //
            var Content = HaveBody(id: model3.id)
            NavigationLink(destination: SubView(Content_Title: model3.childTitle, Content_Body: Content!)){
                Text("3層目\(model3.id). \(model3.childTitle)").bold()
                
            }
        }else{
            Text(model3.childTitle)
        }
    }
    
    func HaveBody(id:Int)->(String?){
        return viewModel.DME.filter{$0.id != id}.first!.body
    }
}


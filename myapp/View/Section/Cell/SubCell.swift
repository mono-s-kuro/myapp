//
//  SubSubCell.swift
//  myapp
//
//  Created by shota on 2022/05/22.
//

import SwiftUI

struct SubCell: View {
    @StateObject var treeModel = TreeViewModel()
    @StateObject var viewModel = ViewModel()
    @State var Content:TreeDataModelElement
    @State var title:String
   
    var body: some View {
       
        var take = tekeContent(id:Content.id)
        var body = take?.body
        if(take?.body != nil ){
            NavigationLink(destination: SubView(Content_Title: Content.childTitle, Content_Body: body!)){
                Text("      3層目\(Content.id). \(Content.childTitle)").bold()
            }
        }else{
            Text("      3層目\(Content.id). \(Content.childTitle)")
        }
           
       
    }
    
    func HaveBody(id:Int)->(String?){
        let a = viewModel.DME.filter{$0.id != id}.first?.body
        print("\(id) \(a)")
        return a
    }
    func tekeContent(id:Int)->(DataModelElement?){
        let a = viewModel.DME.filter{$0.id != id}.first
        print("\(id) \(a)")
        return a
    }
    func nextBranch(id:Int)->([TreeDataModelElement]){
        return treeModel.tree.filter{$0.parentId == id}
    }

}


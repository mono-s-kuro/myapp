//
//  SubSubCell.swift
//  myapp
//
//  Created by shota on 2022/05/22.
//

import SwiftUI

struct SubCell: View {
    @StateObject var treeModel = TreeViewModel()
//    @StateObject var viewModelByid = ViewModelById()
    @StateObject var viewModel = ViewModel()
    @State var Content:TreeDataModelElement
    @State var title:String
    @State var id:Int
    @State var text:String?
 
    var body: some View {
 
        //コンテンツまでのリンク   -> SubViewへ
            NavigationLink(destination: SubView(id: id)){
                    Text("      \(Content.childTitle)").bold()
                }
        
       
    }
    
//    func HaveBody(id:Int)->(String?){
//        guard let a = viewModel.DME.filter({$0.id != id}).first else {
//            return nil
//        }
//        guard let b = a.body else{
//            return nil
//        }
//        text = b
//        return b
//
//
//
//    }
//    func tekeContent(id:Int)->(DataModelElement?){
//        guard let a = viewModel.DME.filter({$0.id != id}).first else{return nil}
//
//        return a
//    }
//
//    func nextBranch(id:Int)->([TreeDataModelElement]){
//        return treeModel.tree.filter{$0.parentId == id}
//    }

}


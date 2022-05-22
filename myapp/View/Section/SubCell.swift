//
//  SubCell.swift
//  acord
//
//  Created by shota on 2022/05/22.
//

import SwiftUI

struct SubCell: View {
    
    @StateObject var treeModel = TreeViewModel()
    @StateObject var viewModel = ViewModel()
    
    @State var Content:TreeDataModelElement
    
    var body: some View {
 
            
        
        if(m1 == nil){
                Text("\(Content.id). "+Content.childTitle)
        }else{
                   
            
                    NavigationLink(destination: SubView(Content_Title: m1!.title, Content_Body: m1!.body!)){
                        Text("\(Content.id). "+m1!.title).bold()
                    }
            
            
            }
        }
    
    func nextBranch(id:Int)->([TreeDataModelElement]){
        return treeModel.tree.filter{$0.parentId == id}
    }
    
}


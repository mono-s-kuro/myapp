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
        
            let m1 = treeModel.tree.filter{$0.parentId == Content.childId}
            ForEach(m1,id: \.self ){ model3 in
                if(viewModel.DME.first{$0.id == model3.id}? != nil){
                    CellContentLink(model3: model3)
                }else{
                    Text(model3.title)
                }
                           
            }
                          
        
        
        
    }
}


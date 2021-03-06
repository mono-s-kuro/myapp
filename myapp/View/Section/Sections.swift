//
//  Sections.swift
//  myapp
//
//  Created by shota on 2022/05/22.
//

import SwiftUI

struct Sections: View {
    @StateObject var treeModel = TreeViewModel()
    @StateObject var viewModel = ViewModel()
    @State var flag = true
    var body: some View {
        //root層
            var m1 = nextBranch(id: 1)
            ForEach(m1,id: \.self ){ model in
            //1階層
                Section(header: SectionHeader(title:model.childTitle)){
                    if (nextBranch(id: model.id).count > 0){
                        
                        
//                        2層目
                        ForEach(treeModel.tree.filter{$0.parentId == model.childId},id: \.self ){ model2 in
                            Section(header: SectionHeader(title:"   "+model2.childTitle)){
                                    var Content = nextBranch(id: model2.id)
                                    ForEach(Content,id: \.self){ model3 in
                                        SubCell(Content: model3, title: model3.childTitle,id: model3.id)
                                    }
                                  
                                }
                        }
                        }else{
                            Text("  "+model.childTitle)
                            
                        }
            
            }
        
              
            
        }
    }
    
    func nextBranch(id:Int)->([TreeDataModelElement]){
        return treeModel.tree.filter{$0.parentId == id}
    }
    func HaveBody(id:Int)->(String?){
        return viewModel.DME.filter{$0.id != id}[0].body
    }
    func Reload(){
        viewModel.fetch()
        treeModel.fetch()
        flag.toggle()
    }
    
    
}

struct Sections_Previews: PreviewProvider {
    static var previews: some View {
        Sections()
    }
}

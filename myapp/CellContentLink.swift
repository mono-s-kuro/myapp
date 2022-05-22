//
//  CellContentLink.swift
//  myapp
//
//  Created by shota on 2022/05/22.
//

import SwiftUI

struct CellContentLink: View {
    @StateObject var treeModel = TreeViewModel()
    @StateObject var viewModel = ViewModel()
    @State var m:[DataModelElement]
    var body: some View {
                
        NavigationLink(destination: SubView(Content_Title: m.title, Content_Body: m.body)){
                            Text(m.title).bold()
                }
        
        }
    
}

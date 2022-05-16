//
//  SubView.swift
//  myapp
//
//  Created by shota on 2022/05/17.
//

import SwiftUI

struct SubView: View {
    @State var Content_Title:String
    @State var Content_Body:String
    
    
    var body: some View {
        List{
            
            TextField("", text:$Content_Title).padding(3)
                        
            TextField("", text: $Content_Body)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.75,alignment: .leading)
                
        }.listRowBackground(Color.blue)
    }
}



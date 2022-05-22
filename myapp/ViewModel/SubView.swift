//
//  SubView.swift
//  myapp
//
//  Created by shota on 2022/05/17.
//

import SwiftUI

struct SubView: View {
    
    @State var id:Int
    @StateObject var viewModelByid = ViewModelById()
    @StateObject var Query = query()
    @State var title = ""
    @State var mybody = ""
    var body: some View {
        
        
        VStack{
            HStack{
                Button(action: {Query.put(title: title, body: self.body as! String, id: id)}){
                    
                        Image("save").frame(width: 15, height: 15)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                   
                    
                }.frame( height: UIScreen.main.bounds.width * 0.10,alignment: .leading)
                
            }.frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.width * 0.2,alignment: .trailing)
            
            List{
                
                TextField("", text: $title).padding(3)
                TextField("", text: $mybody)
                    .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.70,alignment: .leading)
               
               
            }.listRowBackground(Color.blue)
                .onAppear{
                    viewModelByid.fetch(id: id)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        title = viewModelByid.DME.title
                        mybody = viewModelByid.DME.body ?? ""
                    }
                   
                }
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.7)
            

        }
        .frame(width: UIScreen.main.bounds.width * 0.9 , height: UIScreen.main.bounds.width * 0.8 ,alignment: .top)
        
    }
}



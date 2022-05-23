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
                Button(action: {
                    Query.put(title: title, body:mybody , id: id)
                    viewModelByid.fetch(id: id)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        title = viewModelByid.DME.title
                        mybody = viewModelByid.DME.body ?? ""
                    }
                }){
                    
                        Image("save")
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color(red: 76.0/255, green: 176.0/255, blue: 246.0/255))
                   
                    
                }.cornerRadius(10)
               
            }.frame(width: UIScreen.main.bounds.width/2+100,alignment:.trailing)
            List{
                
                TextField("", text: $title).padding(3)
                TextField("", text: $mybody)
                
                    
               
            }.listRowBackground(Color.blue)
                .onAppear{
                    viewModelByid.fetch(id: id)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        title = viewModelByid.DME.title
                        mybody = viewModelByid.DME.body ?? ""
                    }
                   
                }
                

        }
        
    }
}

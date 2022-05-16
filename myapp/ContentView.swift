//
//  ContentView.swift
//  myapp
//
//  Created by shota on 2022/05/14.
//

import SwiftUI
struct ContentView: View{
    @StateObject var viewModel = ViewModel()
//    @StateObject var isSelected = 0
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.DME, id: \.self) { DME in
                    HStack{
                        
                        NavigationLink(destination: SubView(Content_Title: DME.title, Content_Body: isnil(s: DME.body))){
                            Text(DME.title)
                                .bold()
                        }
                    }.padding(3)
                }
            }
            
            .navigationTitle("ServiceName")
                .onAppear{
                    viewModel.fetch()
                }
                
        }
    }
    func isnil (s:String?) -> String{
        if s == nil{
            return ""
        } else {
            return s!
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

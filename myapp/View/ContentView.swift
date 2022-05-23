//
//  ContentView.swift
//  acord
//
//  Created by shota on 2022/05/18.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var treeModel = TreeViewModel()
    @StateObject var viewModel = ViewModel()
    @State public var flag = true
    var body: some View {
        NavigationView{
            VStack{
                
                List{
                    HStack{
                        Text("Service Name").frame(width:150,alignment: .leading)
                        
                        Button(action: {Reload()}){
                            Image(systemName: "network").frame(width: 40, height: 40).foregroundColor(Color.white)
                                .cornerRadius(50)
                                .background(Color(red: 76.0/255, green: 176.0/255, blue: 246.0/255))
                        }.cornerRadius(10)
                        .frame(width: 55, height: 55, alignment: .trailing)
                            
                        
                        
                    }.frame(width:UIScreen.main.bounds.width - 5)
                   
                    //リストの中身:   View/Section/                   ->  1~2階層
                    //              Viwe/Section//Cell/SubCell      ->  ３層目
                    Sections(treeModel: treeModel, viewModel: viewModel)
                }
                .frame(width:UIScreen.main.bounds.width )
    
                .listStyle(SidebarListStyle())
            }
           
        }
        .onAppear{
            treeModel.fetch()
            viewModel.fetch()
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                print(viewModel.DME)
//            }
            
        }
        
    }
    func Reload(){
        flag.toggle()
        treeModel.fetch()
        viewModel.fetch()
    }
   
        }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    

}



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
                    Text("Service Name")
                    //リストの中身:   View/Section/                   ->  1~2階層
                    //              Viwe/Section//Cell/SubCell      ->  ３層目
                    Sections(treeModel: treeModel, viewModel: viewModel)
                }
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



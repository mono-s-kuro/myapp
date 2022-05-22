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
            List{
            Sections(treeModel: treeModel, viewModel: viewModel)
            }
            .listStyle(SidebarListStyle())
        }
        .navigationTitle("ServiceName")
        .onAppear{
            treeModel.fetch()
            viewModel.fetch()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                print(viewModel.DME)
            }
            
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



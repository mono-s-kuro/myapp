//
//  SectionHeader.swift
//  myapp
//
//  Created by shota on 2022/05/22.
//

import SwiftUI

struct SectionHeader: View {
    @State var title:String
    var body: some View {
        HStack{
            Text(title)
        }
    }
}


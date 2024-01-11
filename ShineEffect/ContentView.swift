//
//  ContentView.swift
//  ShineEffect
//
//  Created by FS on 2024/1/11.
//

import SwiftUI

struct ContentView: View {
    @State private var shine: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image(.girl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 280, height: 280)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 50, height: 50), style: .continuous))
                    .shimmering(active: shine)
                    .onTapGesture {
                        shine.toggle()
                    }
            }
            .navigationTitle("Shine Effect")
        }
    }
}

#Preview {
    ContentView()
}

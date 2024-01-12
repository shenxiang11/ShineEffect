//
//  ContentView.swift
//  ShineEffect
//
//  Created by FS on 2024/1/11.
//

import SwiftUI

struct ContentView: View {
    @State private var shine: Bool = false
    @State private var shineBtn = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 100) {
                Button {
                    shineBtn.toggle()
                } label: {
                    Text("立即下载")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 80)
                        .background(.blue, in: .capsule)
                        .shimmering(active: shineBtn)
                        
                }

                
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

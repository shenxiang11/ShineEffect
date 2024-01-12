//
//  Shimmer.swift
//  ShineEffect
//
//  Created by FS on 2024/1/11.
//

import SwiftUI

struct Shimmer: ViewModifier {
    let active: Bool
    
    
    private let gradient = LinearGradient(colors: [
        .clear,
        .clear,
        .white.opacity(0.1),
        .white.opacity(0.35),
        .white.opacity(0.8),
        .white.opacity(0.35),
        .white.opacity(0.1),
        .clear,
        .clear,
    ], startPoint: .leading, endPoint: .trailing)
    
    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { proxy in
                    let size = proxy.size
                    let l = max(size.width, size.height)
                    let scaleY = sqrt(l * l * 2) / size.height
                    
                    RoundedRectangle(cornerSize: .zero)
                        .fill(gradient)
                        .scaleEffect(y: scaleY)
                        .keyframeAnimator(initialValue: 0.0, trigger: active) { content, progress in
                            content
                                .offset(x: -size.width + progress * size.width * 2)
                        } keyframes: { _ in
                            CubicKeyframe(0, duration: 0)
                            CubicKeyframe(1, duration: 1)
                        }
                        .rotationEffect(.degrees(45))
                }
            }
            .mask {
                content
            }
    }
}

extension View {
    func shimmering(active: Bool) -> some View {
        self.modifier(Shimmer(active: active))
    }
}

#Preview {
    ContentView()
}

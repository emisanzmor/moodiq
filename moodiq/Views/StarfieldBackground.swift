//
//  StarfieldBackground.swift
//  moodiq
//
//  Created by Emi Sanzmor on 26/07/25.
//

import SwiftUI


// StarfieldBackground: creates an animated starfield using LazyVGrid for visual effect

struct StarfieldBackground: View {
    @Binding var isAnimating: Bool
    @Binding var showStars: Bool
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 10), spacing: 30) {
                ForEach(0..<400, id: \.self) {
                    index in
                    
                    Circle()
                        .fill(Color.white.opacity(0.5))
                        .frame(width: 3, height: 3)
                        .opacity(showStars ? 1 : 0)
                        .offset(
                            x: isAnimating ? CGFloat.random(in: -40...40) : 0,
                            y: isAnimating ? CGFloat.random(in: -40...40) : 0
                        )
                        .animation(.easeInOut(duration: Double.random(in: 2...4))
                            .repeatForever(autoreverses: true)
                            .delay(Double(index) * 0.01),
                                   value: isAnimating
                        )
                }
            }
        }
    }
}


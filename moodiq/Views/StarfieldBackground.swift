//
//  StarfieldBackground.swift
//  moodiq
//
//  Created by Emi Sanzmor on 26/07/25.
//

import SwiftUI


// StarfieldBackground: creates an animated starfield using LazyVGrid for visual effect

struct StarfieldBackground: View {
    
    // Bindings
    @Binding var isAnimating: Bool
    @Binding var showStars: Bool
  
    
    private let randomData = (0..<400).map { index in
        (x: CGFloat.random(in: -40...40),
         y: CGFloat.random(in: -40...40),
         duration: Double.random(in: 2.0...4.0),
        delay: Double(index) * 0.01)
    }

    
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 10), spacing: 30) {
                ForEach(randomData.indices, id: \.self) {
                    index in
                    
                    let star = randomData[index]
                    
                    Circle()
                        .fill(Color.white.opacity(0.5))
                        .frame(width: 3, height: 3)
                        .opacity(showStars ? 1 : 0)
                        .offset(
                            x: isAnimating ? star.x : 0,
                            y: isAnimating ? star.y : 0
                        )
                        .animation(
                            .easeInOut(duration: star.duration)
                            .repeatForever(autoreverses: true)
                            .delay(star.delay),
                                   value: isAnimating
                        )
                }
            }
        }
    }
    
}


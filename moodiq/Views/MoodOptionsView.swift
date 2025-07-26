//
//  MoodOptionsView.swift
//  moodiq
//
//  Created by Emi Sanzmor on 26/07/25.
//

import SwiftUI

struct MoodOptionsView: View {
    @State private var isAnimating = false
    @State private var showStars = false
    @State private var showOptions = false
    let moodOptions = MoodDataModel.moodOptions
   
    var body: some View {
        ZStack {
            StarfieldBackground(isAnimating: $isAnimating, showStars: $showStars)
            
            
            VStack (spacing: 15){
                ForEach(Array(moodOptions.enumerated()), id: \.element.title) { index, option in
                    Text(option.title.uppercased())
                        .foregroundColor(.white)
                        .font(.custom("HelveticaNeue-Medium", size: 25))
                        .opacity(showOptions ? 1 : 0)
                    
                    // TODO: - Update text entry animation
                    
                        .animation(.easeInOut(duration: 2.8).delay(Double(index) * 0.1), value: showOptions)
                }
                
                
            }
            
            
            
            
            
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
                showStars = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                showOptions = true
            }
        }
    }
}

#Preview {
    MoodOptionsView()
}

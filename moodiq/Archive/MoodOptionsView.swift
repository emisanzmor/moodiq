//
//  MoodOptionsView.swift
//  moodiq
//
//  Created by Emi Sanzmor on 26/07/25.
//


// ALTERNATIVE OPTION FOR MOOD OPTION VIEW:

/*

import SwiftUI

struct MoodOptionsView: View {
    @State private var isAnimating = false
    @State private var showStars = false
    @State private var showOptions = false
    let moodOptions = MoodDataModel.moodOptions
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            
            VStack (spacing: 16){
                ForEach(Array(moodOptions.enumerated()), id: \.element.title) { index, option in
                    HStack {
                        if index % 2 == 0 {
                            Button(action: {
                                // TODO: - Add action
                            }) {
                                
                                Text(option.title)
                                    .padding(.leading, 50)
                                    .fontWeight(.light)
                                    .font(.custom("HelveticaNeue", size: 20))
                                Spacer()
                            }
                            
                        } else {
                            Spacer()
                            Button(action: {
                                // TODO: - Add action
                            }) {
                                Text(option.title)
                                    .padding(.trailing, 50)
                                    .fontWeight(.light)
                                    .font(.custom("HelveticaNeue", size: 20))
                            }
                            
                        }
                    }
                    .foregroundColor(.white)
                    .font(.custom("HelveticaNeue", size: 25))
                    .opacity(showOptions ? 1 : 0)
                    .animation(.easeInOut(duration: 3).delay(Double(index) * 0.5), value: showOptions)
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

*/

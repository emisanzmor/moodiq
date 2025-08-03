//
//  NoteEntryView.swift
//  moodiq
//
//  Created by Emi Sanzmor on 30/07/25.
//

import SwiftUI

struct NoteEntryView: View {
    @State private var isAnimating = false
    @State private var showStars = false
    @State private var noteText:String = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ZStack {
                StarfieldBackground(isAnimating: $isAnimating, showStars: $showStars)
                
                VStack {
                    ZStack {
                        if noteText.isEmpty {
                            
                            Text("what's on your mind?")
                                .foregroundColor(.gray.opacity(0.3))
                                .font(.custom("HelveticaNeue", size: 17))
                                .fontWeight(.light)
                                
                            
                        }
                        
                        TextEditor(text: $noteText)
                            .foregroundColor(.white)
                            .font(.custom("HelveticaNeue", size: 17))
                            .fontWeight(.light)
                            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                            .frame(maxWidth: 350, maxHeight:500)
                            .background(Color.gray.opacity(0.02))
                            .cornerRadius(20)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke( Color.white.opacity(0.1), style: StrokeStyle (lineWidth: 1, dash: [10]))
                            })
                            .padding()
                            .scrollContentBackground(.hidden)
                    }
                    
                }.padding(.bottom, 200)
                
            }
        }.onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
                showStars = true
            }
        }
    }
}

#Preview {
    NoteEntryView()
}

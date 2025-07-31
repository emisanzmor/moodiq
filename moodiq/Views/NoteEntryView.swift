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
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ZStack {
                StarfieldBackground(isAnimating: $isAnimating, showStars: $showStars)
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

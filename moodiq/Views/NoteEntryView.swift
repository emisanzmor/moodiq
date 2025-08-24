//
//  NoteEntryView.swift
//  moodiq
//
//  Created by Emi Sanzmor on 30/07/25.
//

import SwiftUI

struct NoteEntryView: View {
    @State private var titleText: String = ""
    @State private var noteText: String = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ZStack {
                
                
                ScrollView {
                    VStack(spacing: 24) {
                        
                        // Date Header
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Saturday, 15 Jan")
                                    .font(.custom("HelveticaNeue", size: 28))
                                    .fontWeight(.light)
                                    .foregroundColor(.white)
                                
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                // Save action
                            }) {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(.gray.opacity(0.9))
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 20)
                        
                        VStack(spacing: 0) {
                            
                            // Title Section
                            VStack(spacing: 0) {
                                ZStack(alignment: .topLeading) {
                                    
                                    if titleText.isEmpty {
                                        Text("Title")
                                        
                                            .foregroundColor(.gray.opacity(0.4))
                                            .font(.custom("HelveticaNeue", size: 20))
                                            .fontWeight(.light)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24))
                                    }
                                    
                                    TextEditor(text: $titleText)
                                        .foregroundColor(.white)
                                        .font(.custom("HelveticaNeue", size: 20))
                                        .fontWeight(.light)
                                        .padding(EdgeInsets(top: 18, leading: 20, bottom: 18, trailing: 20))
                                        .frame(minHeight: 60)
                                        .background(Color.clear)
                                        .scrollContentBackground(.hidden)
                                }
                            }
                            
                            HStack {
                                Rectangle()
                                    .fill(Color.white.opacity(0.05))
                                    .frame(height: 0.5)
                            }
                            .padding(.horizontal, 24)
                            
                            // Note Section
                            VStack(spacing: 0) {
                                ZStack(alignment: .topLeading) {
                                    
                                    if noteText.isEmpty {
                                        VStack(alignment: .leading, spacing: 8) {
                                            Text("What's on your mind?")
                                                .foregroundColor(.gray.opacity(0.4))
                                                .font(.custom("HelveticaNeue", size: 18))
                                                .fontWeight(.light)
                                            
                                            
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24))
                                    }
                                    
                                    TextEditor(text: $noteText)
                                        .foregroundColor(.white)
                                        .font(.custom("HelveticaNeue", size: 18))
                                        .fontWeight(.light)
                                        .padding(EdgeInsets(top: 18, leading: 20, bottom: 24, trailing: 20))
                                        .frame(minHeight: 200)
                                        .background(Color.clear)
                                        .scrollContentBackground(.hidden)
                                }
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                                .fill(Color.gray.opacity(0.05))
                        )
                        .padding(.horizontal, 20)
                        
                        // Bottom buttons
                        HStack(spacing: 16) {
                            Button(action: {
                                // Add Song action
                            }) {
                                HStack(spacing: 8) {
                                    Image(systemName: "music.note")
                                    
                                    Text("Add Song")
                                        .font(.custom("HelveticaNeue", size: 14))
                                        .fontWeight(.light)
                                }
                                
                                .foregroundColor(.white.opacity(0.6))
                                .padding(.horizontal, 20)
                                .padding(.vertical, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(Color.white.opacity(0.04))
                                    
                                )
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                // Add Mood action
                            }) {
                                HStack(spacing: 8) {
                                    
                                    Image(systemName: "face.smiling")
                                    
                                    
                                    Text("Add Mood")
                                        .font(.custom("HelveticaNeue", size: 14))
                                        .fontWeight(.light)
                                }
                                
                                .foregroundColor(.white.opacity(0.6))
                                .padding(.horizontal, 20)
                                .padding(.vertical, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(Color.white.opacity(0.04))
                                    
                                )
                                
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 40)
                        
                    }
                }
            }
        }
        
    }
}

#Preview {
    NoteEntryView()
}

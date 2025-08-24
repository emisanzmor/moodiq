import SwiftUI

// MARK: - Main Menu View

struct MenuView: View {
    @State private var showText = false
    @State private var showMoodView = false
    
    
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ZStack {
                
                VStack (spacing: 8) {
                    Text("How do you")
                        .font(.custom("HelveticaNeue", size: 28))
                        .foregroundColor(.white)
                        .fontWeight(.light)
                    
                    Text("feel today?")
                        .font(.custom("HelveticaNeue", size: 28))      .foregroundColor(.white)
                        .fontWeight(.light)
                    
                    
                }
                .opacity(showText ? 1 : 0)
                .animation(.easeInOut(duration: 1.5), value: showText)
            }
            .opacity(showMoodView ? 0 : 1)
            .animation(.easeInOut(duration: 1.2), value: showMoodView)
            
            // MoodOptionView is always visible, its opacity is controlled by showMoodView to create a crossfade transition between views
            MoodOptionView()
                .opacity(showMoodView ? 1 : 0)
                .animation(.easeInOut(duration: 2.0), value: showMoodView)
            
        } .onAppear{
            introAnimations()
        }
    }
    
    private func introAnimations() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            showText = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
            showMoodView = true
        }
        
    }
}

// MARK: - Preview
#Preview {
    MenuView()
}



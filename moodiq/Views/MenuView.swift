import SwiftUI

// MARK: - Stars Menu animation

struct MenuView: View {
    @State private var isAnimating = false
    @State private var showText = false
    @State private var showStars = false
    
     
    var body: some View {
        ZStack {
            StarfieldBackground(isAnimating: $isAnimating, showStars: $showStars)
            
            VStack (spacing: 8) {
                Text("How do you")
                    .font(.custom("HelveticaNeue", size: 28))
                    .foregroundColor(.white)
                
                Text("feel today?")
                    .font(.custom("HelveticaNeue", size: 28))      .foregroundColor(.white)
                
            }
            
            
            
            .opacity(showText ? 1 : 0)
            .animation(.easeInOut(duration: 1.5), value: showText)
            
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
                showStars = true
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                showText = true
            }
        }
    }
}

// MARK: - Preview
#Preview {
    MenuView()
}



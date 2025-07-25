import SwiftUI

// MARK: - Stars Menu animation

struct MenuView: View {
    @State private var isAnimating = false
    @State private var showText = false
    @State private var showStars = false
    @State private var navigateToMood = false
    @State private var showTapToContinue = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    navigateToMood = true
                }
            
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



import SwiftUI

// MARK: - Stars Menu animation

struct MenuView: View {
    @State private var isAnimating = false
    @State private var showText = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 10), spacing: 30) {
                ForEach(0..<400, id: \.self) {
                    index in
                    
                    Circle()
                        .fill(Color.white.opacity(0.5))
                        .frame(width: 3, height: 3)
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
                    .font(.system(size: 30, weight: .medium))
                    .foregroundColor(.white)
                
                Text("feel today?")
                    .font(.system(size: 30, weight: .medium))
                    .foregroundColor(.white)
            }
            
            // TODO: Fix text start animation
            /*.opacity(showText ? 1 : 0)
             .animation(.easeInOut(duration: 1.5), value: showText)*/
            
        }.onAppear{
            isAnimating = true
            
            // TODO: Fix text start animation
            /*DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
             showText = true
             }*/
        }
    }
}

// MARK: - Preview
#Preview {
    MenuView()
}



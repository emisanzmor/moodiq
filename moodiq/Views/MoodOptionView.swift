import SwiftUI

struct MoodOptionView: View {
    @State private var selectedMood: String = ""
    let moodOptions = MoodDataModel.moodOptions
    @State private var isAnimating = false
    @State private var showStars = false
    @State private var navigateToNote = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                StarfieldBackground(isAnimating: $isAnimating, showStars: $showStars)
                
                VStack (spacing: 10){
                    Picker("Mood", selection: $selectedMood) {
                        ForEach(moodOptions, id: \.title) {
                            option in
                            
                            Text(option.title)
                                .foregroundColor(.white)
                                .tag(option.title)
                                .fontWeight(.light)
                                .font(.custom("HelveticaNeue", size: 20))
                        }
                        
                    }.pickerStyle(WheelPickerStyle())
                        .frame(width: 150)
                    
                   
                    
                    // TODO: - Improve continue button style
                    Button {
                        navigateToNote = true
                    } label: {
                        Text("continue")
                            .font(.custom("HelveticaNeue", size: 14))
                            .foregroundColor(.white.opacity(0.7))
                            .underline()
                            .kerning(0.5)
                        
                        
                    }.disabled(selectedMood.isEmpty)
                    
                }.padding(.bottom, 50)
            } .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.showStars = true
                    self.isAnimating = true
                }
                
            }.navigationDestination(isPresented: $navigateToNote) { NoteEntryView()
                    .navigationBarHidden(true)
            }
        }
        
    }
}

#Preview {
    MoodOptionView()
}

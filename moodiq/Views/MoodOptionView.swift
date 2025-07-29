import SwiftUI

struct MoodOptionView: View {
    @State private var selectedMood: String = ""
    let moodOptions = MoodDataModel.moodOptions
    @State private var isAnimating = false
    @State private var showStars = false
    
    var body: some View {
        ZStack {
            StarfieldBackground(isAnimating: $isAnimating, showStars: $showStars)
            
            VStack {
                Picker("Mood", selection: $selectedMood) {
                    ForEach(moodOptions, id: \.title) {
                        option in
                        
                        Text(option.title)
                            .foregroundColor(.white)
                            .tag(option.title)
                    }
                    
                }.pickerStyle(WheelPickerStyle())            }
        } .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.showStars = true
                self.isAnimating = true
            }
        
        }
           
    }
}

#Preview {
    MoodOptionView()
}

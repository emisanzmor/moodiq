import SwiftUI

struct MoodOptionView: View {
    @State private var selectedMood: String = ""
    let moodOptions = MoodDataModel.moodOptions
    @State private var navigateToNote = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
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
                        Text("Continue")
                            .font(.custom("HelveticaNeue", size: 14))
                            .fontWeight(.light)
                            .foregroundColor(.white.opacity(0.7))
                        
                        
                    }.disabled(selectedMood.isEmpty)
                    
                }.padding(.bottom, 50)
            } .navigationDestination(isPresented: $navigateToNote) { NoteEntryView()
                    .navigationBarHidden(true)
            }
        }
        
    }
}

#Preview {
    MoodOptionView()
}

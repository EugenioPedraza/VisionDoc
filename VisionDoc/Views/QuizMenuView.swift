import SwiftUI
import RealityKit


struct QuizMenuView: View {
    
    var bodySystems: BodySystem
    @State private var selectedAnatomy: BodySystem?
    @State private var bounce = false
    @State private var rotationAngle: CGFloat = 0
    @State var showModel: Bool = false
    
    var body: some View {
        
        Text("Test your knowledge")
            .font(.system(size: 50))
            .fontWeight(.bold)

        Divider()
            HStack{
                NavigationSplitView{
                    ScrollView{
                        ForEach(arrBodySystems) {bodySystem in
                            BodyRow(bodySystem: bodySystem, onSelect: {selectedSystem in
                                self.selectedAnatomy = selectedSystem})
                        }
                    }

                } detail: {
                    VStack(alignment: .leading){
                        if selectedAnatomy != nil {
                            quizView(difficulty: .easy, selectedAnatomy: selectedAnatomy)
                            
                        } else {
                            Text("Choose an Anatomy System to take quiz")
                                .font(.system(size: 30))
                                .fontWeight(.light)
                                .padding(15)
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
        }
    }
    
}
    

#Preview {
        QuizMenuView(bodySystems: arrBodySystems[1])
}

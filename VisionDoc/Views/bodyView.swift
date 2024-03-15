
import SwiftUI

struct bodyView: View {
    var bodySystem: BodySystem
    @State private var rotationAngle: CGFloat = 0

    var body: some View {
        ZStack{
            VStack(alignment: .center) {
                SceneKitModelView(modelName: bodySystem.modelName, rotationAngle: rotationAngle)
                    .frame(width: 150, height: 150)
                    .onTapGesture {
                        withAnimation {
                            rotationAngle += (.pi*2) * 10
                        }
                    }
            }
        }
        .padding()
        .glassBackgroundEffect()
            .foregroundColor(.white)
            .fontWeight(.medium)
            .font(.system(size: 35))
    }
}


struct systemsMenu3D_Previews: PreviewProvider {
    static var previews: some View {
        systemsMenu3D(bodySystems: arrBodySystems[0])
    }
}

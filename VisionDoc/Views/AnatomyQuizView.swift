import SwiftUI
import SceneKit

struct AnatomyQuizView: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                quizContentView
            }
        }
        .onAppear {
            viewModel.loadSystems()
        }
    }

    private var quizContentView: some View {
        GeometryReader { geometry in
            HStack(spacing: 20) {
                labelColumn
                ZStack {
                    SceneKitView(sceneName: viewModel.currentSystem?.imageName ?? "")
                        .frame(width: 600, height: 600)
                        .cornerRadius(10)
                        .overlay(dropZoneOverlay, alignment: .topLeading)

                    ForEach(viewModel.currentSystem?.labels ?? [], id: \.self) { label in
                        labelView(label, system: viewModel.currentSystem!)
                    }
                }
                nextSystemButton
            }
        }
        .padding()
    }

    private var labelColumn: some View {
        VStack(alignment: .leading) {
            Text("Drag the labels to the correct organ")
                .font(.headline)
                .padding()
        }
        .frame(minWidth: 200, alignment: .leading)
    }

    private var dropZoneOverlay: some View {
        GeometryReader { geometry in
            ForEach(viewModel.currentSystem?.dropZones ?? [], id: \.label) { zone in
                Rectangle()
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 100, height: zone.height)
                    .position(x: CGFloat(zone.positionX) + geometry.size.width * 0.5, y: CGFloat(zone.positionY))
            }
        }
    }

    private var nextSystemButton: some View {
        Button(action: {
            viewModel.moveToNextSystem()
        }) {
            Text("Next System")
                .bold()
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }

    private func labelView(_ label: String, system: AnatomySystem) -> some View {
        Text(label)
            .padding()
            .background(viewModel.isLabelCorrect[label] ?? false ? Color.green : Color.blue)
            .cornerRadius(5)
            .position(viewModel.labelPositions[label] ?? CGPoint(x: 100, y: 100))
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        viewModel.labelPositions[label] = gesture.location
                    }
                    .onEnded { gesture in
                        viewModel.finalizeLabelPosition(label: label, position: gesture.location, system: system)
                    }
            )
            .zIndex(2) // Ensures labels are always on top
    }
}

struct SceneKitView: UIViewRepresentable {
    let sceneName: String

    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        scnView.scene = SCNScene(named: sceneName) ?? SCNScene()
        scnView.autoenablesDefaultLighting = true
        scnView.allowsCameraControl = false
        scnView.backgroundColor = UIColor.clear
        setupCamera(scnView)
        return scnView
    }

    func updateUIView(_ scnView: SCNView, context: Context) {}

    private func setupCamera(_ scnView: SCNView) {
        let camera = SCNCamera()
        camera.zFar = 1000
        camera.zNear = 1
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 50)
        scnView.scene?.rootNode.addChildNode(cameraNode)
        cameraNode.look(at: SCNVector3(0, 0, 0))
    }
}

struct AnatomyQuizView_Previews: PreviewProvider {
    static var previews: some View {
        AnatomyQuizView(viewModel: QuizViewModel())
    }
}

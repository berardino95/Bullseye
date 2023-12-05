
import SwiftUI

struct BEBlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(22)
            .font(.title2)
            .foregroundStyle(.white)
            .background(
                ZStack{
                    Color.buttonColor
                    LinearGradient.buttonGradient
                }
            )
            .clipShape ( RoundedRectangle(cornerRadius: 22, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .strokeBorder(.white, lineWidth: Constants.General.strokeWidth)
            }
            .opacity(configuration.isPressed ? 0.3 : 1)
    }
}

extension ButtonStyle where Self == BEBlueButton {
    static var beBlueButton: Self {
        return .init()
    }
}


#Preview{
    ZStack{
        Color.gray
            .ignoresSafeArea()
        Button("Hit me") {}
            .buttonStyle(.beBlueButton)
    }
    
}





import SwiftUI

struct RoundedImageViewStroked: View {
    var symbol: String
    var body: some View {
        Image(systemName: symbol)
            .font(.title)
            .padding(20)
            .foregroundStyle(.text)
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay {
                Circle()
                    .strokeBorder(.roundedButtonStroke, lineWidth: Constants.General.strokeWidth)
            }
    }
}

struct RoundedImageViewFilled: View {
    var symbol: String
    var body: some View {
        Image(systemName: symbol)
            .font(.title)
            .padding(20)
            .foregroundStyle(.circleFilledButtonText)
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(.circleFilledButtonBackground)
            .clipShape(Circle())
    }
}

struct RoundedRectTextView:View {
    var text: String
    var body: some View {
        Text(text)
            .font(.title2)
            .kerning(-0.2)
            .bold()
            .frame(width: Constants.General.roundedViewWidth, height: Constants.General.roundedViewHeight)
            .overlay {
                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius, style: .continuous)
                    .strokeBorder(.roundedButtonStroke ,lineWidth: Constants.General.strokeWidth)
            }
    }
}

struct RoundedTextView:View {
    var text: Int
    var body: some View {
        Text(String(text))
            .font(.title3)
            .bold()
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background {
                Circle()
                    .strokeBorder(.leaderBoardRow, lineWidth: Constants.General.strokeWidth)
            }
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 50){
            HStack(spacing: 50){
                RoundedImageViewStroked(symbol: "arrow.counterclockwise")
                RoundedImageViewFilled(symbol: "arrow.counterclockwise")
            }
            
            HStack(spacing: 50){
                RoundedImageViewStroked(symbol: "list.bullet")
                RoundedImageViewFilled(symbol: "list.bullet")
            }
            
            HStack(spacing: 50){
                RoundedRectTextView(text: "999")
                RoundedRectTextView(text: "12")
            }
            
            HStack(spacing: 50){
                RoundedTextView(text: 1)
                RoundedTextView(text: 12)
            }
        }
    }
}

#Preview {
    PreviewView()
}

#Preview {
    PreviewView()
        .preferredColorScheme(.dark)
}

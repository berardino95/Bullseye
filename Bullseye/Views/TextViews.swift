
import SwiftUI

struct InstructionsText: View {
  var text: String
  var body: some View {
    Text(text.uppercased())
      .multilineTextAlignment(.center)
      .font(.subheadline).bold()
      .lineSpacing(10)
      .kerning(2)
      .foregroundStyle(.text)
  }
}

struct BigNumberText: View {
  var target: String
  var body: some View {
    Text(target)
      .kerning(-1.0)
      .font(.largeTitle)
      .fontWeight(.black)
      .foregroundStyle(.text)
  }
}

struct SliderLabelText: View {
  var text: String
  var body: some View {
    Text(text)
      .bold()
      .foregroundStyle(.text)
  }
}

struct LabelText: View {
  var text: String
  var body: some View {
    Text(text.uppercased())
      .foregroundStyle(.text)
      .bold()
      .font(.footnote)
      .kerning(1.5)
  }
}

struct BodyText: View {
  var text: String
  var body: some View {
    Text(text)
      .foregroundStyle(.text)
      .bold()
      .font(.subheadline)
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .lineSpacing(15)
  }
}

struct ButtonText: View {
  var text: String
  var body: some View {
    Text(text)
      .foregroundStyle(.white)
      .padding(.vertical, 14)
      .font(.title3)
      .bold()
      .frame(maxWidth: .infinity)
      .background(
        Color.accentColor
      )
      .clipShape( .rect(cornerRadius: 12, style: .continuous))
  }
}

#Preview{
  VStack(spacing: 20){
    InstructionsText(text: "Instructions")
    BigNumberText(target: "999")
    SliderLabelText(text: "1")
    LabelText(text: "Score")
    BodyText(text: "You scored 200 point \n 🎉🎉🎉")
    ButtonText(text: "Start New Round")
  }
  .padding(.horizontal, 40)
}

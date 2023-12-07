
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
            .font(.caption)
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

struct ScoreText: View {
    var score: Int
    var body: some View {
        Text("\(score)")
            .font(.title3)
            .kerning(-0.2)
            .foregroundStyle(.text)
            .bold()
    }
}

struct DateText: View {
    var date: Date
    var body: some View {
        Text(date, style: .time)
            .font(.title3)
            .kerning(-0.2)
            .foregroundStyle(.text)
            .bold()
    }
}

struct BigBoldText: View {
    let text: String
    var body: some View {
        Text(text.uppercased())
            .font(.title)
            .fontWeight(.black)
            .kerning(2)
            .foregroundStyle(.text)
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
        ScoreText(score: 459)
        DateText(date: Date())
        BigBoldText(text: "Leaderboard")
    }
    .padding(.horizontal, 40)
}

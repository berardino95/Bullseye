import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderboardIsPresented: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack(spacing: 10){
                HeaderView(leaderboardIsPresented: $leaderboardIsPresented)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices, id: \.self) { index in
                            let score = game.leaderboardEntries[index].score
                            let date = game.leaderboardEntries[index].date
                            RowView(index: index + 1, score: score, date: date)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding()
        }
    }
}

struct HeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderboardIsPresented: Bool
    
    var body: some View {
        let iPhoneIsPortrait = verticalSizeClass == .regular && horizontalSizeClass == .compact
        ZStack{
            HStack{
                BigBoldText(text: "Leaderboard")
                if iPhoneIsPortrait {
                    Spacer()
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    leaderboardIsPresented = false
                }, label: {
                    RoundedImageViewFilled(symbol: "xmark")
                })
            }
        }
        .padding(.vertical, 10)
        
    }
}

struct LabelView: View {
    var body: some View {
        HStack{
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }
        .frame(maxWidth:Constants.Leaderboard.maxRowWidth)
    }
}


struct RowView: View {
    
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack(spacing: 0){
            RoundedTextView(text: index)
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(.leaderBoardRow ,lineWidth: Constants.General.strokeWidth)
        )
        .frame(maxWidth:Constants.Leaderboard.maxRowWidth)
    }
}


struct LeaderboardView_Previews: PreviewProvider {
    static private var leaderboardIsPresented = Binding.constant(true)
    static private var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        LeaderBoardView(leaderboardIsPresented: leaderboardIsPresented, game: game)
            .preferredColorScheme(.dark)
        
        LeaderBoardView(leaderboardIsPresented: leaderboardIsPresented, game: game)
            .previewInterfaceOrientation(.landscapeRight)
    }
}


import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
        
    }
}

struct TopView: View {
    @State private var leaderboardIsPresented = false
    @Binding var game: Game
    
    var body: some View {
        HStack{
            Button { game.restart() } label: {
                RoundedImageViewStroked(symbol: "arrow.counterclockwise")
            }
            Spacer()
            Button {
                leaderboardIsPresented = true
            } label: {
                RoundedImageViewFilled(symbol: "list.bullet")
            }
            .disabled(game.leaderboardEntries.isEmpty)
            .opacity(game.leaderboardEntries.isEmpty ? 0.8 : 1)
            .sheet(isPresented: $leaderboardIsPresented, content: {
                LeaderBoardView(leaderboardIsPresented: $leaderboardIsPresented, game: $game)
            })
        }
    }
}

struct numberView: View {
    var title: String
    var score: String
    
    var body: some View {
        VStack(spacing: 5){
            LabelText(text: title)
            RoundedRectTextView(text: score)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack{
            numberView(title: "Score", score: String(game.score))
            Spacer()
            numberView(title: "Round", score: String(game.round))
        }
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    var opacity : Double { colorScheme == .light ? 0.3 : 0.1 }
    
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                Circle()
                    .stroke(lineWidth: 20)
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [.circle.opacity(0.8 * opacity), .circle.opacity(0)]), center: .center, startRadius: 100, endRadius: 300)
                    )
                    .frame(width: size, height: size)
            }
        }
    }
}

#Preview {
    BackgroundView(game: .constant(Game()))
}

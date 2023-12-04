//Figma link https://www.figma.com/file/3MBMeYd2hP4rajTbHnZL0z/Bullseye?node-id=6%3A15&mode=dev

import SwiftUI

struct ContentView: View {
  
  @State private var alertIsShowed = false
  @State private var sliderValue = 50.0
  @State private var game = Game()
  
  var body: some View {
    ZStack {
      
      BackgroundView(game: $game)
      
      VStack{
        InstructionView(game: $game)
          .padding(.bottom, alertIsShowed ? 0 : 100)
        
        if alertIsShowed {
          PointsView(alertIsShowed: $alertIsShowed, sliderValue: $sliderValue, game: $game)
            .transition(.slide.combined(with: .opacity))
        } else {
          HitMeButton(alertIsShowed: $alertIsShowed, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        }
      }
      
      if !alertIsShowed{
        SliderView(sliderValue: $sliderValue)
          .zIndex(1)
          .transition(.asymmetric(insertion: .scale, removal: .opacity))
      }
    }
  }
}

struct InstructionView: View {
  @Binding var game: Game
  var body: some View {
    VStack{
      InstructionsText(text: "🎯🎯🎯🎯 \n Put the bullseye as you can to")
      BigNumberText(target: String(game.target))
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  var body: some View {
    HStack{
      SliderLabelText(text: "1")
        .frame(width: 35)
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
        .frame(width: 35)
    }
    .padding()
  }
}

struct HitMeButton: View {
  
  @Binding var alertIsShowed: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    Button("Hit me".uppercased()) {
      withAnimation {
        alertIsShowed = true
      }
    }
    .buttonStyle(.beBlueButton)
  }
}


#Preview {
  ContentView()
}

#Preview {
  ContentView()
    .preferredColorScheme(.dark)
}


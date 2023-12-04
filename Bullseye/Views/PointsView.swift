//
//  PointsView.swift
//  Bullseye
//
//  Created by Berardino Chiarello on 04/12/23.
//

import SwiftUI

struct PointsView: View {
  
  @Binding var alertIsShowed: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.calculatePoint(sliderValue: roundedValue)
    
    VStack(spacing: 15){
      InstructionsText(text: "The slider'e value is")
      BigNumberText(target: "\(roundedValue)")
      BodyText(text: "You scored \(points) Points\n 🎉🎉🎉")
      
      Button(action: {
        withAnimation {
          game.startNewRound(points: game.calculatePoint(sliderValue: Int(sliderValue)))
          alertIsShowed = false
        }
      }, label: {
        ButtonText(text: "Start New Round")
      })
    }
    .padding()
    .frame(maxWidth: 300)
    .background( Color.background )
    .clipShape(.rect(cornerRadius: Constants.General.roundedRectCornerRadius, style: .continuous))
    .shadow(radius: 10, x: 5)
  }
}

#Preview {
  PointsView(alertIsShowed: .constant(true), sliderValue: .constant(50), game: .constant(Game()))
}

#Preview {
  PointsView(alertIsShowed: .constant(true), sliderValue: .constant(50), game: .constant(Game()))
    .preferredColorScheme(.dark)
    .previewInterfaceOrientation(.landscapeLeft)
}

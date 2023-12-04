import SwiftUI

extension LinearGradient {
  
  static var buttonGradient: LinearGradient {
    LinearGradient(colors: [.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
  }
  
}

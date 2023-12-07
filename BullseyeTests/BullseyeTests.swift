import XCTest
@testable import Bullseye

final class BullseyeTests: XCTestCase {
  var game: Game!
  
  override func setUpWithError() throws {
    game = Game()
  }
  
  override func tearDownWithError() throws {
    game = nil
  }
  
  func testScorePositive() {
    let guess = game.target + 5 //Simulating a player guess 5 point bigger, es the game target is 50 and the user enter 55
    let score = game.calculatePoint(sliderValue: guess) //Calculating the point with the guess
    XCTAssertEqual(score, 95) //Test is the point are calculate in the right way. 100 for a right answer, -1 point for every point of distance from the right answer
  }
  
  func testScoreNegative() {
    let guess = game.target - 5 //Simulating a player guess 10 points smaller, es the game target is 90 and the user enter 80
    let score = game.calculatePoint(sliderValue: guess) //Calculating the point with the guess
    XCTAssertEqual(score, 95) //Test is the point are calculate in the right way. 100 for a right answer, -1 point for every point of distance from the right answer
  }
  
  func testPerfectScore() {
    let guess = game.target
    let score = game.calculatePoint(sliderValue: guess)
    XCTAssertEqual(score, 200)
  }
  
  func testScoreClose() {
    let guess = game.target + 2
    let score = game.calculatePoint(sliderValue: guess)
    XCTAssertEqual(score, 98 + 50)
  }
  
  func testNewRound() {
    game.startNewRound(points: 100)
    XCTAssertEqual(game.score, 100)
    XCTAssertEqual(game.round, 2)
  }
  
  func testRestartGame() {
    game.startNewRound(points: 100)
    XCTAssertEqual(game.score, 100)
    XCTAssertEqual(game.round, 2)
    
    let target = game.target
    game.restart()
    XCTAssertEqual(game.round, 1)
    XCTAssertEqual(game.score, 0)
    XCTAssertNotEqual(target, game.target)
  }
    
    func testLeaderboard() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.leaderboardEntries.count, 1)
        XCTAssertEqual(game.leaderboardEntries[0].score, 100)
        game.startNewRound(points: 200)
        XCTAssertEqual(game.leaderboardEntries.count, 2)
        XCTAssertEqual(game.leaderboardEntries[0].score, 200) //Array must be ordered
        XCTAssertEqual(game.leaderboardEntries[1].score, 100)
    }
  
}

import Foundation

struct Game {
    var target: Int = Int.random(in: 0...100)
    var score: Int = 0
    var round: Int = 1
    var leaderboardEntries = [LeaderboardEntry]()
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            addToLeaderBoard(score: 200)
            addToLeaderBoard(score: 500)
            addToLeaderBoard(score: 20)
            addToLeaderBoard(score: 10)
            addToLeaderBoard(score: 5)
        }
    }
    
    func calculatePoint(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        let bonus: Int
        
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return 100 - difference + bonus
    }
    
    mutating func startNewRound(points: Int){
        addToLeaderBoard(score: points)
        score += points
        round += 1
        target = Int.random(in: 0...100)
    }
    
    mutating func restart(){
        score = 0
        round = 1
        target = Int.random(in: 0...100)
    }
    
    mutating func addToLeaderBoard(score: Int){
        leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        leaderboardEntries.sort(by: >)
    }
}

struct LeaderboardEntry: Comparable, Hashable  {
    let score: Int
    let date: Date
    
    static func < (lhs: LeaderboardEntry, rhs: LeaderboardEntry) -> Bool {
        lhs.score < rhs.score
    }
}

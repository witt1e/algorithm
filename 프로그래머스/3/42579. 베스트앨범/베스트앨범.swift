import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var genrePlayCounts: [String: Int] = [:]
    
    var songsByGenre: [String: [(index: Int, plays: Int)]] = [:]

    for (index, genre) in genres.enumerated() {
        let play = plays[index]
        genrePlayCounts[genre, default: 0] += play
        songsByGenre[genre, default: []].append((index, play))
    }

    let sortedGenres = genrePlayCounts.sorted { $0.value > $1.value }.map { $0.key }

    var result: [Int] = []

    for genre in sortedGenres {
        let sortedSongs = songsByGenre[genre]!.sorted {
            if $0.plays == $1.plays {
                return $0.index < $1.index
            } else {
                return $0.plays > $1.plays
            }
        }

        result += sortedSongs.prefix(2).map { $0.index }
    }

    return result
}
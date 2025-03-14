import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var graph = [String: [String]]()
    
    // 그래프 생성 (사전순 정렬을 위해 reverse)
    for ticket in tickets.sorted(by: { $0[1] < $1[1] }) {
        graph[ticket[0], default: []].append(ticket[1])
    }
    
    var route: [String] = []
    
    func dfs(_ airport: String) {
        while let destinations = graph[airport], !destinations.isEmpty {
            let next = graph[airport]!.removeFirst()  // 알파벳 순서대로 pop
            dfs(next)
        }
        route.append(airport) // 경로 추가 (백트래킹)
    }
    
    dfs("ICN")
    return route.reversed()  // DFS 결과 역순 반환
}
//
//  profile.swift
//  quest3
//
//  Created by Knapptan on 27.01.2024.
//

import Foundation

class Profile {
    enum Status {
        case IN_PLAY
        case SEARCH
        case IDLE
        case OFFLINE
    }
    
    let id = UUID()
    var nickname: String? = "Nickname"
    var age: Int? = 0
    var name: String? = "Name"
    var revolver: RevolverMoonClip?
    let profileCreationDate: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: Date())
    }()
    var status: Status = .OFFLINE
    lazy var link: String = {
        guard let nickname = nickname else { return "" }
        return "http://gameserver.com/\(id)-\(nickname)"
    }()
    var playerActionDelegate: PlayerAction?

    init(nickname: String? = nil, age: Int? = nil, name: String? = nil, revolver: RevolverMoonClip? = nil, status: Status, playerActionDelegate: PlayerAction? = nil) {
        self.nickname = nickname
        self.age = age
        self.name = name
        self.revolver = revolver
        self.status = status
        self.playerActionDelegate = playerActionDelegate
    }
    
    func Search() {
        print("\nSearcherProfile:")
        print("(Profile\"\(String(describing: nickname!))\", \(String(describing: status)))")
        print("ServerProfiles:")
        if let server = playerActionDelegate as? Server {
            for player in server.players {
                print("Profile(\"\(String(describing: player.nickname!))\", \(String(describing: player.status)))")
            }
        }
        
        status = Status.SEARCH
        let opponent = playerActionDelegate?.findOpponent()
        
        print("\nResult Search")
        print("SearcherProfile:")
        print("Profile(\"\(String(describing: nickname!))\", \(String(describing: status)))")
        print("Opponent:")
        if let opponentNickname = opponent?.nickname, let opponentStatus = opponent?.status {
            print("Profile(\"\(opponentNickname)\", \(opponentStatus))")
        }
        status = Status.IN_PLAY
        opponent?.status = Status.IN_PLAY
        print("ServerProfiles:")
        if let server = playerActionDelegate as? Server {
            for player in server.players {
                print("\(String(describing: player.nickname!)), \(String(describing: player.status)) ")
            }
        }
    }
}

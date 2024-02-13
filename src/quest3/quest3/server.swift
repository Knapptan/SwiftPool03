//
//  server.swift
//  quest3
//
//  Created by Knapptan on 27.01.2024.
//

import Foundation

protocol PlayerAction {
    func findOpponent() -> Profile?
}

class Server : PlayerAction {
    let adress: String
    var players = [Profile]()
    init(_ adress: String) {
        self.adress = adress
    }
    func findOpponent() -> Profile? {
        for player in players {
            if player.status == Profile.Status.SEARCH {
                return player
            }
        }
        return nil
    }
}

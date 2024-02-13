//
//  main.swift
//  quest3
//
//  Created by Knapptan on 26.01.2024.
//

import Foundation

let player = Profile(nickname: "knapptan", age: 26, revolver: RevolverMoonClip(Caliber.c32) ,status: Profile.Status.IDLE)

let server = Server("http://gameserver.com/")

server.players = [Profile(nickname: "oceanusp", age: 29, name: "Alex", revolver: RevolverMoonClip(Caliber.c32),status: Profile.Status.IDLE),                   Profile(nickname: "styxdun", status: Profile.Status.SEARCH),
                  Profile(nickname: "skglddd", age: 26, revolver: RevolverMoonClip(Caliber.c32), status: Profile.Status.IN_PLAY), Profile(nickname: "loooool", status: Profile.Status.SEARCH),
                  player]

print("\nSearcherProfile:")
print("Profile(\"\(String(describing: player.nickname!))\", \(String(describing: player.status)))")

print("\nServerProfiles:")
for player in server.players {
    print("Profile(\"\(String(describing: player.nickname!))\", \(String(describing: player.status)))")
}

player.playerActionDelegate = server
player.Search()

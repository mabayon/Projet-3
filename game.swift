//
//  test.swift
//  
//
//  Created by Mahieu Bayon on 04/09/2017.
//
//

enum CharacterType {
    case warrior
    case mage
    case colossus
    case dwarf
}

class Warrior: Character {
    override init() {
        super.init()
        type    = .warrior
        life    = 100
        dmg     = 10
    }
}

class Mage: Character {
    override init() {
        super.init()
        type    = .mage
        life    = 85
        dmg     = 5
    }
}

class Dwarf: Character {
    override init() {
        super.init()
        type    = .dwarf
        life    = 85
        dmg     = 15
    }
}

class Colossus: Character {
    override init() {
        super.init()
        type    = .colossus
        life    = 200
        dmg     = 5
    }
}

class Character {
    var name:   String?
    var type:   CharacterType?
    
    var life    =  0
    var dmg     =  0
}

class Player {
    var team: [Character] = []
    var isAlive = true
    
    private func chooseYourCharacters(_ players: [Player]) {
        
        var validNumber: Bool
        
        for i in 1..<4 {
            repeat {
                print("\nCharacter nº\(String(i)): Choose your class\n"
                    + " 1. Warrior 🗡   2. Mage ⚡️  3. Colossus 🔨  4. Dwarf ⛏\n")
                
                validNumber = true
                if let choice = readLine() {
                    switch choice {
                    case "1":
                        let faction = Warrior()
                        chooseYourName(players, hero: faction)
                    case "2":
                        let faction = Mage()
                        chooseYourName(players, hero: faction)
                    case "3":
                        let faction = Colossus()
                        chooseYourName(players, hero: faction)
                    case "4":
                        let faction = Dwarf()
                        chooseYourName(players, hero: faction)
                    default:
                        print("\n❌  Enter a number between 1 and 4\n")
                        validNumber = false
                    }
                }
            } while !validNumber
        }
    }
    private func chooseYourName(_ players: [Player], hero: Character) {
        var validName: Bool
        
        repeat {
            print("Choose a name for your hero:")
            validName = true
            if let choice = readLine() {
                if team.isEmpty && players.isEmpty {
                    hero.name = choice
                    team.append(hero)
                }
                else {
                    for hero in team {
                        if choice == hero.name! {
                            validName = false
                            break
                        }
                    }
                    for heroes in players {
                        for hero in heroes.team {
                            if choice == hero.name! {
                                validName = false
                                break
                            }
                        }
                    }
                    if validName {
                        hero.name = choice
                        team.append(hero)
                    }
                    else {
                        print("\n❌  Name already taken")
                    }
                }
            }
        } while !validName
    }
    private func pri() {
        for hero in team {
            print("Name: \(hero.name!) Faction: \(hero.type!) Pv: \(hero.life) DMG: \(hero.dmg)")
        }
    }
    func createTeam(_ players: [Player]) {
        chooseYourCharacters(players)
    }
}

class Launcher {
    var players: [Player] = []
    
    private func description() {
        print("Welcome to TeamFight !!!\n"
            + "Each team will be composed by 3 fighters and fight until death 💀\n"
            + "Ready !? \n")
    }
    private func initTeam() {
        let player = Player()
        player.createTeam(players)
        players.append(player)
    }
    private func printTeam() {
        for heroes in players {
            for hero in heroes.team {
                print("Name: \(hero.name!) Faction: \(hero.type!) Pv: \(hero.life) DMG: \(hero.dmg)")
            }
        }
    }
    func play() {
        description()
        for i in 1...2 {
            print("\nPlayer \(i) choose your heroes !!!")
            initTeam()
        }
        printTeam()
    }
}

var game = Launcher()
game.play()

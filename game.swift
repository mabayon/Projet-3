//
//  game.swift
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

class Launcher {
    
    var team: [Character] = []
    
    private func description() {
        print("Welcome to TeamFight !!!\n"
            + "Each team will be composed by 3 fighters and fight until death 💀\n"
            + "Ready !? \n\n")
    }
    
    private func chooseYourCharacters() {
        
        var validNumber = true
        
        for i in 1..<4 {
            print("Character nº\(String(i)): Choose your class\n"
                + " 1. Warrior 🗡   2. Mage ⚡️  3. Colossus 🔨  4. Dwarf ⛏\n")
            repeat {
                if let choice = readLine() {
                    switch choice {
                    case "1":
                        let faction = Warrior()
                        chooseYourName(player: faction)
                        validNumber = true
                    case "2":
                        let faction = Mage()
                        chooseYourName(player: faction)
                        validNumber = true
                    case "3":
                        let faction = Colossus()
                        chooseYourName(player: faction)
                        validNumber = true
                    case "4":
                        let faction = Dwarf()
                        chooseYourName(player: faction)
                        validNumber = true
                    default:
                        print("Enter a number between 1 and 4")
                        validNumber = false
                    }
                }
            } while !validNumber
        }
    }
    private func chooseYourName(player: Character) {
        if let choice = readLine() {
            player.name = choice
            team.append(player)
        }
    }
    func pri() {
        for i in 0..<3 {
            print("Name: \(team[i].name!) Faction: \(team[i].type!) Pv: \(team[i].life) DMG: \(team[i].dmg)")
        }
    }
    func play() {
        description()
        chooseYourCharacters()
        pri()
    }
}

var game = Launcher()
game.play()

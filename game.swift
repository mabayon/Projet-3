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

class Warrior {
    let life   = 100
    let dmg    = 10
}

class Mage {
    let life   = 85
    let care   = 6
}

class Dwarf {
    let life   = 85
    let dmg    = 15
}

class Colossus {
    let life   = 200
    let dmg    = 5
}

class Character {
    var name: String?
    var type: CharacterType
    var life            =   0
    var dmg             =   0
    var care            =   0
    
    init(name: String?, type: CharacterType) {
        self.name = name
        self.type = type
        switch type {
        case .colossus:
            let faction = Colossus()
            life        = faction.life
            dmg         = faction.dmg
        case .dwarf:
            let faction = Dwarf()
            life        = faction.life
            dmg         = faction.dmg
        case .mage:
            let faction = Mage()
            life        = faction.life
            care        = faction.care
        case .warrior:
            let faction = Warrior()
            life        = faction.life
            dmg         = faction.dmg
        }
    }
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
                        chooseYourName(type: .warrior)
                        validNumber = true
                    case "2":
                        chooseYourName(type: .mage)
                        validNumber = true
                    case "3":
                        chooseYourName(type: .colossus)
                        validNumber = true
                    case "4":
                        chooseYourName(type: .dwarf)
                        validNumber = true
                    default:
                        print("Enter a number between 1 and 4")
                        validNumber = false
                    }
                }
            } while !validNumber
        }
    }
    private func chooseYourName(type: CharacterType) {
        print("Choose a name for your hero")
        if let choice = readLine() {
            let player = Character(name: choice, type: type)
            team.append(player)
        }
        
    }
    func pri() {
        for i in 0..<3{
            print(team[i].name!)
            print(team[i].type)
            print(team[i].life)
            print(team[i].dmg)
        }
    }
    func play() {
        description()
        chooseYourCharacters()
    }
}

var game = Launcher()
game.play()


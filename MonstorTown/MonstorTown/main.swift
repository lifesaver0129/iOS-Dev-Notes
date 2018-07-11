//
//  main.swift
//  MonstorTown
//
//  Created by Yuxing Hu on 2018/7/10.
//  Copyright © 2018 Yuxing Hu. All rights reserved.
//

import Foundation

var myTown = Town(population: 0, stoplights: 6)
myTown?.printDescription()
let myTownSize = myTown?.townSize
print (myTownSize)
myTown?.changePopulation(by: 1_000_000)
myTown?.printDescription()

var fredTheZombie:Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName:"Fred")
fredTheZombie?.town = myTown
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printDescription()

var convenientZombie = Zombie( limp: true, fallingApart: false)

print ("Victim pool: \(fredTheZombie?.victimPool)")
fredTheZombie?.victimPool = 500
print ("Victim pool: \(fredTheZombie?.victimPool)")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away")
}
fredTheZombie = nil

//
//  HUDDelegate.swift
//  cowboy run
//
//  Created by bo zhong on 1/17/23.
//

import Foundation


protocol HUDDelegate{
    func updateCoinLabel(coins: Int)
    func addSuperCoin(index: Int)
}

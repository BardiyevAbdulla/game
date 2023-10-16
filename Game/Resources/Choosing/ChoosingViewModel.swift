//
//  ChoosingViewModel.swift
//  Game
//
//  Created by admin on 10/3/23.
//

import Foundation

class ChoosingViewModel {
    let listItem = list
    var shuffleItems: [[ItemModel]]
    let space: CGFloat = 10
    var index: Int = 0
    var score: Int = 0
    var imWidth: CGFloat = 300
    var imHeight: CGFloat = 180
    
    var buttonWidth: CGFloat = 0
    var buttonHeight: CGFloat = 0
    var isFinished = false
    
    var itemSet = Set<ItemModel>()
    
    init() {
        shuffleItems = [[]]
        
        for _ in listItem {
            let value = shuffle()
            shuffleItems.append(value)
            index += 1
        }
        
        index = 0

    }
    
    func nextPage()-> Bool? {
        if isFinished {
            if let tempItem = itemSet.first {
                let index = listItem.firstIndex { model in
                    return model == tempItem
                }
                self.index = index ?? 0
                return true
            }
            return nil
        }
        
        if index < listItem.count-1 {  index += 1
        return false }
        return nil
        
       
       
    }
    
    func shuffle() -> [ItemModel] {
        var tempItem = [ItemModel]()
        tempItem.append(listItem[index])
        
        for item in listItem {
            if item.id != listItem[index].id {
                tempItem.append(item)
            }
            if tempItem.count > 3 {
                tempItem.shuffle()
                return tempItem
            }
        }
        return tempItem
    }
    
    func checkAnswer() {
        
    }
}

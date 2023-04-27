
//用 Swift 寫一個Age of Empires II的兵種類別，裡面有多個設定初始值的屬性，不要寫 init。生兩個物件。修改它們的屬性後，印出屬性的內容

//class MilitaryUnit {
//    var civilization: String = "文明種族"
//    var name: String = "單位名稱"
//    var description: String = "單位描述"
//    var hp: Int = 0
//    var attack: Int = 0
//    var meleeDefense: Int = 0
//    var rangedDefense: Int = 0
//    var rangeFire: Int = 0
//    var sightRange: Int = 0
//    var attackSpeed: Double = 0
//    var moveSpeed: Double = 0
//}
//
//let infantry = MilitaryUnit()
//infantry.civilization = "維京"
//infantry.name = "狂戰士"
//infantry.description = "狂戰士是維京的堡兵，可於帝王時代升級為精銳狂戰士。"
//infantry.hp = 61
//infantry.attack = 9
//infantry.meleeDefense = 0
//infantry.rangedDefense = 1
//infantry.rangeFire = 0
//infantry.sightRange = 3
//infantry.attackSpeed = 2.03
//infantry.moveSpeed = 1.05
//
//print("文明：\(infantry.civilization)\n單位：\(infantry.name)\n兵種特色：\(infantry.description)\n血量：\(infantry.hp)\n攻擊力：\(infantry.attack)\n近防：\(infantry.meleeDefense)\n遠防：\(infantry.rangedDefense)\n射程：\(infantry.rangeFire)\n視野範圍：\(infantry.sightRange)\n攻擊速度：\(infantry.attackSpeed)\n移動速度：\(infantry.moveSpeed)")

//let archer = MilitaryUnit()
//archer.civilization = "土耳其"
//archer.name = "土耳其火槍兵"
//archer.description = "土耳其得堡兵。擁有高攻擊的火藥單位，可於帝王時代升級為精銳單位。"
//archer.hp = 44
//archer.attack = 17
//archer.meleeDefense = 1
//archer.rangedDefense = 0
//archer.rangeFire = 8
//archer.sightRange = 10
//archer.attackSpeed = 3.49
//archer.moveSpeed = 0.96
//
//print("文明：\(archer.civilization)\n單位：\(archer.name)\n兵種特色：\(archer.description)\n血量：\(archer.hp)\n攻擊力：\(archer.attack)\n近防：\(archer.meleeDefense)\n遠防：\(archer.rangedDefense)\n射程：\(archer.rangeFire)\n視野範圍：\(archer.sightRange)\n攻擊速度：\(archer.attackSpeed)\n移動速度：\(archer.moveSpeed)")



import Foundation

class MilitaryUnit {
    var civilization: String = "文明種族"
    var name: String = "單位名稱"
    var description: String = "單位描述"
    var hp: Int = 0
    var attack: Int = 0
    var meleeDefense: Int = 0
    var rangedDefense: Int = 0
    var rangeFire: Int = 0
    var sightRange: Int = 0
    var attackSpeed: Double = 0
    var moveSpeed: Double = 0

    // 更快速取得單位資訊
    func getDescription() -> String {
        let message = "文明：\(civilization)\n單位：\(name)\n兵種特色：\(description)\n血量：\(hp)\n攻擊力：\(attack)\n近防：\(meleeDefense)\n遠防：\(rangedDefense)\n射程：\(rangeFire)\n視野範圍：\(sightRange)\n攻擊速度：\(attackSpeed)\n移動速度：\(moveSpeed)"

        print(message)

        return message
    }

    // 花費資源：使用if 讓沒有使用到的資源不顯示出來
    func cost(food: Int, wood: Int, gold: Int, stone: Int) -> String {
        var unitName = name
        var costMessage = "該單位\(unitName)需要花費："

        if food != 0 {
            costMessage = costMessage + "食物:\(food) "
        }
        if wood != 0 {
            costMessage = costMessage + "木材:\(wood) "
        }
        if gold != 0 {
            costMessage = costMessage + "黃金:\(gold) "
        }
        if stone != 0 {
            costMessage = costMessage + "石頭:\(stone) "
        }

        let message = costMessage
        print(message)

        return message
    }

    // 科技研發:單位移動速度加成百分比％
    func addMoveSpeed(technologyName: String, unitName: String, increase: Double) -> String {
      let newMoveSpeed = increase * moveSpeed + moveSpeed
        let roundedNewMoveSpeed = round(100 * newMoveSpeed) / 100
        let message = "\(technologyName)研發增加\(unitName)移動速度為：\(roundedNewMoveSpeed)"
        print(message)

        return message
    }

    // 單位升級名稱
    func addPrefix(toName Prefix: String) {
        name = Prefix + name
        print("此單位升級為\(name)")
    }

    // 死亡提示
    func die() {
        hp = 0
        print("此單位目前血量\(hp)，已被擊殺!")
    }

}

let infantry = MilitaryUnit()
infantry.civilization = "維京"
infantry.name = "狂戰士"
infantry.description = "狂戰士是維京的堡兵，可於帝王時代升級為精銳狂戰士。"
infantry.hp = 61
infantry.attack = 9
infantry.meleeDefense = 0
infantry.rangedDefense = 1
infantry.rangeFire = 0
infantry.sightRange = 3
infantry.attackSpeed = 2.03
infantry.moveSpeed = 1.05

infantry.getDescription()
infantry.cost(food: 65, wood: 0, gold: 25, stone: 0)
infantry.addMoveSpeed(technologyName: "護衛技術", unitName: infantry.name, increase: 0.1)
infantry.addPrefix(toName: "精銳")
infantry.die()

let archer = MilitaryUnit()
archer.civilization = "緬甸"
archer.name = "飛鏢騎兵"
archer.description = "是緬甸的特殊單位，屬於馬弓騎兵，傷害力極高。"
archer.hp = 60
archer.attack = 17
archer.meleeDefense = 0
archer.rangedDefense = 1
archer.rangeFire = 5
archer.sightRange = 5
archer.attackSpeed = 2.03
archer.moveSpeed = 1.3

archer.getDescription()
archer.cost(food: 0, wood: 75, gold: 60, stone: 0)
archer.addMoveSpeed(technologyName: "耕種技術", unitName: archer.name, increase: 0.1)
archer.addPrefix(toName: "精銳")
archer.die()


// 類別繼承（軍事建築）
// 父類別 （建築）
class Building {
    var name: String = "建築名稱"
    var description: String = "功能特色描述"
    var hp: Int = 0
    var sightRange: Int = 0
    var buildingSize: Int = 0
    
    // 單位花費
    func buildingCost(food: Int, wood: Int, gold: Int, stone: Int) -> String {
        var buildingName = name
        var costMessage = "該\(buildingName)所需耗費資源為"
        if food != 0 {
            costMessage = costMessage + "食物：\(food) "
        }
        if wood != 0 {
            costMessage = costMessage + "木材：\(wood) "
        }
        if gold != 0 {
            costMessage = costMessage + "黃金：\(gold) "
        }
        if stone != 0 {
            costMessage = costMessage + "石頭：\(stone) "
        }
        let message = costMessage
        print(message)
        
        return message
    }
    // 將單位屬性字串話
    func getDescription() -> String {
        let message = "建築名稱：\(name)\n功能特色：\(description)\n血量：\(hp)\n建築視野：\(sightRange)\n建築尺寸：：\(buildingSize)"
        print(message)
        
        return message
    }
}

// 子類別：軍事建築
class MilitaryBuilding: Building {
    var attack: Int = 0
    var rangeFire: Int = 0
    var shootingSpeed: Double = 0
    
    // 駐紮人口
    func occupants(unitName: String, amount: Int) {
        let message = "目前有 \(amount) 名人口駐紮在此 \(unitName)。"
        print(message)
    }
    
    func militaryBuildingDescription() {
        let message = "攻擊：\(attack)\n射程：\(rangeFire)\n射速：\(shootingSpeed)"
        print(message)

    }

    
}

let castle = MilitaryBuilding()
castle.name = "城堡"
castle.description = "能夠在城堡時代建築，提供強大的防禦"
castle.hp = 4800
castle.sightRange = 11
castle.buildingSize = 16
castle.attack = 11
castle.rangeFire = 8
castle.shootingSpeed = 2.03
castle.getDescription()
castle.militaryBuildingDescription()
castle.buildingCost(food: 0, wood: 0, gold: 0, stone: 650)
castle.occupants(unitName: castle.name, amount: 20)

// 測試用
//func getDescription() -> String {
//    return "文明種族：\(civilization)\n單位名稱：\(name)\n單位描述：\(description)"
//}

//func cost(food: Int, wood: Int, gold: Int, stone: Int) -> String {
//        return "該單位需要花費食物：\(food)、木材：\(wood)、黃金：\(gold)、石頭：\(stone)"
//    }


// 科技研發:單位移動速度加成百分比％
//    func addMoveSpeed(technologyName: String, increase: Double) -> String {
//      let newMoveSpeed = increase * moveSpeed + moveSpeed
//        let roundedNewMoveSpeed = round(100 * newMoveSpeed) / 100
//
//        return "\(technologyName)研發增加單位移動速度為：\(roundedNewMoveSpeed)"
//    }


//func upadateName() {
//    if name.hasPrefix("精銳") {
//        print("此單位已經是精銳級別了")
//    } else {
//        name = "精銳" + name
//        print("此單位升級為\(name)")
//    }
//}


//
//  main.swift
//  Level3
//  0.95
//
//  Created by 길준호 on 2017. 10. 11..
//  Copyright © 2017년 길준호. All rights reserved.
//

import Foundation

public var df: DateFormatter = DateFormatter()
df.dateFormat = "yyyyMMddHH"

struct vendingMachine {
    
    
    class product {
        var brand: String = ""
        var weight = 0
        var price = 0
        var name: String = ""
        var productDate = Date()
        var amount = 0
        
        init(brand: String, weight: Int, price: Int, name: String, productDate: String, amount: Int) {
            self.brand = brand
            self.weight = weight
            self.price = price
            self.name = name
            let sumDate = productDate + "09"
            let date2: NSDate = df.date(from: sumDate)! as NSDate
            self.productDate = date2 as Date
            self.amount = amount
        }
    }
    
    class drink: product{
        var cool = true
    }
    class bread: product{
        var hot = true
    }
    class gum: product{
    }
    class snack: product{
    }
    class chocolate: product{
    }
    
    var money = 0
    var items = [product]()
    var buyList = [String]()
    
    mutating func push(_ item: product) {
        items.append(item)
    }
   
    func priceRaise(findName: String, RaisedPrice: Int) {
        for (element) in items {
            if element.name == findName {
                if element.price < RaisedPrice {
                    element.price = RaisedPrice
                } else {
                    NSLog("올리려는 금액보다 제품의 가격이 더 높거나 같습니다. 가격을 올릴 수 없습니다")
                }
            }
        }
    }
    func amountRaise(findName: String, raisedAmount: Int) {
        for (element) in items {
            if element.name == findName {
                if element.amount < raisedAmount {
                    element.amount = raisedAmount
                } else {
                    NSLog("늘리려는 제품 수량보다 현재 제품의 수량이 더 많거나 같습니다. 재고를 늘릴 수 없습니다")
                }
            }
        }
    }
    mutating func register(registerType: String, registerBrand: String, registerWeight: Int, registerPrice: Int, registerName: String, registerDate: String, registerAmount: Int){
        if registerAmount is Int && registerPrice is Int && registerWeight is Int {
        switch registerType {
        case "drink":
            let registerProcess = vendingMachine.drink(brand: registerBrand, weight: registerWeight, price: registerPrice, name: registerName, productDate: registerDate, amount: registerAmount)
            self.push(registerProcess)
            break
        case "bread":
            let registerProcess = vendingMachine.bread(brand: registerBrand, weight: registerWeight, price: registerPrice, name: registerName, productDate: registerDate, amount: registerAmount)
            self.push(registerProcess)
            break
        case "gum":
            let registerProcess = vendingMachine.gum(brand: registerBrand, weight: registerWeight, price: registerPrice, name: registerName, productDate: registerDate, amount: registerAmount)
            self.push(registerProcess)
            break
        case "snack":
            let registerProcess = vendingMachine.snack(brand: registerBrand, weight: registerWeight, price: registerPrice, name: registerName, productDate: registerDate, amount: registerAmount)
            self.push(registerProcess)
            break
        case "chocolate":
            let registerProcess = vendingMachine.chocolate(brand: registerBrand, weight: registerWeight, price: registerPrice, name: registerName, productDate: registerDate, amount: registerAmount)
            self.push(registerProcess)
            break
            
        default:
            NSLog("error: %s는 정확하지 않은 종류입니다. drink, bread, gum, snack, chocolate 중 입력해주세요", registerType)
        }
        } else {
            print("error: 수량, 가격, 무게는 숫자로만 입력하셔야 합니다.")
        }
    }
    func availableList(){
        for (element) in items {
            if element.price <= money {
                NSLog(element.name)
            }
        }
    }
    mutating func buy(findName: String) {
        for (element) in items {
            if element.name == findName {
                if element.price <= money {
                    money = money - element.price
                    buyList.append(element.name)
                    element.amount = element.amount - 1
                } else {
                    NSLog("돈이 부족해서 구매할 수 없습니다")
                }
            }
        }
    }
    func moneyCheck(){
        NSLog("%d", self.money)
    }
    func productListPrint() {
            print("상품이름   브랜드 가격 무게 수량 생산일자 ")
        for (element) in items {
            print(element.name,   element.brand,   element.price,   element.weight, element.amount,  element.productDate)
        }
    }
    func buyListPrint(){
        for (element) in buyList {
            NSLog(element)
        }
    }
    mutating func insertCoin(coin: Int) {
        self.money = self.money + coin
    }
}

//var cola = vendingMachine.drink(brand: "coca", weight: 50, price: 500, name: "cocacola")
//var pizza = vendingMachine.bread(brand: "samlim", weight: 10, price: 300, name: "pizzabbang")
//var lottegum = vendingMachine.gum(brand: "lotte", weight: 5, price: 200, name: "hurabono")
//var chitos = vendingMachine.snack(brand: "orion", weight: 20, price: 300, name: "chitos")
//var gana = vendingMachine.chocolate(brand: "lotte", weight: 7, price: 400, name: "ganachocolate")

var vendingMachine1 = vendingMachine()
//vendingMachine1.push(cola)
//vendingMachine1.push(pizza)
//vendingMachine1.push(lottegum)
//vendingMachine1.push(chitos)
//vendingMachine1.push(gana)
//
//vendingMachine1.priceRaise(findName: "cocacola", RaisedPrice: 500)

vendingMachine1.register(registerType: "drink", registerBrand: "coca", registerWeight: 50, registerPrice: 500, registerName: "cocacola", registerDate: "20170103", registerAmount: 100)
vendingMachine1.register(registerType: "bread", registerBrand: "samlim", registerWeight: 10, registerPrice: 300, registerName: "pizzabbang", registerDate: "20170811", registerAmount: 100)
vendingMachine1.register(registerType: "gum", registerBrand: "lotte", registerWeight: 5, registerPrice: 200, registerName: "hurabono", registerDate: "20160925", registerAmount: 100)
vendingMachine1.register(registerType: "snack", registerBrand: "orion", registerWeight: 20, registerPrice: 300, registerName: "chitos", registerDate: "20170817", registerAmount: 100)
vendingMachine1.register(registerType: "chocolate", registerBrand: "lotte", registerWeight: 7, registerPrice: 400, registerName: "ganachocolate", registerDate: "20170502", registerAmount: 100)
vendingMachine1.register(registerType: "snack", registerBrand: "orion", registerWeight: 200, registerPrice: 1000, registerName: "chocopie", registerDate: "20160606", registerAmount: 100)

//NSLog(vendingMachine1.items[5].name)
//
//vendingMachine1.availableList()
//vendingMachine1.moneyCheck()

var check1 = true
var check2 = true
var check3 = true

while(check1){
print("자판기 메뉴를 선택해주세요: 1-관리자 모드, 2-사용자 모드, 3-종료")
let a = readLine()
switch a {
case "1"?:
while(check2){
print("관리자 메뉴를 선택해주세요: 1-상품 등록, 2-가격 올리기, 3-재고 추가, 4-상품 목록 출력, 5-상위 메뉴로 나가기")
let b = readLine()
switch b {
case "1"?: print("상품을 등록합니다. 상품 종류를 입력해주세요: (drink, bread, gum, snack, chocolate 중 선택해주세요")
    let registerType1 = readLine()
print("브랜드를 입력해주세요 :")
let registerBrand = readLine()
print("무게(g)를 입력해주세요 :")
let registerWeight1 = readLine()
let registerWeight2 = Int(registerWeight1!)
print("가격(원)을 입력해주세요 :")
    let registerPrice1 = readLine()
let registerPrice2 = Int(registerPrice1!)
print("이름을 입력해주세요 :")
    let registerName1 = readLine()
print("생산일자(YYYYMMDD)를 입력해주세요 :")
    let registerDate1 = readLine()
print("수량을 입력해주세요 :")
let registerAmount1 = readLine()
let registerAmount2 = Int(registerAmount1!)
if registerAmount2 is Int && registerPrice2 is Int && registerWeight2 is Int {
vendingMachine1.register(registerType: registerType1!, registerBrand: registerBrand!, registerWeight: registerWeight2!, registerPrice: registerPrice2!, registerName: registerName1!, registerDate: registerDate1!, registerAmount: registerAmount2!)
} else {
    print("error: 수량, 가격, 무게는 숫자로만 입력하셔야 합니다.")
}
    break
case "2"?: print("상품의 가격을 올립니다. 가격 올릴 상품 이름을 입력해주세요 :")
    let raisedName = readLine()
print("올릴 가격을 입력해주세요 :")
    let raisedPrice1 = readLine()
    let raisedPrice2 = Int(raisedPrice1!)
if raisedPrice2 is Int {
vendingMachine1.priceRaise(findName: raisedName!, RaisedPrice: raisedPrice2!)
} else {
    print("error: 가격은 숫자로만 입력하셔야 합니다.")
}
    break
case "3"?: print("상품의 재고를 추가합니다. 재고를 추가할 상품 이름을 입력해주세요 :")
let raisedName2 = readLine()
print("늘릴 수량을 입력해주세요 :")
let raisedAmount1 = readLine()
let raisedAmount2 = Int(raisedAmount1!)
if raisedAmount2 is Int {
vendingMachine1.amountRaise(findName: raisedName2!, raisedAmount: raisedAmount2!)
} else {
    print("error: 수량은 숫자로만 입력하셔야 합니다.")
}
    break
case "4"?: print("상품 목록을 출력합니다.")
vendingMachine1.productListPrint()
    break
case "5"?:
    check2 = false
    break
default: print("옵션을 확인해주세요")
    }
    }
case "2"?:
    while(check3){
        print("사용자 메뉴를 선택해주세요: 1-구매 가능 목록 출력, 2-구매, 3-현재 금액 확인, 4-상품 목록 출력, 5-구매 목록 출력, 6-동전 넣기, 7-상위 메뉴로 나가기")
        let c = readLine()
        switch c {
        case "1"?:
            vendingMachine1.availableList()
            break
        case "2"?:
            print("구매할 물품의 이름을 입력하세요: ")
            let buyName = readLine()
            vendingMachine1.buy(findName: buyName!)
            break
        case "3"?:
            vendingMachine1.moneyCheck()
            break
        case "4"?:
            vendingMachine1.productListPrint()
            break
        case "5"?:
            vendingMachine1.buyListPrint()
            break
        case "6"?:
            print("넣을 금액을 입력하세요: ")
            let insertCoin1 = readLine()
            let insertCoin2 = Int(insertCoin1!)
            if insertCoin2 is Int {
                vendingMachine1.insertCoin(coin: insertCoin2!)
            } else {
                print("error: 금액은 숫자로 입력해주세요.")
            }
            break
        case "7"?:
            check3 = false
            break
            
        default:
            print("옵션을 확인해주세요.")
        }
    }
    break
case "3"?:
check1 = false
    break
default:
    print("옵션을 확인해주세요.")
}
}


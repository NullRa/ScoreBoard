//
//  ScoreboardViewModel.swift
//  Practice20221012
//
//  Created by 禾智 on 2022/10/14.
//

import Foundation
import RxSwift
import RxCocoa

class ScoreboardViewModel {
    private let disposeBag: DisposeBag = .init()
    
    let input: Input
    let output: Output
    
    struct Input {
        
    }
    
    struct Output {
        let aPoint = BehaviorRelay<Int>(value: 0)
        let bPoint = BehaviorRelay<Int>(value: 0)
        let aString = BehaviorRelay<String>(value: "Love")
        let bString = BehaviorRelay<String>(value: "Love")
        let scoreboardString = BehaviorRelay<String>(value: "Love Game")
    }
    
    init(){
        input = Input()
        output = Output()
    }
    
    func bindings(){
        output.aPoint.subscribe(onNext: {[weak self] aP in
//            0~2顯示比數就好
//            >2 判斷是否和局
//                和局就是deuce
//                非和局時
//                  領先1分為Adv,落後方為Forty
//                  領先2分比賽結束
            
//            if aP == 0 {
//                self?.output.aString.accept("Love")
//                return
//            }
//            if aP == 1 {
//                self?.output.aString.accept("Fifteen")
//                return
//            }
//            if aP == 2 {
//                self?.output.aString.accept("Thirty")
//                return
//            }
//            let bP = self?.output.bPoint.value
//            if aP == bP {
//                self?.output.scoreboardString.accept("deuce")
//                return
//            }
//            if aP == bP!+1 {
//                self?.output.scoreboardString.accept("Adv : Forty")
//                return
//            }
//            if aP == bP!+2 {
//                self?.output.scoreboardString.accept("A Win")
//                return
//            }
            if aP < 3 {
                var aString = "Love"
                aString = aP == 1 ? "Fifteen" : "Thirty"
                self?.output.aString.accept(aString)
            } else {
                let bP = self?.output.bPoint.value
                var resultString = aP == bP ? "deuce" : "Adv : Forty"
                if aP == bP! + 2 {
                    resultString = "A Win"
                }
                self?.output.scoreboardString.accept(resultString)
            }
        }).disposed(by: disposeBag)
        
        output.bPoint.subscribe(onNext: {[weak self] bP in
            if bP < 3 {
                var bString = "Love"
                bString = bP == 1 ? "Fifteen" : "Thirty"
                self?.output.bString.accept(bString)
            } else {
                let aP = self?.output.aPoint.value
                var resultString = bP == aP ? "deuce" : "Adv : Forty"
                if bP == aP! + 2 {
                    resultString = "B Win"
                }
                self?.output.scoreboardString.accept(resultString)
            }
        }).disposed(by: disposeBag)
        
        output.aString.subscribe(onNext: {[weak self] string in
            self?.output.scoreboardString.accept(string + ":" + (self?.output.bString.value)!)
        }).disposed(by: disposeBag)
        
        output.bString.subscribe(onNext: {[weak self] string in
            self?.output.scoreboardString.accept((self?.output.aString.value)! + ":" + string)
        }).disposed(by: disposeBag)
    }
//    func checkResult(aP:Int,bP:Int) -> String? {
//        if aP == bP {
//            return "deuce"
//        }
//
//        if aP == bP+1 {
//            return "Adv : Forty"
//        }
//
//        if aP == bP+2 {
//            return "A Win"
//        }
//        return nil
//    }
    func getPoint(team:BehaviorRelay<Int>){
        let nowPoint = team.value
        team.accept(nowPoint+1)
    }
    
//    func leftGetPoint(){
//        let aPointNow = output.aPoint.value
//        output.aPoint.accept(aPointNow+1)
//    }
//
//    func rightGetPoint(){
//        let bPointNow = output.bPoint.value
//        output.bPoint.accept(bPointNow+1)
//    }
    
    func randomGetPoint(){
//        FIXME改成隨機得分
        output.aString.accept("testA")
    }
}

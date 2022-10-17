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
        let scoreboardString = BehaviorRelay<String>(value: "Love Game")
    }
    
    init(){
        input = Input()
        output = Output()
    }
    
    func bindings(){
        output.aPoint.subscribe(onNext: {[weak self] aP in
            guard let self = self else { return }
            let resultString = self.getScoreboardString(aP: aP, bP: self.output.bPoint.value)
            self.output.scoreboardString.accept(resultString)
        }).disposed(by: disposeBag)
        
        output.bPoint.subscribe(onNext: {[weak self] bP in
            guard let self = self else { return }
            let resultString = self.getScoreboardString(aP: self.output.aPoint.value, bP: bP)
            self.output.scoreboardString.accept(resultString)
        }).disposed(by: disposeBag)
    }
    
    private func getPoint(team:BehaviorRelay<Int>){
        let nowPoint = team.value
        team.accept(nowPoint+1)
    }
    
    func teamAGetPoint(){
        getPoint(team: output.aPoint)
    }
    
    func teamBGetPoint(){
        getPoint(team: output.bPoint)
    }
    
    func randomGetPoint(){
        //        FIXME改成隨機得分
        //        output.aString.accept("testA")
    }
    
    func getScoreboardString(aP:Int,bP:Int) -> String {
        //deuce後的規則是領先兩分 deuce前的規則是搶4
        if aP > 2 && bP > 2 {
            if aP == bP + 2 {
                return "A Win"
            }
            if bP == aP + 2 {
                return "B Win"
            }
            return aP == bP ? "Deuce" : aP > bP ? "Adv : Forty" : "Forty : Adv"
        } else {
            if aP == 4 {
                return "A Win"
            }
            if bP == 4 {
                return "B Win"
            }
            let aStr = getPointString(point: aP)
            let bStr = getPointString(point: bP)
            return aStr + " : " + bStr
        }
    }
    func getPointString(point:Int) -> String {
        if point == 1 {
            return "Fifteen"
        }
        if point == 2 {
            return "Thirty"
        }
        if point == 3 {
            return "Forty"
        }
        return "Love"
    }
}

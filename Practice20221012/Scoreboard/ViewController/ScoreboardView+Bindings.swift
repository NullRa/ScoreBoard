//
//  Scoreboard+Bindings.swift
//  Practice20221012
//
//  Created by 禾智 on 2022/10/14.
//

import Foundation
import RxCocoa
import RxSwift

extension ScoreboardViewController {
    func bindings() {
        bottomView.leftButton.rx.tap.bind{ [weak self] _ in
            self?.viewModel.teamAGetPoint()
        }.disposed(by: self.disposeBag)
        
        bottomView.middleButton.rx.tap.bind{ [weak self] _ in
            //            self?
        }.disposed(by: self.disposeBag)
        
        bottomView.rightButton.rx.tap.bind{ [weak self] _ in
            self?.viewModel.teamBGetPoint()
        }.disposed(by: self.disposeBag)
        
        viewModel.output.scoreboardString.subscribe(onNext: {[weak self] lblString in
            self?.contentView.scoreLabel.text = lblString
        }).disposed(by: disposeBag)
    }
}

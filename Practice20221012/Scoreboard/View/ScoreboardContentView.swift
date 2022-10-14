//
//  ScoreboardContentView.swift
//  Practice20221012
//
//  Created by 禾智 on 2022/10/14.
//

import UIKit

class ScoreboardContentView: UIView {
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "計分的部分"
        label.textColor = UIColor.blue
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
}

extension ScoreboardContentView {
    func setupUI(){
        self.addSubview(scoreLabel)
        
        scoreLabel.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
    }
}

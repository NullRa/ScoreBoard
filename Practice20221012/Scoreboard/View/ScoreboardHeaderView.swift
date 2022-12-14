//
//  ScoreboardHeaderView.swift
//  Practice20221012
//
//  Created by 禾智 on 2022/10/14.
//

import UIKit

class ScoreboardHeaderView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "標題的部分"
        label.textColor = UIColor.blue
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScoreboardHeaderView {
    func setupUI() {
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{ make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 20,left: 20,bottom: 20,right: 20))
        }
    }
}

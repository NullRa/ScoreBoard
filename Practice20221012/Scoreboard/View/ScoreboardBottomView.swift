//
//  ScoreboardBottomView.swift
//  Practice20221012
//
//  Created by 禾智 on 2022/10/14.
//

import UIKit

class ScoreboardBottomView: UIView {
    lazy var leftButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("left+1", for: .normal)
        btn.backgroundColor = UIColor.green
        btn.tintColor = UIColor.white
        btn.isEnabled = true
        btn.addTarget(self, action: #selector(testBtn), for: .touchUpInside)
        return btn
    }()
    
    lazy var middleButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Random", for: .normal)
        btn.backgroundColor = UIColor.blue
        btn.tintColor = UIColor.white
        btn.isEnabled = true
        return btn
    }()
    
    lazy var rightButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Right+1", for: .normal)
        btn.backgroundColor = UIColor.red
        btn.tintColor = UIColor.white
        btn.isEnabled = true
        return btn
    }()
    
    lazy var scoreBtnsView: UIView = {
        let v = UIView()
        v.sizeToFit()
        v.addSubview(leftButton)
        v.addSubview(middleButton)
        v.addSubview(rightButton)
        leftButton.snp.makeConstraints { make in
            make.width.equalTo(59.3)
            make.height.equalTo(30)
            make.left.bottom.top.equalToSuperview()
        }
        middleButton.snp.makeConstraints { make in
            make.width.height.equalTo(leftButton)
            make.bottom.top.equalToSuperview()
            make.left.equalTo(leftButton.snp.right)
            make.right.equalTo(rightButton.snp.left)
        }
        rightButton.snp.makeConstraints { make in
            make.width.height.equalTo(leftButton)
            make.right.bottom.top.equalToSuperview()
        }
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
    @objc func testBtn(){
        print("testBtn")
    }
}

extension ScoreboardBottomView {
    func setupUI() {
        self.addSubview(scoreBtnsView)
        scoreBtnsView.snp.makeConstraints{ make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 20,left: 20,bottom: 30,right: 20))
        }
    }
}

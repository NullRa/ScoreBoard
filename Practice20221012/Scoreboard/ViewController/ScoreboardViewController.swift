//
//  ViewController.swift
//  Practice20221012
//
//  Created by 禾智 on 2022/10/12.
//

import UIKit
import SnapKit

class ScoreboardViewController: UIViewController {
    
    lazy var headerView: ScoreboardHeaderView = {
        let view = ScoreboardHeaderView()
        return view
    }()
    
    lazy var contentView: ScoreboardContentView = {
        let view = ScoreboardContentView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        setupUILayout()
    }
    
    func initView(){
        view.addSubview(headerView)
        view.addSubview(contentView)
    }
    
    func setupUILayout(){
        headerView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(182)
        }
        contentView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom)
        }
    }
}


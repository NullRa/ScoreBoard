//
//  ViewController.swift
//  Practice20221012
//
//  Created by 禾智 on 2022/10/12.
//

import UIKit
import SnapKit
import RxSwift
class ScoreboardViewController: UIViewController {
    
    lazy var disposeBag: DisposeBag = .init()
    
    lazy var headerView: ScoreboardHeaderView = {
        let view = ScoreboardHeaderView()
        return view
    }()
    
    lazy var contentView: ScoreboardContentView = {
        let view = ScoreboardContentView()
        return view
    }()
    
    lazy var bottomView: ScoreboardBottomView = {
        let view = ScoreboardBottomView()
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
        view.addSubview(bottomView)
    }
    
    func setupUILayout(){
        headerView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(182)
        }
        contentView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom)
        }
        bottomView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(contentView.snp.bottom)
        }
    }
}


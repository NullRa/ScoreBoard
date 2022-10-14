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
//        view.backgroundColor=UIColor.yellow
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initView()
        setupUILayout()
    }

    func initView(){
        view.addSubview(headerView)
    }
    
    func setupUILayout(){
        headerView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(182)
        }
    }
}


//
//  OtherViewController.swift
//  viewWillAppearDemo
//
//  Created by hooyking on 2023/11/9.
//

import UIKit

class OtherViewController: BaseSheetViewController {
    
    private lazy var button:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("back", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.frame.size = CGSize(width: 100, height: 45)
        btn.addTarget(self, action: #selector(backBtnAction), for: .touchDown)
        btn.center = view.center
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(Self.self) will Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(Self.self) will Disappear")
    }
    
    @objc func backBtnAction() {
        dismiss(animated: true)
    }
    

}

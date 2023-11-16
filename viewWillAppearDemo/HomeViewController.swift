//
//  HomeViewController.swift
//  viewWillAppearDemo
//
//  Created by hooyking on 2023/11/9.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var button:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("go", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.frame.size = CGSize(width: 100, height: 45)
        btn.addTarget(self, action: #selector(goBtnAction), for: .touchDown)
        btn.center = view.center
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
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
    
    @objc func goBtnAction() {
        let vc = OtherViewController()
//        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}

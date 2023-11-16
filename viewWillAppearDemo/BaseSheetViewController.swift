//
//  BaseSheetViewController.swift
//  viewWillAppearDemo
//
//  Created by hooyking on 2023/11/9.
//

import UIKit

class BaseSheetViewController: UIViewController,UIViewControllerTransitioningDelegate {
    
    init() {
        super.init(nibName:nil,bundle: nil)
        transitioningDelegate = self
        modalPresentationStyle = .custom
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
    }
    
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomModayAlphaController(presentedViewController: presented, presenting: presenting)
    }

}

class CustomModayAlphaController: UIPresentationController {
    
    private var CustomFrameOfPresentedInContainerView = CGRect.zero
    private var CustomSetFrameWhenPresentedView = false
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
        CustomSetFrameWhenPresentedView = completed
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        CustomFrameOfPresentedInContainerView = frameOfPresentedViewInContainerView
    }
    
    override var presentedView: UIView? {
        if CustomSetFrameWhenPresentedView {
            super.presentedView?.frame = CustomFrameOfPresentedInContainerView
        }
        return super.presentedView
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        CustomSetFrameWhenPresentedView = false
        if let transitionCoordinator = presentingViewController.transitionCoordinator {
            transitionCoordinator.animate(alongsideTransition: { [weak self] _ in
                self?.containerView?.backgroundColor = .clear
            }, completion: nil)
        }
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        containerView?.backgroundColor = .clear
        if let coordinator = presentingViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { [weak self] _ in
                self?.containerView?.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            }, completion: nil)
        }
    }
}

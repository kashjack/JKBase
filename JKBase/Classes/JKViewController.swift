//
//  JKColor.swift
//  JKBase
//
//  Created by worldunionYellow on 2020/12/28.
//

import UIKit
import Reachability
import RxCocoa
import RxSwift

class JKBaseViewController: UIViewController {

    private lazy var leftBarButton: UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setImage(UIImage.init(named: "icon_back"), for: UIControl.State.normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: -20, bottom: 5, right: 5)
        return button
    }()
    
    private let reachability = try! Reachability() // 网络状态
    public let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.setAction()
    }

    // MARK:  setUI
    private func setUI() {
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        }
        if let count = navigationController?.viewControllers.count, count > 1 {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: self.leftBarButton)
            self.navigationItem.leftBarButtonItem?.customView?.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
        }
    }

    // MARK:  setAction
    private func setAction() {
        self.leftBarButton.rx.controlEvent(.touchUpInside).subscribe(onNext: {[weak self] element in
            guard let self = self else { return }
            self.backBtnAction()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: self.disposeBag)
    }

    private func backBtnAction(completion: (() -> Void)? = nil) { // 移除通知
        NotificationCenter.default.removeObserver(self)
        let n = navigationController?.childViewControllers.count ?? 0
        if n > 1 {
            navigationController?.popViewController(animated: true)
        }else{
            dismiss(animated: true, completion: completion)
        }
    }



    // 创建网络监听
    func setReachability() {
        reachability.whenReachable = {[weak self] reachability in
            guard let self = self else { return }
            if reachability.connection == .wifi {
                printLog("Reachable via WiFi")
            } else {
//                self.alertCellularTip()
                printLog("Reachable via Cellular")
            }
        }
        reachability.whenUnreachable = { _ in
            printLog("Not reachable")
        }
        do {
            try reachability.startNotifier()
        } catch {
            printLog("Unable to start notifier")
        }
    }



}

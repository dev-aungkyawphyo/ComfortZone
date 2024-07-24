//
//  SplashScreenViewController.swift
//  ComfortZone
//
//  Created by Aung Kyaw Phyo on 25/07/2024.
//

import UIKit
import Lottie

class SplashScreenViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var logoImageview: UIImageView!
    @IBOutlet weak var animationView: LottieAnimationView!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        defaultAnimation()
        Timer.scheduledTimer(timeInterval: 7.5, target: self, selector: #selector(routerSetup), userInfo: nil, repeats: false)
    }
    
    @objc func routerSetup() {
        guard let viewController = UIStoryboard(name: "LoginScreen", bundle: nil).instantiateViewController(identifier: "LoginScreenViewController") as? LoginScreenViewController else {return}
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = viewController
            UIView.transition(with: window,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: nil,
                              completion: nil)
        }
    }
    
    // MARK: Lottie Animation View
    private func defaultAnimation() {
        let animation = LottieAnimation.named("ComfortZoneLoading")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.6
        view.addSubview(animationView)
        animationView.play()
    }

}

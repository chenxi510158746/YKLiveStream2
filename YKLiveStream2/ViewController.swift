//
//  ViewController.swift
//  YKLiveStream2
//
//  Created by chenxi on 2017/9/29.
//  Copyright © 2017年 chenxi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var live: YKCell!
    var playerView: UIView!
    var ijkPlayer: IJKMediaPlayback!
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var btnGift: UIButton!
    
    @IBOutlet weak var btnLike: UIButton!
    
    @IBOutlet weak var imgBack: UIImageView!
    
    @IBAction func btnBack(_ sender: UIButton) {
        
        ijkPlayer.shutdown()
        
        navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func btnGift(_ sender: UIButton) {
        
        let duration = 3.0
        let carView = UIImageView(image: #imageLiteral(resourceName: "porsche"))
        carView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.addSubview(carView)
        
        let widthCar:CGFloat = 250
        let heightCar:CGFloat = 125
        
        UIView.animate(withDuration: duration) {
            carView.frame = CGRect(x: self.view.center.x - widthCar/2, y: self.view.center.y - heightCar/2, width: widthCar, height: heightCar)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            UIView.animate(withDuration: duration, animations: {
                carView.alpha = 0
            }, completion: { (completed) in
                carView.removeFromSuperview()
            })
        }
        
        let layerFw = CAEmitterLayer()
        view.layer.addSublayer(layerFw)
        emmitParticles(from: sender.center, emitter: layerFw, in: view)
        DispatchQueue.main.asyncAfter(deadline: .now() + duration * 2) {
            layerFw.removeFromSuperlayer()
        }
    }
    
    @IBAction func btnLike(_ sender: UIButton) {
        
        let heart = DMHeartFlyView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        
        heart.center = CGPoint(x: btnLike.frame.origin.x, y: btnLike.frame.origin.y)
        
        view.addSubview(heart)
        
        heart.animate(in: view)
        
        let btnAnime = CAKeyframeAnimation(keyPath: "transform.scale")
        btnAnime.values = [1.0, 0.7, 0.5, 0.3, 0.5, 0.7, 1.0, 1.2, 1.4, 1.2, 1.0]
        btnAnime.keyTimes = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
        btnAnime.duration = 0.5
        sender.layer.add(btnAnime, forKey: "heartHitShow")
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBg()
        
        setPlayerView()
        
        bringBtnToFront()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !self.ijkPlayer.isPlaying() {
            ijkPlayer.prepareToPlay()
        }
    }
    
    func setPlayerView() {
        self.playerView = UIView(frame: view.bounds)
        view.addSubview(self.playerView)
        
        ijkPlayer = IJKFFMoviePlayerController(contentURLString: live.url, with: nil)
        let pv = ijkPlayer.view!
        
        pv.frame = playerView.bounds
        pv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        playerView.insertSubview(pv, at: 1)
        ijkPlayer.scalingMode = .aspectFill
        
    }
    
    func setBg() {
        let imgUrl = URL(string: live.portrait)
        imgBack.kf.setImage(with: imgUrl)
        
        let blurEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = imgBack.bounds
        imgBack.addSubview(effectView)
    }

    func bringBtnToFront() {
        view.bringSubview(toFront: btnLike)
        view.bringSubview(toFront: btnBack)
        view.bringSubview(toFront: btnGift)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


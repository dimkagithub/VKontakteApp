//
//  PresenterViewController.swift
//  VKontakteApp
//
//  Created by Дмитрий on 05.01.2021.
//

import UIKit
import RealmSwift

class ImagesGalleryViewController: UIViewController {
    
    private let networkManager = NetworkManager()
    private let realmManager = RealmManager.shared
    var images = [UIImage?]()
    var selectedPhoto = 0
    var leftImageView: UIImageView!
    var middleImageView: UIImageView!
    var rightImageView: UIImageView!
    var swipeToRight: UIViewPropertyAnimator!
    var swipeToLeft: UIViewPropertyAnimator!
    var friend: Friend!
    var userImages = [String]()
    var tempImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let gestPan = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        view.addGestureRecognizer(gestPan)
        networkManager.getPhoto(for: friend.id) { [weak self] (photos) in
            self?.userImages = photos.compactMap { $0.sizes[$0.sizes.count - 1].urlString }
            if let userImages = self?.userImages {
                self?.getDataFromURLs(urls: userImages, completion: { (image) in
                    self?.images.append(image)
                    DispatchQueue.main.async {
                        try? self?.realmManager?.add(objects: photos)
                        self?.setImage()
                        self?.startAnimate()
                    }
                })
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    func setImage(){
        var indexPhotoLeft: Int = selectedPhoto - 1
        let indexPhotoMid: Int = selectedPhoto
        var indexPhotoRight: Int = selectedPhoto + 1
        if indexPhotoLeft < 0 {
            indexPhotoLeft = images.count - 1
        }
        if indexPhotoRight > images.count - 1 {
            indexPhotoRight = 0
        }
        view.subviews.forEach({ $0.removeFromSuperview() })
        
        leftImageView = UIImageView()
        middleImageView = UIImageView()
        rightImageView = UIImageView()
        
        leftImageView.contentMode = .scaleAspectFill
        middleImageView.contentMode = .scaleAspectFill
        rightImageView.contentMode = .scaleAspectFill
        
        view.addSubview(leftImageView)
        view.addSubview(middleImageView)
        view.addSubview(rightImageView)
        
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        middleImageView.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            middleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            middleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            middleImageView.heightAnchor.constraint(equalTo: middleImageView.widthAnchor, multiplier: 4/3),
            middleImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            leftImageView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            leftImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            leftImageView.heightAnchor.constraint(equalTo: middleImageView.heightAnchor),
            leftImageView.widthAnchor.constraint(equalTo: middleImageView.widthAnchor),
            
            rightImageView.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            rightImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rightImageView.heightAnchor.constraint(equalTo: middleImageView.heightAnchor),
            rightImageView.widthAnchor.constraint(equalTo: middleImageView.widthAnchor),
        ])
        
        leftImageView.image = images[indexPhotoLeft]
        middleImageView.image = images[indexPhotoMid]
        rightImageView.image = images[indexPhotoRight]
        
        middleImageView.layer.cornerRadius = 8
        rightImageView.layer.cornerRadius = 8
        leftImageView.layer.cornerRadius = 8
        
        middleImageView.clipsToBounds = true
        rightImageView.clipsToBounds = true
        leftImageView.clipsToBounds = true
        
        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
        self.middleImageView.transform = scale
        self.rightImageView.transform = scale
        self.leftImageView.transform = scale
    }
    
    func startAnimate(){
        setImage()
        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: [],
            animations: {
                self.middleImageView.transform = .identity
                self.rightImageView.transform = .identity
                self.leftImageView.transform = .identity
            })
    }
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer){
        switch recognizer.state {
        case .began:
            swipeToRight = UIViewPropertyAnimator(
                duration: 0.5,
                curve: .easeInOut,
                animations: {
                    UIView.animate(
                        withDuration: 0.01,
                        delay: 0,
                        options: [],
                        animations: {
                            let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                            let translation = CGAffineTransform(translationX: self.view.bounds.maxX - 40, y: 0)
                            let transform = scale.concatenating(translation)
                            self.middleImageView.transform = transform
                            self.rightImageView.transform = transform
                            self.leftImageView.transform = transform
                        }, completion: { _ in
                            self.selectedPhoto -= 1
                            if self.selectedPhoto < 0 {
                                self.selectedPhoto = self.images.count - 1
                            }
                            self.startAnimate()
                        })
                })
            swipeToLeft = UIViewPropertyAnimator(
                duration: 0.5,
                curve: .easeInOut,
                animations: {
                    UIView.animate(
                        withDuration: 0.01,
                        delay: 0,
                        options: [],
                        animations: {
                            let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                            let translation = CGAffineTransform(translationX: -self.view.bounds.maxX + 40, y: 0)
                            let transform = scale.concatenating(translation)
                            self.middleImageView.transform = transform
                            self.rightImageView.transform = transform
                            self.leftImageView.transform = transform
                        }, completion: { _ in
                            self.selectedPhoto += 1
                            if self.selectedPhoto > self.images.count - 1 {
                                self.selectedPhoto = 0
                            }
                            self.startAnimate()
                        })
                })
        case .changed:
            
            let translationX = recognizer.translation(in: self.view).x
            if translationX > 0 {
                swipeToRight.fractionComplete = abs(translationX)/100
            } else {
                swipeToLeft.fractionComplete = abs(translationX)/100
            }
        case .ended:
            swipeToRight.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            swipeToLeft.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        default:
            return
        }
    }
    
    private func getDataFromURLs(urls: [String], completion: @escaping (UIImage?) -> ()) {
        urls.forEach { (urlString) in
            DispatchQueue.main.async {
                self.tempImage = UIImageView()
                self.tempImage.getData(from: URL(string: urlString)!) { (data) in
                    completion(UIImage(data: data))
                }
            }
        }
    }
}

//
//  InvitationCodeViewController.swift
//  arr-ios
//
//  Created by Voraruethai Chancharung on 20/4/2564 BE.
//

import UIKit
import CoreImage

class InvitationCodeViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var dateIconView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeIconView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var purposeIconView: UIView!
    @IBOutlet weak var purposeLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var idAdminLabel: UILabel!
    @IBOutlet weak var nameAdminLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var codeView: UIView!
  
    @IBOutlet weak var myBookingsButton: UIButton!
    @IBOutlet weak var opacityBackgroundView: UIView!
    @IBOutlet weak var backgroundCopyView: UIView!
    
    @IBOutlet weak var copyButton: UIButton!
    
    @IBOutlet weak var qrcodeView: UIView!
    @IBOutlet weak var iconCopyImage: UIImageView!
    @IBOutlet weak var qrcodeImage: UIImageView!
    
    var imageBlur = UIImage(named:"trueLab")
    var context = CIContext(options: nil)
    var click = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        opacityBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        backgroundImage.image = blurImage(img: imageBlur!)
      
        
//        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        backgroundImage.addSubview(blurEffectView)
        


        
        roomLabel.font = UIFont.boldSystemFont(ofSize: 41)
        dateLabel.font = UIFont.boldSystemFont(ofSize: 17)
        timeLabel.font = UIFont.boldSystemFont(ofSize: 17)
        purposeLabel.font = UIFont.boldSystemFont(ofSize: 17)
        idAdminLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        dateIconView.layer.cornerRadius = 9
        timeIconView.layer.cornerRadius = 9
        purposeIconView.layer.cornerRadius = 9
        profileImage.layer.cornerRadius = 25
        codeView.layer.cornerRadius = 10
        backgroundCopyView.roundCornerView(corners: [.topRight, .bottomRight], radius: 10)
        
        myBookingsButton.layer.cornerRadius = 20
        iconCopyImage.image = UIImage(named: "copyWhite")
        qrcodeView.layer.cornerRadius = 10
        
    }
    @IBAction func copyClickButton(_ sender: Any) {
        if (click){
            backgroundCopyView.backgroundColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
            iconCopyImage.image = UIImage(named: "copyGray")
            click = false
        }
    }
    
    private func blurImage(img: UIImage) -> UIImage{
        
        let currentFilter = CIFilter(name: "CIGaussianBlur")
        let beginImage = CIImage(image: imageBlur!)
            currentFilter!.setValue(beginImage, forKey: kCIInputImageKey)
            currentFilter!.setValue(5, forKey: kCIInputRadiusKey)

            let cropFilter = CIFilter(name: "CICrop")
            cropFilter!.setValue(currentFilter!.outputImage, forKey: kCIInputImageKey)
            cropFilter!.setValue(CIVector(cgRect: beginImage!.extent), forKey: "inputRectangle")

            let output = cropFilter!.outputImage
            let cgimg = context.createCGImage(output!, from: output!.extent)
            let processedImage = UIImage(cgImage: cgimg!)
        
        
        return processedImage
    }

}

extension UIView{
    
    func ronudCornerView(corner: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corner, cornerRadii: .init(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        
    }
}

extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return rotatedImage ?? self
        }

        return self
    }
}

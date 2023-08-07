//
//  TitleCollectionViewCall.swift
//  netflix clone
//
//  Created by Saurabh Dalakoti on 06/08/23.
//

import UIKit
import SDWebImage

class TitleCollectionViewCall: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCall"
    
    private let posterImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with model: String){
        guard let url = URL(string:"https://image.tmdb.org/t/p/w500\(model)") else {return}
        // print("url: \(url)")
        posterImageView.sd_setImage(with: url, completed: nil)
        // posterImageView.image = UIImage(named: "john_wick")
    }
    
}

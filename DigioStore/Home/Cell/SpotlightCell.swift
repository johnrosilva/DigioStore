//
//  SpotlightCell.swift
//  DigioStore
//
//  Created by Johnatas Rodrigues on 15/06/23.
//

import Foundation
import UIKit

class SpotlightCell: UICollectionViewCell {
    let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        applyCellStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        addSubview(bannerImageView)
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        bannerImageView.layer.cornerRadius = LayoutConstants.cellCornerRadius
        bannerImageView.layer.masksToBounds = true
    }

    func configure(with spotlightItem: SpotlightItem) {
        UIImage.loadImage(from: spotlightItem.bannerURL) { [weak self] image in
            self?.bannerImageView.image = image
        }
    }

    func applyCellStyle() {
        layer.cornerRadius = LayoutConstants.cellCornerRadius
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = LayoutConstants.cellShadowOpacity
        layer.shadowOffset = LayoutConstants.cellShadowOffset
        layer.shadowRadius = LayoutConstants.cellShadowRadius
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}

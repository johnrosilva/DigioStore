//
//  ProductDetailViewController.swift
//  DigioStore
//
//  Created by Johnatas Rodrigues on 16/06/23.
//

import Foundation
import UIKit

class ProductDetailViewController: UIViewController {
    private let viewModel: ProductDetailViewModel

    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = LayoutConstants.labelFont
        label.textAlignment = .left
        return label
    }()

    lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = LayoutConstants.descriptionLabelFont
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureProduct()
    }

    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(productImageView)
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                  constant: LayoutConstants.productDetailImageTop),
            productImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                      constant: LayoutConstants.productDetailImageLeading),
            productImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                       constant: LayoutConstants.productDetailImageTrailing),
            productImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.productDetailImageHeight)
        ])

        view.addSubview(productNameLabel)
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor,
                                                  constant: LayoutConstants.productDetailNameTop),
            productNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                      constant: LayoutConstants.productDetailNameLeading),
            productNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                       constant: LayoutConstants.productDetailNameTrailing),
            productNameLabel.heightAnchor.constraint(equalToConstant: LayoutConstants.productDetailNameHeight)
        ])

        view.addSubview(productDescriptionLabel)
        NSLayoutConstraint.activate([
            productDescriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor,
                                                         constant: LayoutConstants.productDetailDescriptionTop),
            productDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                             constant: LayoutConstants.productDetailDescriptionLeading),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                              constant: LayoutConstants.productDescriptionTrailing)
        ])
    }

    private func configureProduct() {
        productNameLabel.text = viewModel.productName
        productDescriptionLabel.text = viewModel.productDescription

        viewModel.loadProductImage { [weak self] image in
            self?.productImageView.image = image
        }
    }
}

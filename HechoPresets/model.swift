//
//  model.swift
//  HechoPresets
//
//  Created by Максим Белугин on 01.06.2018.
//  Copyright © 2018 Максим Белугин. All rights reserved.
//

import UIKit

let examples = [ [UIImage(named: "Autumn_")! : UIImage(named: "Autumn")!],
                [UIImage(named: "Barcelona_")! : UIImage(named: "Barcelona")!],
                [UIImage(named: "Bright_portrait_")! : UIImage(named: "Bright_portrait")!],
                [UIImage(named: "Bright_wedding_")! : UIImage(named: "Bright_wedding")!],
                [UIImage(named: "Brown_cold_")! : UIImage(named: "Brown_cold")!],
                [UIImage(named: "Brown_film_")! : UIImage(named: "Brown_film")!],
                [UIImage(named: "BW_graphite_")! : UIImage(named: "BW_graphite")!],
                [UIImage(named: "Chocolate__")! : UIImage(named: "Chocolate_")!],
                [UIImage(named: "Chocolate_desaturated_")! : UIImage(named: "Chocolate_desaturated")!],
                [UIImage(named: "Chocolate_film_")! : UIImage(named: "Chocolate_film")!],
                [UIImage(named: "Contrast_wedding_")! : UIImage(named: "Contrast_wedding")!],
                [UIImage(named: "Landscape_cold_")! : UIImage(named: "Landscape_cold")!],
                [UIImage(named: "Landscape_cold_")! : UIImage(named: "Landscape_green")!],
                [UIImage(named: "Nice_toning_")! : UIImage(named: "Nice_toning")!],
                [UIImage(named: "Warm_skin_")! : UIImage(named: "Warm_skin")!]
                ]

let examplesNames = ["Autumn", "Barcelona", "Bright portrait", "Bright wedding", "Brown cold", "Brown film", "BW graphite", "Chocolate", "Chocolate desaturated", "Chocolate film", "Contrast wedding", "Landscape cold", "Landscape green", "Nice toning", "Warm skin"]


let presets = [Bundle.main.path(forResource: "Autumn", ofType: ".dng"),
               Bundle.main.path(forResource: "Barcelona", ofType: ".dng"),
               Bundle.main.path(forResource: "Bright wedding", ofType: ".dng"),
               Bundle.main.path(forResource: "Bright portrait", ofType: ".dng"),
               Bundle.main.path(forResource: "Brown cold", ofType: ".dng"),
               Bundle.main.path(forResource: "Brown film", ofType: ".dng"),
               Bundle.main.path(forResource: "BW graphite", ofType: ".dng"),
               Bundle.main.path(forResource: "Chocolate desaturate", ofType: ".dng"),
               Bundle.main.path(forResource: "Chocolate film", ofType: ".dng"),
               Bundle.main.path(forResource: "Chocolate", ofType: ".dng"),
               Bundle.main.path(forResource: "High contrast", ofType: ".dng"),
               Bundle.main.path(forResource: "Landscape cold", ofType: ".dng"),
               Bundle.main.path(forResource: "Landscape green", ofType: ".dng"),
               Bundle.main.path(forResource: "Nice toning", ofType: ".dng"),
               Bundle.main.path(forResource: "Warm skin", ofType: ".dng")
]

let presetsPreviews = [UIImage(named: "1.jpg")!,
                       UIImage(named: "2.jpg")!,
                       UIImage(named: "3.jpg")!,
                       UIImage(named: "4.jpg")!,
                       UIImage(named: "5.jpg")!,
                       UIImage(named: "6.jpg")!,
                       UIImage(named: "7.jpg")!,
                       UIImage(named: "8.jpg")!,
                       UIImage(named: "9.jpg")!,
                       UIImage(named: "10.jpg")!,
                       UIImage(named: "11.jpg")!,
                       UIImage(named: "12.jpg")!,
                       UIImage(named: "13.jpg")!,
                       UIImage(named: "14.jpg")!,
                       UIImage(named: "15.jpg")!


]

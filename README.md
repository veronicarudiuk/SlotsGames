# SlotsGames app

A slot machine in which you can change the amount of your bet. There are three visual options for the slot set. 

<a href="https://developer.apple.com/swift" target="_blank"><img src="https://img.shields.io/badge/Language-Swift_5-blueviolet.svg" alt="Language: Swift 5" /></a>

___
### Used: UIKit / MVVM / Data Binding / AVFoundation / User Defaults / Auto Layout Programmatically.
___

### Prerequisites

The following are the versions used when compiling this program:

Swift Version: 5

Xcode Version: 14.2

Targeted iOS: 15.0 iPhone

Device Orientation: Portrait, Landscape Left, Landspace Right

## Running the Game

Download all the files from this repo onto a local directory. Compile the program on Xcode.

### Example Run

* SlotsGames app when starting up.

![Main view](https://user-images.githubusercontent.com/105722412/209950145-fab988d2-0a50-428e-a6e0-0efc2eb4628a.gif)

* On the main page you can choose which game of the three you will play. The games differ from each other by the pictures of the slots.

* You can set your rate with the stepper. The slot machine is started by pressing the spin button. 
If there is no slot match, you lose your bet. If two items match, your bet is saved, but you win nothing. If three, four and five slots match, you win x1, x2 and x5 respectively.

* The amount of your money is saved locally on your phone, and will not reset if you close the app. If you run out of money, you get 500 units when you restart the app.

* When you press the spin button, the sound of the slot machine launching comes on. 
If you win money, the sound of winning comes on.

![pack2-6](https://user-images.githubusercontent.com/105722412/209949406-b10ff3e0-70c7-42cc-b4b0-da8c9fe22ce3.gif)
![pack1](https://user-images.githubusercontent.com/105722412/209949643-489a816c-d879-4a29-bee5-420b99e51917.gif)
![pack 3](https://user-images.githubusercontent.com/105722412/209949917-b23eec17-6ccc-43d6-8e9e-3b696240c9de.gif)

## UI Details

### Dynamic Constraints

The application uses dynamic сonstraints, so the сonstraints changes its value depending on the size of the screen device on which the game is open.
The logic of the dynamic constraints can be found in the file path: Helpers -> Managers -> DynamicConstraintsManager.swift 
Examples of scaling UI elements on the iPhone 8 and iPhone 14 Pro.

<img width="522" alt="Screenshot 2022-12-29 at 17 15 30" src="https://user-images.githubusercontent.com/105722412/209958722-4b3b58f5-e8cf-457b-a793-f87e03360f11.png">

### Custom UI Elements

* Segmented Control

To switch between the sections "Popular" and "All games", I created custom segmented control. It is implemented as two buttons with a separate image of a red line under the selected button. This approach allowed me to implement the control exactly as in the design requirements. A small animation is implemented when the button is pressed. 

![control-2](https://user-images.githubusercontent.com/105722412/209951198-b896c089-a7b2-48b3-b529-fc5f0f76da31.gif)

* Stepper

In order to increase and decrease the rate, I implemented custom stepper. It consists of a view with two buttons and a label. This approach allowed me to add distance between the buttons and the label and add animation when the buttons are pressed.

![Screen Recording 2022-12-29 at 15 41 17-4](https://user-images.githubusercontent.com/105722412/209950817-c4145f77-a71c-4504-a5ec-e2bbdf69e3fb.gif)

### Animated Preloader

I've added an animated preloader that shows up when you start the app. This is implemented by creating a separate UIViewController. This approach allowed me to add an animation when the app starts up, since this cannot be done in the LaunchScreen.

![preloader](https://user-images.githubusercontent.com/105722412/209950051-1368d6f7-b224-4e92-adc1-7114ada3330d.gif)

### Other Animation

![moneyLabel](https://user-images.githubusercontent.com/105722412/209950257-1fb98a63-70d8-4fba-9ac7-a8992c703a06.gif) 



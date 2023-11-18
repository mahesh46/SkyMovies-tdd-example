## Gaming Apps Technical Challenge iOS - SkyMovies

Create a native app that allows users to view search results from the free OMDB API available at http://www.omdbapi.com/

## Requirements

- Call the API for a given search term, which will be provided during the challenge.
- Display the returned results in a clear and concise way, building your UI however you see fit.
- You should create a single table/list view which displays all returned results.
- Validate that your code compiles, runs and works.
- Include inline code comments to ensure that another engineer could pick this project up in future and extend/maintain it easily.

## Expectations

- The app should be developed using the latest version of Swift. Feel free to use UIKit, SwiftUI or a combination of both.
- You should not use code generation tools.
- Documentation comments are encouraged.


 # Developer Notes

 ## Implented clean code, used swiftlint pakagemanager
 
<img width="274" alt="Screenshot 2023-11-18 at 21 47 16" src="https://github.com/mahesh46/SkyMovies-tdd-example/assets/3464277/eb635430-c814-436f-a2ca-e6b4815450be">

## Used code coverage when writing tests

<img width="1015" alt="Screenshot 2023-11-18 at 21 48 50" src="https://github.com/mahesh46/SkyMovies-tdd-example/assets/3464277/0039d102-b214-4926-99d5-1b4863c9cffa">

## Added XCTests, SkyMoviesTests

<img width="927" alt="Screenshot 2023-11-18 at 21 31 19" src="https://github.com/mahesh46/SkyMovies-tdd-example/assets/3464277/8b212721-31dc-4a27-94b8-34a41e322c81">

## Added XCTestUI, SkyMoviesUITests

<img width="899" alt="Screenshot 2023-11-18 at 21 46 30" src="https://github.com/mahesh46/SkyMovies-tdd-example/assets/3464277/1863b1d4-9326-42bf-9980-c107dc678581">

> [!NOTE]  
> if keyboard fails to appear in simulator
>  * uncheck I/O  -   Keyboard -  connect hardware keyboard
>  * There is a plist with simulator preferences located at ~/Library/Preferences
>  * To change it to turn off the hardware keyboard, make sure the simulator is off, then run this command:
>  * defaults write com.apple.iphonesimulator ConnectHardwareKeyboard -bool no
>  * You can use xcrun simctl options in a script to shut down simulators.



## SkyMovies app, Demo



https://github.com/mahesh46/SkyMovies-tdd-example/assets/3464277/8cd3df1e-d915-46c7-bdf6-1b5d3f2f4a79





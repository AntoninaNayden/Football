import SwiftUI

struct SwipeGameView: View {
    @State private var ballPosition = CGPoint(x: 200, y: 350)
    @State private var isResetting = false

    @State private var currentLevel = 1
    @State private var hasWon = false
    let ballSize: CGFloat = 40
    let spikeSize: CGFloat = 50

    let levels: [Level] = [
        Level(
            ballStartPosition: CGPoint(x: 200, y: 350),
            winPoint: CGPoint(x: 50, y: 200),
            spikes: [CGPoint(x: 200, y: 200)],
            validPoints: [
                CGPoint(x: 200, y: 200), CGPoint(x: 200, y: 500), CGPoint(x: 50, y: 200),
                CGPoint(x: 350, y: 200), CGPoint(x: 350, y: 500), CGPoint(x: 50, y: 500)
            ],
            backgroundImage: "blueArea1"
        ),
        Level(
            ballStartPosition: CGPoint(x: 200, y: 350),
            winPoint: CGPoint(x: 50, y: 300),
            spikes: [CGPoint(x: 50, y: 350)],
            validPoints: [
                CGPoint(x: 200, y: 180), CGPoint(x: 350, y: 180), CGPoint(x: 350, y: 510),
                CGPoint(x: 200, y: 510), CGPoint(x: 200, y: 350), CGPoint(x: 350, y: 350),
                CGPoint(x: 50, y: 510), CGPoint(x: 50, y: 350), CGPoint(x: 50, y: 180), CGPoint(x: 50, y: 300)
            ],
            backgroundImage: "blueArea2"
        ),
        Level(
            ballStartPosition: CGPoint(x: 200, y: 350),
            winPoint: CGPoint(x: 50, y: 300),
            spikes: [CGPoint(x: 50, y: 350),CGPoint(x: 200, y: 250)],
            validPoints: [
                CGPoint(x: 200, y: 180), CGPoint(x: 350, y: 180), CGPoint(x: 350, y: 510),
                CGPoint(x: 200, y: 510), CGPoint(x: 200, y: 350), CGPoint(x: 350, y: 350),
                CGPoint(x: 50, y: 510), CGPoint(x: 50, y: 350),CGPoint(x: 200, y: 250), CGPoint(x: 50, y: 180), CGPoint(x: 50, y: 300)
            ],
            backgroundImage: "blueArea3"
        ),
        Level(
            ballStartPosition: CGPoint(x: 200, y: 400),
                       winPoint: CGPoint(x: 50, y: 290),
                       spikes: [CGPoint(x: 50, y: 180),CGPoint(x: 200, y: 230), CGPoint(x: 125, y: 290)],
                       validPoints: [
                           CGPoint(x: 200, y: 400), CGPoint(x: 50, y: 180), CGPoint(x: 200, y: 180),
                           CGPoint(x: 350, y: 180), CGPoint(x: 50, y: 290), CGPoint(x: 200, y: 290),
                           CGPoint(x: 350, y: 290), CGPoint(x: 200, y: 230), CGPoint(x: 50, y: 400), CGPoint(x: 350, y: 400), CGPoint(x: 50, y: 510), CGPoint(x: 200, y: 510), CGPoint(x: 350, y: 510), CGPoint(x: 125, y: 290)
            ],
            backgroundImage: "blueArea4"
        ),
        Level(
            ballStartPosition: CGPoint(x: 200, y: 350),
            winPoint: CGPoint(x: 50, y: 290),
            spikes: [CGPoint(x: 50, y: 180),CGPoint(x: 200, y: 510)],
            validPoints: [
              CGPoint(x: 50, y: 180), CGPoint(x: 125, y: 180),
                CGPoint(x: 200, y: 180), CGPoint(x: 275, y: 180), CGPoint(x: 350, y: 180),CGPoint(x: 50, y: 510), CGPoint(x: 125, y: 510),
              CGPoint(x: 200, y: 510), CGPoint(x: 275, y: 510), CGPoint(x: 350, y: 510),CGPoint(x: 50, y: 290)
            ],
            backgroundImage: "blueArea5"
        ),
        Level(
            ballStartPosition: CGPoint(x: 200, y: 330),
            winPoint: CGPoint(x: 50, y: 370),
            spikes: [CGPoint(x: 120, y: 370), CGPoint(x: 200, y: 180)],
            validPoints: [
                CGPoint(x: 200, y: 180), CGPoint(x: 350, y: 180),CGPoint(x: 50, y: 510),CGPoint(x: 200, y: 320),CGPoint(x: 350, y: 320),
              CGPoint(x: 200, y: 510),CGPoint(x: 50, y: 290),CGPoint(x: 50, y: 370),CGPoint(x: 200, y: 370), CGPoint(x: 120, y: 370)
            ],
            backgroundImage: "blueArea6"
        ),
        Level(
            ballStartPosition: CGPoint(x: 200, y: 350),
            winPoint: CGPoint(x: 50, y: 300),
            spikes: [CGPoint(x: 50, y: 180),CGPoint(x: 120, y: 350),CGPoint(x: 320, y: 350),CGPoint(x: 350, y: 510)],
            validPoints: [
                CGPoint(x: 180, y: 180), CGPoint(x: 350, y: 180), CGPoint(x: 350, y: 510),
                CGPoint(x: 220, y: 510), CGPoint(x: 180, y: 350), CGPoint(x: 350, y: 350),
                CGPoint(x: 50, y: 510), CGPoint(x: 50, y: 350), CGPoint(x: 50, y: 180), CGPoint(x: 50, y: 300), CGPoint(x: 220, y: 350),CGPoint(x: 120, y: 350),CGPoint(x: 320, y: 350)
            ],
            backgroundImage: "blueArea7"
        ),
        Level(
            ballStartPosition: CGPoint(x: 180, y: 370),
            winPoint: CGPoint(x: 50, y: 370),
            spikes: [CGPoint(x: 120, y: 180),CGPoint(x: 120, y: 370),CGPoint(x: 180, y: 250),CGPoint(x: 180, y: 450)],
            validPoints: [
                CGPoint(x: 180, y: 180), CGPoint(x: 120, y: 180),CGPoint(x: 350, y: 510),
                CGPoint(x: 180, y: 450),CGPoint(x: 50, y: 510), CGPoint(x: 50, y: 370),  CGPoint(x: 50, y: 300), CGPoint(x: 180, y: 370),CGPoint(x: 120, y: 350),CGPoint(x: 350, y: 370),CGPoint(x: 120, y: 370),CGPoint(x: 180, y: 250),CGPoint(x: 180, y: 510)
            ],
            backgroundImage: "blueArea8"
        ),
        Level(
            ballStartPosition: CGPoint(x: 200, y: 400),
            winPoint: CGPoint(x: 50, y: 280),
            spikes: [CGPoint(x: 200, y: 325),CGPoint(x: 120, y: 280),CGPoint(x: 50, y: 450),CGPoint(x: 120, y: 520)],
            validPoints: [
                CGPoint(x: 200, y: 325),CGPoint(x: 120, y: 280),CGPoint(x: 50, y: 450),CGPoint(x: 120, y: 520), CGPoint(x: 50, y: 280),CGPoint(x: 200, y: 400),CGPoint(x: 350, y: 400),CGPoint(x: 50, y: 400),CGPoint(x: 200, y: 520),CGPoint(x: 350, y: 280),CGPoint(x: 200, y: 280),CGPoint(x: 200, y: 180),CGPoint(x: 50, y: 180),
            ],
            backgroundImage: "blueArea9"
        ),
        Level(
            ballStartPosition: CGPoint(x: 220, y: 320),
            winPoint: CGPoint(x: 50, y: 320),
            spikes: [CGPoint(x: 220, y: 240),CGPoint(x: 120, y: 320),CGPoint(x: 300, y: 320)],
            validPoints: [CGPoint(x: 220, y: 240),CGPoint(x: 120, y: 320),CGPoint(x: 300, y: 320),
                          CGPoint(x: 50, y: 320),CGPoint(x: 200, y: 320),CGPoint(x: 220, y: 510),CGPoint(x: 350, y: 510),CGPoint(x: 350, y: 320),CGPoint(x: 350, y: 180),CGPoint(x: 220, y: 180),CGPoint(x: 50, y: 180)
            ],
            backgroundImage: "blueArea10"
        ),
    ]
    
    var currentLevelConfig: Level {
        if(currentLevel > 10){
            levels[0]
        }
        else{
            levels[currentLevel-1]
        }
    }

    var body: some View {
        ZStack {
            if(currentLevel>=11){
                Image("backFon")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .position(x: 50, y: 100)
                Image("Win")
                    .resizable()
                    .frame(width: 400, height: 700)
                    .padding(.top,150)
            }
            else{
                Image("backFon")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .position(x: 40, y: -18)
                Image("levelk\(currentLevel)")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .position(x: 200, y: 100)
                
                Image(currentLevelConfig.backgroundImage)
                    .resizable()
                    .frame(width: 350, height: 400)
                    .position(x: 200, y: 350)
                Image("ball")
                    .resizable()
                    .zIndex(1.0)
                    .frame(width: ballSize, height: ballSize)
                    .position(ballPosition)
                
                // Шипы
                ForEach(currentLevelConfig.spikes.indices, id: \.self) { index in
                    Image("spike")
                        .resizable()
                        .zIndex(1.0)
                        .frame(width: spikeSize, height: spikeSize)
                        .position(currentLevelConfig.spikes[index])
                }
                
                // Точка победы
                Image("winPoint")
                    .resizable()
                //.zIndex(1.0)
                    .frame(width: ballSize, height: ballSize)
                    .position(currentLevelConfig.winPoint)
            }
        }
        .background(
            Group {
                if currentLevel > 0 && currentLevel < 4 {
                    Image("fonk1")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                } else if currentLevel > 3 && currentLevel < 9 {
                    Image("fonk2")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                } else {
                    Image("fonk3")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                }
            }
        )
        .gesture(
            DragGesture(minimumDistance: 50)
                .onEnded { gesture in
                    guard !isResetting else { return }
                    predictAndMoveBall(gesture: gesture)
                }
        )

        .onChange(of: ballPosition) { newPosition in
            if !hasWon {
                checkWin()
                checkCollision()
            }
        }
    }

    private func predictAndMoveBall(gesture: DragGesture.Value) {
        let translation = gesture.translation
        var predictedPosition = ballPosition

        if abs(translation.width) > abs(translation.height) {
            if translation.width > 0 {
                predictedPosition.x += translation.width
                moveBallToEdge(.right, predictedPosition: predictedPosition)
            } else {
                predictedPosition.x += translation.width
                moveBallToEdge(.left, predictedPosition: predictedPosition)
            }
        } else {
            if translation.height > 0 {
                predictedPosition.y += translation.height
                moveBallToEdge(.down, predictedPosition: predictedPosition)
            } else {
                predictedPosition.y += translation.height
                moveBallToEdge(.up, predictedPosition: predictedPosition)
            }
        }
    }

    private func moveBallToEdge(_ direction: Direction, predictedPosition: CGPoint) {
        let currentPoint = ballPosition
        var newPosition: CGPoint?

        switch direction {
        case .up:
            newPosition = currentLevelConfig.validPoints
                .filter { $0.x == currentPoint.x && $0.y < currentPoint.y }
                .max(by: { $0.y < $1.y })
        case .down:
            newPosition = currentLevelConfig.validPoints
                .filter { $0.x == currentPoint.x && $0.y > currentPoint.y }
                .min(by: { $0.y < $1.y })
        case .left:
            newPosition = currentLevelConfig.validPoints
                .filter { $0.y == currentPoint.y && $0.x < currentPoint.x }
                .max(by: { $0.x < $1.x })
        case .right:
            newPosition = currentLevelConfig.validPoints
                .filter { $0.y == currentPoint.y && $0.x > currentPoint.x }
                .min(by: { $0.x < $1.x })
        }

        if let newPosition = newPosition {
            checkTrajectoryCollision(from: currentPoint, to: newPosition)
            withAnimation(.easeInOut(duration: 0.5)) {
                ballPosition = newPosition
            }
        } else {
        }
    }

    private func checkTrajectoryCollision(from start: CGPoint, to end: CGPoint) {
        let trajectory = CGRect(x: min(start.x, end.x),
                                y: min(start.y, end.y),
                                width: abs(end.x - start.x) + ballSize,
                                height: abs(end.y - start.y) + ballSize)

        for spike in currentLevelConfig.spikes {
            let spikeRect = CGRect(
                x: spike.x - spikeSize / 2,
                y: spike.y - spikeSize / 2,
                width: spikeSize,
                height: spikeSize
            )
            if trajectory.intersects(spikeRect) {
                resetGame()
                return
            }
        }

        let winRect = CGRect(
            x: currentLevelConfig.winPoint.x - ballSize / 2,
            y: currentLevelConfig.winPoint.y - ballSize / 2,
            width: ballSize,
            height: ballSize
        )
        if trajectory.intersects(winRect) {
            hasWon = true
            isResetting = true
            withAnimation(.easeInOut(duration: 0.5)) {
                ballPosition = CGPoint(x: 100, y: 100)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isResetting = false
                goToNextLevel()
            }
            return
        }
    }

    private func checkCollision() {
        for spike in currentLevelConfig.spikes{
            let spikeRect = CGRect(
                x: spike.x - spikeSize / 2,
                y: spike.y - spikeSize / 2,
                width: spikeSize,
                height: spikeSize
            )
            let ballRect = CGRect(
                x: ballPosition.x - ballSize / 2,
                y: ballPosition.y - ballSize / 2,
                width: ballSize,
                height: ballSize
            )
            if spikeRect.intersects(ballRect) {
                resetGame()
                return
            }
        }
    }

    private func checkWin() {
        let winRect = CGRect(
            x: currentLevelConfig.winPoint.x - ballSize / 2,
            y: currentLevelConfig.winPoint.y - ballSize / 2,
            width: ballSize,
            height: ballSize
        )
        let ballRect = CGRect(
            x: ballPosition.x - ballSize / 2,
            y: ballPosition.y - ballSize / 2,
            width: ballSize,
            height: ballSize
        )

        if winRect.intersects(ballRect) {
            hasWon = true
            goToNextLevel()
        }
    }

    private func goToNextLevel() {
               currentLevel += 1
               UserDefaults.standard.set(currentLevel, forKey: "currentLevel")

        if currentLevel <= 10 {
            resetGame()
            hasWon = false
        } else {
      }
    }

    private func resetGame() {
        isResetting = true
        withAnimation(.easeInOut(duration: 0.5)) {
            ballPosition = currentLevelConfig.ballStartPosition
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            isResetting = false
        }
    }


    private enum Direction {
        case up, down, left, right
    }
}
struct Level {
    let ballStartPosition: CGPoint
    let winPoint: CGPoint
    let spikes: [CGPoint]
    let validPoints: [CGPoint]
    let backgroundImage: String
}
#Preview {
    SwipeGameView()
}


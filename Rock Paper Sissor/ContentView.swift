//
//  ContentView.swift
//  Rock Paper Sissor
//
//  Created by shivakumar chirra on 22/05/25.
//


import SwiftUI
import AVFoundation


struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer?

    @State private var player1 = "card1"
    @State private var player2 = "card2"
    @State private var myScore = 0
    @State private var yourScore = 0
    @State private var showPlayer1Win = false
    @State private var showPlayer2Win = false

    var body: some View {
        ZStack {
            Color(.systemOrange)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                Text("Rock Paper Scissor")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(65)

                Spacer()

                HStack {
                    Spacer()
                    ZStack {
                        Image(player1)
                            .resizable()
                            .frame(width: 150, height: 200)
                            .cornerRadius(25)
                        if showPlayer1Win {
                            Image("win")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding(.top, 20)
                        }
                    }
                    Spacer()
                    ZStack {
                        Image(player2)
                            .resizable()
                            .frame(width: 150, height: 200)
                            .cornerRadius(25)
                        if showPlayer2Win {
                            Image("win")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding(.top, 20)
                        }
                    }
                    Spacer()
                }

                Spacer()

                Button(action: {
                    doit()
                }) {
                    Image("btnImage")
                        .resizable()
                        .frame(width: 200, height: 70)
                        .cornerRadius(25)
                }

                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Text("Me")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                        Text(String(myScore))
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        Spacer()
                        Text("You")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                        Text(String(yourScore))
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        Spacer()
                    }
                    Spacer()
                }
                Button(action: {
                    reStart()
                }) {
                    Text("Re Start")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 60)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                Spacer()
            }
        }
    }
        func reStart (){
            myScore = 0
                yourScore = 0

        }

    func doit() {
        let player1Value = Int.random(in: 1...3)
        let player2Value = Int.random(in: 1...3)

        player1 = "card\(player1Value)"
        player2 = "card\(player2Value)"

        showPlayer1Win = false
        showPlayer2Win = false

        if (player1Value == 1 && player2Value == 3) ||
           (player1Value == 2 && player2Value == 1) ||
           (player1Value == 3 && player2Value == 2) {
            myScore += 1
            showPlayer1Win = true
            playSound(name: "me1")
        } else if (player2Value == 1 && player1Value == 3) ||
                  (player2Value == 2 && player1Value == 1) ||
                  (player2Value == 3 && player1Value == 2) {
            yourScore += 1
            showPlayer2Win = true
            playSound(name: "you")
        } else {
            playSound(name: "tie1")
        }
    }

    func playSound(name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else {
            print("Sound file not found: \(name).wav")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error)")
        }
    }
}

#Preview {
    ContentView()
}

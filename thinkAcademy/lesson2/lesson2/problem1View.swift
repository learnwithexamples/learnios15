//
//  problem1View.swift
//  lesson2
//
//  Created by Learn with Examples on 6/12/22.
//

import SwiftUI

struct problem1View: View {
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    private var tops = ["top1", "top2", "top3"]
    private var pants = ["pant1", "pant2", "pant3", "pant4"]
//    private var gridLayout1 = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
//    private var gridLayout2 = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var showAlert : Bool = false
    @State private var count1 : Int = 3
    @State private var count2 : Int = 4
    @State private var isCorrect : Bool = true
    private func adjust(x : Int) {
        self.count1 = self.count1 + x
    }
    private func add1() {
        if self.count1 < 5 {
            self.count1 = self.count1 + 1
            updateChoice()
        }
    }
    private func reduce1() {
        if self.count1 > 1 {
            self.count1 = self.count1 - 1
            updateChoice()
        }
    }
    private func add2() {
        if self.count2 < 5 {
            self.count2 = self.count2 + 1
            updateChoice()
        }
    }
    private func reduce2() {
        if self.count2 > 1 {
            self.count2 = self.count2 - 1
            updateChoice()
        }
    }
    @State private var correctRes : Int = 12
    @State private var PossRes : [Int] = [3, 4, 5, 12]
    private func updateChoice() {
        self.PossRes.removeAll()
        self.correctRes = self.count1 * self.count2
        var tmp = (1...20).map( {_ in Int.random(in: 1...self.correctRes * 4)})
        tmp.append(self.correctRes)
        let tmp2 = Array(Set(tmp))
        var hasRight : Bool = false
        for x in 0...min(3, tmp2.count - 1) {
            self.PossRes.append(tmp2[x])
            if tmp2[x] == self.correctRes {
                hasRight = true
            }
        }
        if !hasRight {
            self.PossRes.append(self.correctRes)
        }
        self.PossRes = self.PossRes.sorted()
//        self.PossRes = Array(Set(self.PossRes))
    }
    private func checkRes(tmpRes : Int) {
        if (tmpRes == self.correctRes) {
            self.isCorrect = true
        } else {
            self.isCorrect = false
        }
        self.showAlert = true
    }
    var body: some View {
        VStack {
            Text("Aiden's homework").font(.title).foregroundColor(Color.blue).padding()
            Text("Neil has \(count1) tops and \(count2) pairs of pans. He wants to choose a top and a pair of pants for today's outfit. How many different outfits are there for Neil to choose?")
                .font(.title)
            HStack {
                Button(action: reduce1, label: {Image(systemName: "minus.circle").font(Font.system(size: 60, weight: .ultraLight))})
                Spacer()
                ForEach(0...count1-1, id: \.self) { idx in
                    Image("top\(idx)").resizable().aspectRatio(contentMode: .fit).frame(width: 120, height: 120, alignment: Alignment.center)
               }
                Spacer()
                Button(action: add1, label: {Image(systemName: "plus.circle").font(Font.system(size: 60, weight: .ultraLight))})
            }
            HStack {
                Button(action: reduce2, label: {Image(systemName: "minus.circle").font(Font.system(size: 60, weight: .ultraLight))})
                Spacer()
                ForEach(0...count2-1, id: \.self) { idx in
                    Image("pant\(idx)").resizable().aspectRatio(contentMode: .fit).frame(width: 120, height: 120, alignment: Alignment.center)
               }
//                ForEach (1...count2, id: \.self) { Text(String($0)).padding()}
                Spacer()
                Button(action: add2, label: {Image(systemName: "plus.circle").font(Font.system(size: 60, weight: .ultraLight))})
            }
//            ScrollView {
//                LazyVGrid(columns: gridLayout1, spacing: 10) {
//                    ForEach(tops, id: \.self) {
//                        Text($0)
//                    }
//                }
//            }
            Spacer()
            HStack {
                ForEach (0...self.PossRes.count-1, id: \.self) {
                    let tmpRes = self.PossRes[$0]
                    Button(action: {
                        checkRes(tmpRes: tmpRes)
                    }, label: {
                        Text("\(tmpRes)").frame(width: 100.0).background(Color.blue)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 60, weight: .bold))
                    }).padding()
                }
//                Button("D.12", action: dummy).padding()
            }.frame(minWidth: 0, maxWidth: .infinity)
        }.alert(isPresented: $showAlert) {
            if self.isCorrect {
                return  Alert(title: Text("You are right :)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color.red), message: Text("Good Job")
                    .font(.largeTitle)
                    .foregroundColor(Color.red), dismissButton: .default(Text("OK")))
            } else {
                return  Alert(title: Text("You are wrong"), message: Text("try again :("), dismissButton: .default(Text("Try again")))
            }
        }.padding()
    }
}

struct problem1View_Previews: PreviewProvider {
    static var previews: some View {
        problem1View()
    }
}

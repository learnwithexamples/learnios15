//
//  problem2View.swift
//  lesson2
//
//  Created by Learn with Examples on 6/15/22.
//

import SwiftUI

struct problem2View: View {
    let names: [String] = ["Linda", "Jack", "Bob", "Aiden", "Chase"]
    let namesShort : String = "LJBAC"
    @State var combos = ["LJB", "JLB", "BLJ", "LBJ", "JBL", "BJL"]
    private func getNameStr(num: Int) -> String {
        var nameStr: String = ""
        for idx in 0...num-1 {
            nameStr = nameStr + names[idx] + ", "
        }
        return nameStr
    }
    @State private var count1 : Int = 3
    private func updateCombo() {
        combos.removeAll()
//      https://www.dcode.fr/permutations-generator
        if self.count1 == 1 {
            combos = ["L"]
        } else if self.count1 == 2 {
            combos = ["LJ", "JL"]
        } else if self.count1 == 3 {
            combos = ["LJB", "JLB", "BLJ", "LBJ", "JBL", "BJL"]
        } else if self.count1 == 4 {
            combos = ["LJBA", "JLBA", "BLJA", "LBJA", "JBLA", "BJLA", "BJAL", "JBAL", "ABJL", "BAJL", "JABL", "AJBL", "ALBJ", "LABJ", "BALJ", "ABLJ", "LBAJ", "BLAJ", "JLAB", "LJAB", "AJLB", "JALB", "LAJB", "ALJB"]
        }
    }
    private func add1() {
        if self.count1 < 4 {
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
    @State private var correctRes : Int = 6
    @State private var PossRes : [Int] = [3, 4, 6, 12]
    private func updateChoice() {
        self.isCorrect = false
        self.updateCombo()
        self.PossRes.removeAll()
        self.correctRes = combos.count
//        for i in 1 ... self.count1 {
//            self.correctRes = self.correctRes * i
//        }
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
        private var gridLayout1 = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    @State private var showAlert : Bool = false
    @State private var isCorrect : Bool = false
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
            Text("Aiden's homework")
                .font(.largeTitle)
                .foregroundColor(Color.blue).padding()
            HStack {
                Button(action: reduce1, label: {Image(systemName: "minus.circle").font(Font.system(size: 60, weight: .ultraLight))})
                Text("\(self.getNameStr(num: self.count1)) want to take a photo together. How many different ways are there for them to line up?")
                    .font(.title).padding()
                Button(action: add1, label: {Image(systemName: "plus.circle").font(Font.system(size: 60, weight: .ultraLight))})
            }
            HStack {
                ForEach(0...count1-1, id: \.self) { idx in
                    Image("pep\(idx)").resizable().aspectRatio(contentMode: .fit).frame(width: 120, height: 120, alignment: Alignment.center)
               }
            }
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
//            Text(String(self.correctRes))
            if self.isCorrect {
                ScrollView {
                    LazyVGrid(columns: gridLayout1, spacing: 10) {
                        ForEach(self.combos, id: \.self) {
                            Text($0)
                                .font(.largeTitle)
                        }
                    }
                }
            }
//
//            ForEach (0 ... self.correctRes-1, id: \.self) { idx in
//                Text(String(self.combos[idx]))
//                    .font(.largeTitle)
//            }
            Spacer()
//            Text("ddddd")
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

struct problem2View_Previews: PreviewProvider {
    static var previews: some View {
        problem2View()
    }
}

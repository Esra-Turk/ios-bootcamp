import UIKit

func icAcilarToplami(kenarSayisi: Int) -> Int {
    return (kenarSayisi - 2) * 180
}

func maasHesapla(günSayisi: Int) -> Int {
    let saatUcreti = 10
    let mesaiSaatUcreti = 20
    let calismaSaati = günSayisi * 8
    
    if calismaSaati <= 160 {
        return calismaSaati * saatUcreti
    }else {
        let mesaiSaati = calismaSaati - 160
        let mesaiMaas = mesaiSaati * mesaiSaatUcreti
        
        return (160 * saatUcreti) + mesaiMaas
    }
}

func faturaAsimUcreti(kotaMiktari: Double) -> Double {
    let internetUcreti50gb = 100
    
    return Double(internetUcreti50gb) + (kotaMiktari - 50) * 4

}

func derecedenFahrenhiet(derece: Double) -> Double{
    var fahrenhiet  = derece * 1.8 + 32
    return fahrenhiet
}

func dikdortgenCevreHesaplama(kisaKenar: Double, uzunKenar: Double) -> Double{
    return kisaKenar * 2 + uzunKenar * 2
}


func faktoriyelHesapla(sayi: Int) -> Int {
    if(sayi == 0 || sayi == 1){
        return 1
    }else {
        return sayi * faktoriyelHesapla(sayi: sayi - 1)
    }
}

func aHarfiSayisi(kelime: String) -> Int {
    return kelime.filter { $0 == "a" }.count
}


var aci = icAcilarToplami(kenarSayisi: 5)
print("Beşgenin iç açıları toplamı: \(aci)")

var maas = maasHesapla(günSayisi: 27)
print("Ağustos ayı maaşınız: \(maas)")

var fatura = faturaAsimUcreti(kotaMiktari: 55)
print("Eylül ayı faturanız: \(fatura) ₺")

var fahrenhiet = derecedenFahrenhiet(derece: 34)
print("Pazartesi günü hava \(fahrenhiet) F ")

var cevre = dikdortgenCevreHesaplama(kisaKenar: 10.0, uzunKenar: 34.0)
print("Dikdörgen çevresi: \(cevre)")

var faktoriyel = faktoriyelHesapla(sayi: 5)
print("5! = \(faktoriyel)")

var sayi = aHarfiSayisi(kelime: "Merhaba")
print("a harfi sayısı: \(sayi)")

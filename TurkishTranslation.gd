extends Node
class_name TurkishTranslation

const tur := {
	"StartHeader" : "Kargocular",
	"StartExpl" : """Aynı kargo şirketinde çalışan iki arkadaş iddiaya girer: “Bir günde hangimiz daha çok kargo teslim edecek?”
	
Kargo şirketi çalışanlarına birer paket dolu kamyon verir. Her kamyonun gitmesi gereken 9 mahalle vardır.

  Mahalle/Paket Sayısı
A			 1
B			 2
C 			3
D 			4
E 			5
F 			6
G 			7
H 			8
I 			9

Amaç; bir gün içerisinde en çok paketi teslim etmektir.""",
	"Rules":"Kurallar",
	"Play":"Oyna",
	"RulesHeader" : "Nasıl Oynanır?",
	"RulesExpl" : """
	• Oyuncu bir çift zar atar.
	• Gelen zarlar toplanır. Örneğin 6 ve 5 geldiyse, toplam 11 yapar. Bu, oyuncunun toplamı 11 yapan sayıları eleyebileceği anlamına gelir:
6+5 (6 ve 5’i ele)
2+3+6 (2, 3 ve 6’yı ele)
1+2+3+5 (1, 2, 3 ve 6’yı ele)
vs.
	• Bir sayı sadece bir defa elenebilir.
	• Oyun ya tüm sayılar elendiğinde ya da atılan zarların toplamı elenemediğinde biter: Örneğin atılan zar 1 ve 2 gelmiş olsun. Toplam 3’tür. Ama diyelim ki 2 ve 3 önceki ellerde elenmişti. Bu yüzden oyuncunun yapacağı bir hamle kalmamıştır ve oyun burada biter.""",
	"Back" : "Geri",
	"Confirm" : "Seçimi Onayla",
	"Clear" : "Seçimi Sil",
	"TryAgain" : "Yeniden Dene",
	"Roll" : "Salla!",
	"RollDicesFirst" : "Önce zarları sallamalısın!",
	"PackagesDelivered" : "Şu ana dek toplam %d paket teslim ettin, sallamaya devam!!",
	"SumToLow" : "Seçilen toplam çok düşük!",
	"SumToHigh" : "Seçilen toplam çok yüksek!",
	"GameOverText" : """Eleyeceğin sayı kalmadı, oyun bitti

Teslim edilen paket sayısı: %d""",
"LanguageSelect" : "Dil Seçin"
}

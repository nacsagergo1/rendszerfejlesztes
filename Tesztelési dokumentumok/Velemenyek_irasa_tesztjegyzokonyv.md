# Tesztjegyzőkönyv - Véleményírás

Az alábbi tesztdokumentum az Étel projekthez tartozó 8.3.5. Véleményírás oldal és 8.4.5. Vélemények kezelésének háttérlogikája funkcióihoz készült. Felelőse: **Nacsa Gergő**

# 1. Teszteljárások - TP

## 1.1. Új vélemény írása

* Azonosító: TP-01
* Tesztesetek: TC-01
* Leírás: Új vélemény írása egy bejelentkzett felhasználóval egy múltbeli foglaláshoz. Az alkalmazás megnyitása, valamint bejelentkezés után a Profil oldalra szükséges navigálni, ahol a múltban lezajlott foglalások táblázatában megtalálható a Műveletek oszlopban a Véleményezés gomb. Rákattintáskor egy modális ablak fogad, ahol a vélemény csillagozással, valamint szövegesen megadható.








# 2. Tesztesetek - TC

## 2.1 Új vélemény írása

### 2.1.1 TC-01

* TP: TP-01
* Leírás: Értékelés megadása egy megadott értékkel (csillagozás) valamint vélemény írása max 250 karakter hosszan.
* Bemenet: 5 csillag, valamint "Kiváló volt a kiszolgálás!".
* Elvárt kimenet: A véleményezés megtörténik, a fő oldalon megjelenik az értékelés a megadott értékkel, szöveggel, felhasználónévvel, valamint a leadott értékelések száma nő eggyel és az értékelések átlaga dinamikusan változik a megadott csillagok függvényében.


### 2.1.2 TC-02

* TP: TP-02
* Leírás: Értékelés megadása egy megadott értékkel (csillagozás) valamint vélemény írása több, mint 250 karakter hosszan.
* Bemenet: 5 csillag, valamint egy több, mint 250 karakter hosszú vélemény.
* Elvárt kimenet: A véleményezés nem történik meg, a fő oldalon nem jelenik meg.


### 2.1.3 TC-03

* TP: TP-03
* Leírás: Értékelés megadása csillagozás nélkül, valamint vélemény írása max 250 karakter hosszan.
* Bemenet: "Kiváló volt a kiszolgálás!".
* Elvárt kimenet: A véleményezés nem történik meg, a fő oldalon nem jelenik meg.


### 2.1.4 TC-04

* TP: TP-04
* Leírás: Értékelés megadása egy megadott értékkel (csillagozás), vélemény írása nélkül.
* Bemenet: 5 csillag.
* Elvárt kimenet: A véleményezés nem történik meg, a fő oldalon nem jelenik meg.


### 2.1.5 TC-05

* TP: TP-05
* Leírás: Értékelés megadása egy megadott értékkel (csillagozás) valamint vélemény írása max 250 karakter hosszan egy korábban már értékelt foglaláshoz.
* Bemenet: 5 csillag, valamint "Kiváló volt a kiszolgálás!".
* Elvárt kimenet: A véleményezés nem történik meg, a fő oldalon nem jelenik meg.








# 3. Tesztriportok - TR

## 3.1 Új vélemény írása

### 3.1.1 TR-01 (TC-01)

* TP: TP-01
* Az 5 csillag és vélemény megadása (<=250 szó) után az Elküld gombbal töltöttem fel az értékelést.
* Helyes eredmény érkezett; A főoldalon megjelent az új értékelés a megadott értékkel, szöveggel, felhasználónévvel, valamint a leadott értékelések száma nőtt eggyel és az értékelések átlaga dinamikusan változott a megadott csillagok függvényében.



### 3.1.2 TR-02

* TP: TP-02
* Az 5 csillag és vélemény megadása (>250 szó) után az Elküld gombbal próbáltam feltöltöteni az értékelést.
* Helyes eredmény érkezett; A főoldalon nem jelent meg az új értékelés.


### 3.1.3 TR-03

* TP: TP-03
* A vélemény megadása (<=250 szó) után az Elküld gombbal próbáltam feltöltöteni az értékelést.
* Helyes eredmény érkezett; A főoldalon nem jelent meg az új értékelés.


### 3.1.4 TR-04

* TP: TP-04
* Az 5 csillagos értékelés megadása után az Elküld gombbal próbáltam feltöltöteni az értékelést.
* Helyes eredmény érkezett; A főoldalon nem jelent meg az új értékelés.


### 3.1.5 TR-05

* TP: TP-05
* Az 5 csillag és vélemény megadása (<=250 szó) után az Elküld gombbal töltöttem fel az értékelést.
* Helyes eredmény érkezett; A főoldalon nem jelent meg az új értékelés.


# Összegzés
> A teszteljárás és a tesztesetek alapján a véleményezés funkció megfelelően működik, és a rendszer a várt módon kezeli a különböző bemeneteket.
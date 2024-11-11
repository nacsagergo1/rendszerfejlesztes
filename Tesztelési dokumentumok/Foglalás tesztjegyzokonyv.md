# Tesztjegyzőkönyv-Asztalfoglalás

Az alábbi tesztdokumentum az Étel projekthez tartozó 8.3.8. és 8.3.9. Asztalfoglalás oldal, illetve a 8.3.15. Asztalfoglalás háttérlogika kialakítása funkcióihoz készült. Felelőse: Sánta Krisztina Csilla

## 1. Teszteljárások (TP)

### 1.1. Új foglalás felvitele
- Azonosító: TP-01
- Tesztesetek: TC-01, TC-2, TC-3
- Leírás: Új foglalás leadása bejelentkezett felhasználóval
    0. lépés: Nyissuk meg az alkalmazást, , jelentkezzünk be egy már regisztrált felhasználóval,  navigáljunk a Foglalás oldalra
    1. lépés: Adjuk meg a várható személyek számát
    2. lépés: Nyomjuk meg a Foglalás keresése gombot
    3. lépés: Válasszuk ki a foglalás dátumát és időpontját
    4. lépés: A felugró megerősítő ablakot zárjuk be
    5. lépés: A profil oldalra navigálva ellenőrizzük a jövőbeli foglalásaim táblázatban az eredményt


## 2. Teszesetek (TC)

### 2.1. Új foglalás felvitele

#### 2.1. TC-01
- TP: TP-01
- Leírás: Normál foglalás (jövőbeli dátum, pozitív, összes szabad helynél nem nagyobb létszám)
- Bemenet: várható személyek száma: 6, dátum: 2024.11.22. 19:00
- Művelet: kattintsunk az időpontra
- Elvárt kimenet: a profil oldalon a foglalás megjelenik a megadott adatokkal, valamint a szabad helyek száma a 6-tal csökken abban az időpontban

#### 2.2. TC-02
- TP: TP-01
- Leírás: Foglalás múltbéli dátumra
- Bemenet: várható személyek száma: 6, dátum: 2024.11.01. 19:00
- Művelet: kattintsunk az időpontra
- Elvárt kimenet: Nem enged az időpontra kattintani, jelez hogy múltbéli időpont nem foglalható

#### 2.3. TC-03
- TP: TP-01
- Leírás: Foglalás maximum férőhelynél nagyobb létszámmal
- Bemenet: várható személyek száma: 95, dátum: 2024.11.21. 19:00
- Művelet: kattintsunk az időpontra
- Elvárt kimenet: Nem enged egyik időpontra sem kattintani, aminél a szabad helyek száma nem éri el a megadott értéket

## 3. Tesztriportok (TR)

### 3.1. Új foglalás felvitele

#### 3.1.1. TR-01 (TC-01)
- TP: TP-01
    1. lépés: megadtam a várható személyek számát (6)
    2. lépés: megnyomtam a foglalás keresése gombot
    3. lépés: rákattintottam a dátumon belül az időpontra (2024.11.01. 19:00)
    4. lépés: helyes eredményt kaptam, a profil oldalon ellenőriztem a táblázatot (foglalás dátuma: 2024.11.22. 19:00, várható létszám: 6) a foglalások oldalon az adott időpontban a szabad helyek száma 6-al csökkent (50-re, 56-ról)

#### 3.1.2. TR-02 (TC-02)
- TP: TP-02
    1. lépés: megadtam a várható személyek számát (6)
    2. lépés: megnyomtam a foglalás keresése gombot
    3. lépés: rákattintottam a dátumon belül az időpontra (2024.11.22. 19:00)
    4. lépés: helyes eredményt kaptam, az oldal nem engedett foglalást véglegesíteni, a profil oldalon sem látszik a foglalás

#### 3.1.3. TR-03 (TC-03)
- TP: TP-03
    1. lépés: megadtam a várható személyek számát (95)
    2. lépés: megnyomtam a foglalás keresése gombot
    3. lépés: rákattintottam a dátumon belül az időpontra (2024.11.21. 19:00)
    4. lépés: helyes eredményt kaptam, az oldal nem engedett foglalást véglegesíteni, a profil oldalon sem látszik a foglalás



    

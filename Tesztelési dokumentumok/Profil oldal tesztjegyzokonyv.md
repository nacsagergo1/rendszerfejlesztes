# Tesztjegyzőkönyv-Profil oldal

Az alábbi tesztdokumentum az Étel projekthez tartozó 8.3.10. Profil oldal, illetve 8.3.14. Profil oldal háttérlogika funkcióihoz készült. Felelőse: Sánta Krisztina Csilla

## 1. Teszteljárások (TP)

### 1.1. Foglalások módosítása a profil oldalon
- Azonosító: TP-01
- Tesztesetek: TC-01
- Leírás: foglalások és személyes adatok megjelenítésének, valamint a jövőbeli foglalások módosításának tesztelése bejelentkezett felhasználóval
    0. lépés: Nyissuk meg az alkalmazást, jelentkezzünk be egy már regisztrált felhasználóval,  navigáljunk a profil oldalra
    1. lépés: A jövőbeli foglalások táblázatban az egyik foglalásnál nyomjuk meg a Módosítás gombot
    2. lépés: Állítsuk át a foglalás dátumát 2 nappal későbbi időpontra (jelenleg ez a 2024.11.14. dátum), és emeljük meg a várható létszámot 2-vel
    3. lépés: Ellenőrizzük a módosított foglalás dátumát, és a várható létszámot

### 1.2. Jövőbeli foglalások törlése a profil oldalon
- Azonosító: TP-02
- Tesztesetek: TC-02
- Leírás: 
    0. lépés: Nyissuk meg az alkalmazást, jelentkezzünk be egy már regisztrált felhasználóval, navigáljunk a profil oldalra
    1. lépés: A jövőbeli foglalások táblázatban az egyik foglalásnál nyomjuk meg a Módosítás gombot
    2. lépés: Nyomjuk meg a Foglalás törlése gombot 
    3. lépés: Ellenőrizzük a jövőbeli foglalások táblázatot és a benne szereplő foglalásokat

### 1.3 Profil oldal megnyitása
- Azonosító: TP-03
- Tesztesetek: TC-03, TC-04
- Leírás:
    0. lépés: Nyissuk meg az alkalmazást, és írjuk be a profil oldal url-jét
    1. lépés: Ellenőrizzük hogy a profil oldalra navigáltunk-e
    (Helyes működés: bejelentkezett felhasználóval a profil oldalra, míg nem bejelentkezettel a bejelentkezés oldalra jutunk)

## 2. Teszesetek (TC)

### 2.1. Összeadás funkció tesztesetei

#### 2.1. TC-01
- TP: TP-01
- Leírás: Foglalás módosításának tesztelése 
- Bemenet: a foglalás kiválasztása, foglalás dátuma = 2024.11.14. 17:30 ; Várható létszám = 6 
- Művelet: nyomjuk meg a Mentés gombot 
- Elvárt kimenet: a foglalás sorában a foglalás dátuma 2024.11.14. 17:30 és a várható létszám 6-ra változása

#### 2.2. TC-02
- TP: TP-01
- Leírás: Foglalás törlésének tesztelése
- Bemenet: A foglalás kiválasztása
- Művelet: nyomjuk meg a Foglalás törlése gombot 
- Elvárt kimenet: a jövőbeli foglalások táblázatban a törölt foglalás nem látszódik

#### 2.3. TC-03
- TP: TP-03
- Leírás: Profil oldal elérhetőségének tesztelése
- Bemenet: Bejelentkezett felhasználóval az url sávba írjuk be a /profile útvonalat
- Művelet: nyomjunk entert
- Elvárt kimenet: A profil oldal jelenik meg a bejelentkezett felhasználó e-mail címével

#### 2.4. TC-04
- TP: TP-03
- Leírás: Profil oldal elérhetőségének tesztelése
- Bemenet: Nem bejelentkezett felhasználóval az url sávba írjuk be a /profile útvonalat
- Művelet: nyomjunk entert
- Elvárt kimenet: profil oldal helyett a bejelentkezés oldal (/login) jelenik meg

## 3. Tesztriportok (TR)

### 3.1. Foglalások módosítása a profil oldalon

#### 3.1.1. TR-01 (TC-01)
- TP: TP-01
    1. lépés: megnyomtam a módosítás gombot
    2. lépés: a foglalás dátumának beírtam a 2024.11.14. 17:30-at a várható létszámnak a 6-ot
    3. lépés: megnyomtam a Módosít gombot
    4. lépés: a táblázatban helyes eredményt kaptam (2024.11.14. 17:30 és 6, minden más nem változott)
    
### 3.2. Jövőbeli foglalások törlése a profil oldalon

#### 3.2.1. TR-02 (TC-02)
- TP: TP-02
    1. lépés: megnyomtam a módosít gombot
    2. lépés: megnyomtam a foglalás törlése gombot
    3. lépés: helyes eredményt kaptam (a táblázatban nem látszik a törölt foglalás)

### 3.3. Profil oldal elérése

#### 3.3.1. TR-03 (TC-03)
- TP: TP-03
    1. lépés: megadtam a /profile útvonalat
    2. lépés: megnyomtam az entert
    3. lépés: a profil oldal jelent meg a bejelentkezett felhasználó e-mail címével

#### 3.3.2. TR-04 (TC-04)
- TP: TP-02
    1. lépés: megadtam a /profile útvonalat
    2. lépés: megnyomtam az entert
    3. lépés: a bejelentkezés oldal töltődött be

    

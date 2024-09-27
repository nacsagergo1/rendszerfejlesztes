# Étel Projektterv 2024

## 1. Összefoglaló 


Az étteremben töltött ídő minőségét, a vacsoránk élményét nagyban befolyásolja az étterem dolgozóinak vendégszeretete, az étel ízélménye, továbbá a környezet hangulata. Mindez azonban csak a fantáziánkban élhet tovább, ha nincs jól leszervezve a délutáni programunk.
Weboldalunkon lehetővé tesszük, hogy az étel és italkínálatunk megtekintése mellett a megfelelő asztalt lefoglalhassa, a foglalásait kezelhesse, valamint az élményeit, tapasztalatait megossza velünk, hogy a jövőben tovább fejlődhessünk.


## 2. A projekt bemutatása

Ez a projektterv az Étel projektet mutatja be, amely 2024-09-16-tól 2024-12-04-ig tart, azaz összesen 79 napon keresztül fog futni. A projekten öt fejlesztő fog dolgozni, az elvégzett feladatokat pedig négy alkalommal fogjuk prezentálni a megrendelőnek, annak érdekében, hogy biztosítsuk a projekt folyamatos előrehaladását.


### 2.1. Rendszerspecifikáció

A rendszernek képesnek kell lennie az étterem asztalai foglaltsági állapotának ellenőrzésére, valamint azok lefoglalására a felhasználók által. A regisztrált és bejelentkezett felhasználók képesek a meglévő foglalásaik kezelésére, módosítására, valamint a foglalás időtartama után visszajelzés írására, amit az új vendégek a főoldalon meg tudnak tekinteni. Ezen felül meg tudják tekinteni az étel és italkínálatot, valamint az aktuális heti menüt.


### 2.2. Funkcionális követelmények

 - Felhasználók kezelése
 - Felhasználói munkamenet megvalósítása
 - Asztalfoglalások kezelése
 - Vélemények kezelése és dinamikus megjelenítése
 - Elfelejtett jeszó visszaállítása
 - Felhasználói profil aktiválása email-en keresztül

### 2.3. Nem funkcionális követelmények

 - A kliens oldal böngészőfüggetlen legyen
 - Reszponzív megjelenés
 - Az érzékeny adatokat biztonságosan tároljuk
 - Mobilon is megjeleníthető legyen


## 3. Költség- és erőforrás-szükségletek

Az erőforrásigényünk összesen `57` személynap, átlagosan `19` személynap/fő.

A rendelkezésünkre áll összesen 5 * 70 = 350 pont.


## 4. Szervezeti felépítés és felelősségmegosztás

A projekt megrendelője Mihály Pál. Az Étel projektet a projektcsapat fogja végrehajtani, amely jelenleg öt fejlesztőből áll. A csapatban található tapasztalt és pályakezdő webprogramozó is. A tapasztalt projekttagok több éve dolgoznak az iparban, számos sikeres projektten vannak túl.
 - `Mangó Ferenc Ákos (írd ide a tapasztalatodat)`
 - `Nacsa Gergő (írd ide a tapasztalatodat)`
 - `Rózsás Péter (írd ide a tapasztalatodat)`
 - Sánta Krisztina Csilla (3 év egyetemi és magánprojekt tapasztalat)
 - `Varga Csanád Sándor (írd ide a tapasztalatodat)`


### 4.1 Projektcsapat

A projekt a következő emberekből áll:

| Név            | Pozíció          |   E-mail cím (stud-os)        |
|----------------|------------------|-------------------------------|
|Sánta Krisztina | Projektmenedzser | h269825@stud.u-szeged.hu      |
| Mangó Ákos     | Projekt tag      | `h000000@stud.u-szeged.hu`    |
| Nacsa Gergő    | Projekt tag      | `h000000@stud.u-szeged.hu`    |
| Rózsás Péter   | Projekt tag      | `h000000@stud.u-szeged.hu`    |
| Varga Csanád   | Projekt tag      | `h000000@stud.u-szeged.hu`    | 


## 5. A munka feltételei

### 5.1. Munkakörnyezet

A projekt a következő munkaállomásokat fogja használni a munka során:

`Minenki írja ide pls`

- Asus Zenbook UX534 I7 8565U, GTX 1650 Mobile Max Design
- Acer Swift 3 SF314-43 laptop (CPU: AMD Ryzen 5 5500U, RAM: 16 GB, GPU: AMD Radeon, OS: Windows 11)

A projekt a következő technológiákat/szoftvereket fogja használni a munka során: 

 - `Heroku platformszolgáltatás a webalkalmazás hosztolásához`
 - `Heroku által biztosított PostgreSQL adatbázisszerver`
 - `Spring Boot keretrendszer`
 - `Thymeleaf dinamikus tartalom megjelenítés a felhasználói felületen`
 - `Maven szoftverprojekt menedzselő szoftver`
 - `Eclipse IDE fejlesztőkörnyezet`
 - Git verziókövető (GitLab)
 
```
Milyen gépet használnak a projekttagok, milyen operációs rendszeren fejlesztenek, milyen szoftverkörnyezetben, stb.
```

### 5.2. Rizikómenedzsment

| Kockázat                                    | Leírás                                                                                                                                                                                     | Valószínűség | Hatás  |
|---------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------|--------|
| Betegség                                  | Súlyosságtól függően hátráltatja vagy bizonyos esetekben teljes mértékben korlátozza a munkavégzőt, így az egész projektre kihatással van. Megoldás: a feladatok átcsoportosítása        | közepes       | erős |
| Kommunikációs fennakadás a csapattagokkal | A csapattagok között nem elégséges az információ áramlás, nem pontosan, esetleg késve vagy nem egyértelműen tájékoztatjuk egymást. Megoldás: még gyakoribb megbeszélések és ellenőrzések | kis        | erős |
| Hirtelen sok zh | A mennyiségtől és a tantárgyak nehézségétől függően több/kevesebb időre hátráltatja a munkavégzőt. Megoldás: feladatok átcsoportosítása | közepes | erős |
| Szoftver-hardver problémák | Ez a probléma, mivel kifejezetten a munkaeszközön jelentkezik, teljesen megakaszthatja a munkavégzőt. Megoldás: segítség a csapattagnak, feladatok átszervezése. | kis | erős |
 

## 6. Jelentések

### 6.1. Munka menedzsment
A munkát Sánta Krisztina koordinálja. Fő feladata, hogy folyamatosan egyeztessen a csapattagokkal az előrehaladásról és a fellépő problémákról, esetlegesen a megoldásban is segítséget nyújhat a projekt csúszásának elkerülése végett. További feladata a heti szinten tartandó csoportgyűlések időpontjának és helyszínének leszervezése, erről Discordon tájékoztatja a projektcsapatot.


### 6.2. Csoportgyűlések

A projekt hetente ülésezik, hogy megvitassák az azt megelőző hét problémáit, illetve hogy megbeszéljék a következő hét feladatait. A megbeszélésről minden esetben memó készül.

1. megbeszélés:
 - Időpont: 2024.09.22.
 - Hely: online
 - Résztvevők: Nacsa Gergő, Sánta Krisztina, Rózsás Péter, Varga Csanád
 - Érintett témák: Ismerkedés, projekttéma kiválasztása, projektvezető megválasztása, ötletek felvázolása

2. megbeszélés:
 - Időpont: 2021.09.27.
 - Hely: online
 - Résztvevők: Mangó Ferenc, Nacsa Gergő, Sánta Krisztina, Varga Csanád
 - Érintett témák: A projektben használt technológiák rögzítése, a projektterv áttekintése, szerepkörök és vállalások kiosztása

### 6.3. Minőségbiztosítás

Az elkészült terveket a terveken nem dolgozó csapattársak közül átnézik, hogy megfelel-e a specifikációnak és az egyes diagramtípusok összhangban vannak-e egymással. A meglévő rendszerünk helyes működését a prototípusok bemutatása előtt a tesztelési dokumentumban leírtak végrehajtása alapján ellenőrizzük és összevetjük a specifikációval, hogy az elvárt eredményt kapjuk-e. További tesztelési lehetőségek: unit tesztek írása az egyes modulokhoz vagy a kód közös átnézése (code review) egy, a vizsgált modul programozásában nem résztvevő csapattaggal. Szoftverünk minőségét a végső leadás előtt javítani kell a rendszerünkre lefuttatott kódelemzés során kapott metrikaértékek és szabálysértések figyelembevételével.
Az alábbi lehetőségek vannak a szoftver megfelelő minőségének biztosítására:
- Specifikáció és tervek átnézése (kötelező)
- Teszttervek végrehajtása (kötelező)
- Unit tesztek írása (választható)
- Kód átnézése (választható)

### 6.4. Átadás, eredmények elfogadása

A projekt eredményeit a megrendelő, Mihály Pál fogja elfogadni. A projektterven változásokat csak a megrendelő írásos engedélyével lehet tenni. A projekt eredményesnek bizonyul, ha specifikáció helyes és határidőn belül készül el. Az esetleges késések pontlevonást eredményeznek. 
Az elfogadás feltételeire és beadás formájára vonatkozó részletes leírás a következő honlapon olvasható: https://okt.inf.szte.hu/rf1/

### 6.5. Státuszjelentés

Minden mérföldkő leadásnál a projekten dolgozók jelentést tesznek a mérföldkőben végzett munkájukról a a megadott sablon alapján. A gyakorlatvezetővel folytatott csapatmegbeszéléseken a csapat áttekintik és felmérik az eredményeket és teendőket. Továbbá gazdálkodnak az erőforrásokkal és szükség esetén a megrendelővel egyeztetnek a projektterv módosításáról.

## 7. A munka tartalma

### 7.1. Tervezett szoftverfolyamat modell és architektúra

A szoftver fejlesztése során az agilis fejlesztési modellt alkalmazzuk, mivel a fejlesztés során nagy hangsúlyt fektetünk a folyamatos kommunikcióra. A fejlesztés során a szoftver specifikációi rugalmasan vátozhatnak, és ezzel a módszertannal tudunk a leggyorsabban alkalmazkodni az új elvárásokhoz.

A webalkalmazás az MVC (modell-view-controller) felépítést követi, a szerver és a kliens függetlenek, csupán API végpontok segítségével kommunikálnak.

### 7.2. Átadandók és határidők

A főbb átadandók és határidők a projekt időtartama alatt a következők:


| Szállítandó |                 Neve                                                        |   Határideje  |
|:-----------:|:---------------------------------------------------------------------------:|:-------------:|
|      D1     |      Projektterv és Gantt chart, prezentáció, egyéni jelentés               | `2024-10-09`  |
|    P1+D2    |      UML, adatbázis- és képernyőtervek, prezentáció, egyéni jelentés        | `2024-10-23`  |
|    P1+D3    |      Prototípus I. és tesztelési dokumentáció, egyéni jelentés              | `2024-11-13`  |
|    P2+D4    |      Prototípus II. és frissített tesztelési dokumentáció, egyéni jelentés  | `2024-12-04`  |


## 8. Feladatlista

A következőkben a tervezett feladatok részletes összefoglalása található.

### 8.1. Projektterv (1. mérföldkő)

Ennek a feladatnak az a célja, hogy megvalósításhoz szükséges lépéseket, az erőforrásigényeket, az ütemezést, a felelősöket és a feladatok sorrendjét meghatározzuk, majd vizualizáljuk Gantt diagram segítségével.

Részfeladatai a következők:

#### 8.1.1. Projektterv kitöltése

Felelős: Mindenki

Tartam:  5 nap

Erőforrásigény:  1 személynap/fő


#### 8.1.2. Bemutató elkészítése

Felelős: Sánta Krisztina

Tartam:  2 nap

Erőforrásigény:  0.5 személynap


### 8.2. UML és adatbázis- és képernyőtervek (2. mérföldkő)

Ennek a feladatnak az a célja, hogy a rendszerarchitektúrát, az adatbázist és webalkalmazás kinézetét megtervezzük.

Részfeladatai a következők:

#### 8.2.1. Use Case diagram

Felelős: `Teszt Elek`

Tartam:  `3 nap`

Erőforrásigény:  `1 személynap`

#### 8.2.2. Class diagram

Felelős: `Lev Elek`

Tartam:  `4 nap`

Erőforrásigény:  `2 személynap`

#### 8.2.3. Sequence diagram

Felelős: `Remek Elek`

Tartam:  `3 nap`

Erőforrásigény:  `2 személynap`

#### 8.2.4. Egyed-kapcsolat diagram adatbázishoz

Felelős: `Remek Elek`

Tartam:  `4 nap`

Erőforrásigény:  `2 személynap`

#### 8.2.5. Package diagram

Felelős: `Teszt Elek`

Tartam:  `3 nap`

Erőforrásigény:  `0.5 személynap`

#### 8.2.6. Képernyőtervek

Felelős: `Teszt Elek`

Tartam:  `3 nap`

Erőforrásigény:  `1 személynap`

#### 8.2.7. Bemutató elkészítése

Felelős: `Lev Elek`

Tartam:  `1 nap`

Erőforrásigény:  `0.5 személynap`


### 8.3. Prototípus I. (3. mérföldkő)

Ennek a feladatnak az a célja, hogy egy működő prototípust hozzunk létre, ahol a vállalt funkcionális követelmények nagy része már prezentálható állapotban van. 

Részfeladatai a következők:

#### `8.3.1. Felhasználók kezelése (admin, raktáros, sofőr) (CR)`

Felelős: `Teszt Elek`

Tartam:  `5 nap`

Erőforrásigény:  `2 személynap`

#### `8.3.2. Felhasználók kezelése (admin, raktáros, sofőr) (UD)`

Felelős: `Remek Elek`

Tartam:  `4 nap`

Erőforrásigény:  `2 személynap`

#### `8.3.3. Felhasználók kezeléséhez szükséges adatok létrehozása az adatbázisban`

Felelős: `Lev Elek`

Tartam:  `3 nap`

Erőforrásigény:  `1 személynap`

#### `8.3.4. Felhasználói munkamenet megvalósítása több jogosultsági szinttel`

Felelős: `Teszt Elek `

Tartam:  `10 nap`

Erőforrásigény:  `2 személynap`

#### `8.3.5. Raktárak kezelése (CRUD)`

Felelős: `Teszt Elek`

Tartam:  `3 nap`

Erőforrásigény:  `1 személynap`

#### `8.3.6. Raktárkezeléshez szükséges adatok létrehozása az adatbázisban`

Felelős: `Remek Elek`

Tartam:  `4 nap`

Erőforrásigény:  `2 személynap`

#### `8.3.7. Árukészletek kezelése (C)`

Felelős: `Remek Elek `

Tartam:  `4 nap`

Erőforrásigény:  `2 személynap`

#### `8.3.8. Árukészletek kezelése (R)`

Felelős: `Lev Elek`

Tartam:  `3 nap`

Erőforrásigény:  `1 személynap`

#### `8.3.9. Árukészletek kezelése (UD)`

Felelős: `Lev Elek`

Tartam:  `5 nap`

Erőforrásigény:  `2 személynap`

#### `8.3.10. Árukészletek kezeléséhez szükséges adatok létrehozása az adatbázisban`

Felelős: `Lev Elek`

Tartam:  `5 nap`

Erőforrásigény:  `2 személynap`

#### `8.3.11. Járművek kezelése (CRUD) és a szükséges adatok létrehozása az adatbázisban`

Felelős: `Lev Elek`

Tartam:  `3 nap`

Erőforrásigény:  `2 személynap`

#### `8.3.12. Fuvarok/szállítmányok kezelése (CR)`

Felelős: `Teszt Elek`

Tartam:  `4 nap`

Erőforrásigény:  `2 személynap`

#### `8.3.13. Fuvarok/szállítmányok kezelése (UD)`

Felelős: `Teszt Elek `

Tartam:  `5 nap`

Erőforrásigény:  `2 személynap`

#### `8.3.14. Fuvarok/szállítmányok szükséges adatok létrehozása az adatbázisban`

Felelős: `Remek Elek `

Tartam:  `3 nap`

Erőforrásigény:  `1 személynap`

#### `8.3.15. Email-es kiértesítés új szállítmány esetén az adott raktárosnak és sofőrnek`

Felelős: `Remek Elek`

Tartam:  `4 nap`

Erőforrásigény:  `2 személynap`

#### `8.3.16. Fuvar útvonalának megjelenítése térképen a kezdő és a végponttal együtt`

Felelős: `Remek Elek`

Tartam:  `5 nap`

Erőforrásigény:  `3 személynap`

#### `8.3.17. Biztonsági mentés automatikus létrehozása`

Felelős: `Lev Elek`

Tartam:  `3 nap`

Erőforrásigény:  `1 személynap`

#### 8.3.18. Tesztelési dokumentum az összes funkcióhoz (TP, TC)

Felelős: `Mindenki`

Tartam:  `7 nap`

Erőforrásigény:  `1 személynap/fő`


#### `8.3.19. A prototípus kitelepítése éles környezetbe` 

Felelős: `Teszt Elek`

Tartam:  `1 nap`

Erőforrásigény:  `1 személynap`


### 8.4. Prototípus II. (4. mérföldkő)

Ennek a feladatnak az a célja, hogy az előző mérföldkő hiányzó funkcióit pótoljuk, illetve a hibásan működő funkciókat és az esetlegesen felmerülő új funkciókat megvalósítsuk. Továbbá az alkalmazás alapos tesztelése is a mérföldkőben történik az előző mérföldkőben összeállított tesztesetek alapján.

Részfeladatai a következők:

#### 8.4.1. Javított minőségű prototípus új funkciókkal

Felelős: `Teszt Elek`

Tartam:  `5 nap`

Erőforrásigény:  `2.5 személynap`

#### 8.4.2. Javított minőségű prototípus javított funkciókkal

Felelős: `Lev Elek`

Tartam:  `5 nap`

Erőforrásigény:  `2 személynap`

#### 8.4.3. Javított minőségű prototípus a korábbi hiányzó funkciókkal

Felelős: `Remek Elek`

Tartam:  `5 nap`

Erőforrásigény:  `1.5 személynap`

#### `8.4.4. Felhasználói munkamenet tesztelése (TR)`

Felelős: `Teszt Elek`

Tartam:  `1 nap`

Erőforrásigény:  `1 személynap`

#### `8.4.5. Raktárak kezelésének tesztelése (TR)`

Felelős: `Remek Elek`

Tartam:  `1 nap`

Erőforrásigény:  `0.5 személynap`

#### `8.4.6. Árukészletek kezelésének tesztelése (TR)`

Felelős: `Teszt Elek`

Tartam:  `1 nap`

Erőforrásigény:  `1 személynap`

#### `8.4.7. Járművek kezelésének tesztelése (TR)`

Felelős: `Remek Elek`

Tartam:  `1 nap`

Erőforrásigény:  `0.5 személynap`

#### `8.4.8. Fuvarok kezelésének tesztelése (TR)`

Felelős: `Lev Elek`

Tartam:  `1 nap`

Erőforrásigény:  `0.5 személynap`

#### `8.4.9. Email-es funkciók tesztelése (TR)`

Felelős: `Remek Elek`

Tartam:  `1 nap`

Erőforrásigény:  `0.5 személynap`

#### `8.4.10. Térképes funkciók tesztelése (TR)`

Felelős: `Lev Elek`

Tartam:  `1 nap`

Erőforrásigény:  `0.5 személynap`

#### `8.4.11. Biztonsági mentés tesztelése (TR)`

Felelős: `Lev Elek`

Tartam:  `1 nap`

Erőforrásigény:  `0.5 személynap`

#### `8.4.12. A prototípus kitelepítésének frissítése`

Felelős: `Teszt Elek`

Tartam:  `1 nap`

Erőforrásigény:  `0.5 személynap`

## 9. Részletes időbeosztás

![image](./MINTA-gantt-diagram.png)

```
Ide kell berakni a Gantt diagramot, amely a 9. fejezetben található részfeladatokat tartalmazza felelős/tartam bontásban.
```

## 10. Projekt költségvetés

```
Az egyes leadások alkalmával rögzített erőforrásigényt, az elvállalt feladatok számát 
és az adott mérföldkőben végzett munkáért szerezhető pontszámot kell beírni minden emberre külön-külön.
Figyeljünk arra, hogy mivel mindenkinek minden mérföldkövön dolgoznia kell, ezért a 10.3-as táblázat
minden módosítható oszlopában legalább 1 pontnak szerepelni kell.
```

### 10.1. Részletes erőforrásigény (személynap)


| Név          |   M1  |   M2  |   M3 |   M4  | Összesen |
|--------------|-------|-------|------|-------|----------|
| `Teszt Elek` | `1.5` | `1.5` | `11` | `5`   | `19`     |
| `Remek Elek` | `1`   | `4`   | `13` | `3`   | `21`     |
| `Lev Elek`   | `1`   | `2.5` | `10` | `3.5` | `17`     |


### 10.2. Részletes feladatszámok

| Név          |   M1  |   M2  |   M3 |   M4 | Összesen |
|--------------|-------|-------|------|------|----------|
| `Teszt Elek` | `2`   | `2`   | `7`  | `4`  | `15`     |
| `Remek Elek` | `1`   | `2`   | `7`  | `4`  | `14`     |
| `Lev Elek`   | `1`   | `2`   | `7`  | `4`  | `14`     |

### 10.3. Részletes költségvetés

| Név                                 | M1      | M2       | M3       | M4       | Összesen  |
|-------------------------------------|---------|----------|----------|----------|-----------|
| Maximálisan megszerezhető pontszám  |  (7)    | (20)     | (35)     |  (28)    | 100% (70) |
| `Teszt Elek`                        | `7`     | `10`     | `28`     |  `25`    | 70        |
| `Remek Elek`                        | `4`     | `15`     | `35`     |  `16`    | 70        |
| `Lev Elek`                          | `4`     | `12`     | `30`     |  `24`    | 70        |

Szeged, `2021-10-25`.

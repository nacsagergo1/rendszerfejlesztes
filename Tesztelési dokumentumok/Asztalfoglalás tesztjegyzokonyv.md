Dokumentálja: Varga Csanád Sándor
A logikát kiépítette: Rózsás Péter
1. Teszteljárások (TP)
1.1 Asztalfoglalási funkció tesztelése

Azonosító: TP-01
Tesztesetek: TC-01, TC-02, TC-04, TC-05, TC-06, TC-08
Leírás: Az asztalfoglalás funkció tesztelése különböző bemenetekkel és helyzetekkel.

    lépés: Töltsük ki az input mezőt a megfelelő adatokkal.
    lépés: Kattintsunk a "Foglalás keresés" gombra.
    lépés: A naptárban válasszunk egy érvényes dátumot.
    lépés: Az időpontok listájából válasszunk egyet, és próbáljuk lefoglalni az adott időpontot.

2. Tesztesetek (TC)
2.1 TC-01

TP: TP-01
Leírás: Normális foglalás végrehajtása.
Bemenet:

    Foglalás: 4 fő
    Dátum: Érvényes dátum a következő héten.
    Időpont: 12:00

Művelet:

    Írjuk be az adatokat, kattintsunk a "Foglalás keresés" gombra.
    Válasszunk egy szabad időpontot a naptárból, és erősítsük meg a foglalást.

Elvárt kimenet: A foglalás sikeres, visszaigazolás érkezik.
2.2 TC-02

TP: TP-01
Leírás: Nem adunk meg vendégszámot.
Bemenet:

    Foglalás: Üres mező.

Művelet:

    Hagyd üresen a mezőt, kattints a "Foglalás keresés" gombra.

Elvárt kimenet: Hibaüzenet jelenik meg, hogy a vendégszám megadása kötelező.
2.3 TC-04

TP: TP-01
Leírás: Túl sok vendéget próbálunk foglalni.
Bemenet:

    Foglalás: 57 fő

Művelet:

    Írjuk be az adatokat, kattintsunk a "Foglalás keresés" gombra.

Elvárt kimenet: Nem enged lefoglalni.
2.4 TC-05

TP: TP-01
Leírás: Már betelt időpont választása.
Bemenet:

    Foglalás: 56 fő
    Dátum: 11.29
    Időpont: Betelt időpont (2:30 PM).

Művelet:

    Írjuk be az adatokat, kattintsunk a "Foglalás keresés" gombra.
    Válasszunk egy olyan időpontot, ahol nincs több szabad hely.

Elvárt kimenet: Nem enged lefoglalni.
2.5 TC-06

TP: TP-01
Leírás: Olyan dátum kiválasztása, ami a mai nap előtt van.
Bemenet:

    Foglalás: 3 fő
    Dátum: Múltbéli dátum.

Művelet:

    Írjuk be az adatokat, kattintsunk a "Foglalás keresés" gombra.

Elvárt kimenet: Nem enged lefoglalni.
2.6 TC-08

TP: TP-01
Leírás: Érvényes, de minimális létszámot nem elérő foglalás.
Bemenet:

    Foglalás: 0 fő

Művelet:

    Írjuk be az adatokat, kattintsunk a "Foglalás keresés" gombra.

Elvárt kimenet: Hibaüzenet jelenik meg, hogy adjunk meg érvényes létszámot.
3. Tesztriportok (TR)
3.1 Foglalás funkció eredmények

    TR-01 (TC-01): A foglalás sikeresen megtörtént.
    TR-02 (TC-02): A hibaüzenet megfelelően megjelent.
    TR-03 (TC-04): A túl sok vendégre vonatkozó hibaüzenet megfelelően megjelent.
    TR-04 (TC-05): A betelt időpontra vonatkozó hibaüzenet megfelelően megjelent.
    TR-05 (TC-06): A múltbéli dátumra vonatkozó hibaüzenet megfelelően megjelent.
    TR-06 (TC-08): A minimális létszámot nem elérő foglalásra vonatkozó hibaüzenet megfelelően megjelent.
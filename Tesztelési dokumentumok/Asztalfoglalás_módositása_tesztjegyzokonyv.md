Tesztjegyzőkönyv- Regisztrálás/Bejelentkezés
	Az alábbi dokumentum az étel projekthez tartozo asztal foglalás módosítás funckió háttérlogikájához készült
	Dokumentálja: Varga Csanád Sándor
	a logikát kiépítette: Rózsás Péter
	
	1.Teszteljárások (TP)
		1.1 asztalfoglalás módosítása
			azonosító: TP-01
			Tesztesetek: TC-1, TC-2, TC-3, TC-4, TC-5, TC-6, TC-7, TC-8, TC-9, TC-10,TC-11,TC-12,TC-13,TC-14,TC-15,TC-16,TC-17,TC-18,TC-19,TC-20,TC-21,TC-22,TC-23,TC-24,TC-25
			leírás: beállítunk egy valid foglalást, és módosítjuk.
				0. Csináljunk egy foglalást egy valid időpontra, vagy az adatbázisban módosítsunk eggyet egy valid időpontra
					ha szükséges hozzunk létre egy másik foglalást hogy a beteltséget lehessen vizsgálni
				1. módosítsuk a foglalást egy adott módon
				
	2. Tesztesetek(TC)
		2.1 asztalfoglalás módosítása
			2.1 TC-1
				TP: TP-01
				leírás: dátum módosítása, pár órával késöbbre
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 14 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet: a módosítás sikeresen megtörténik
			
			2.1 TC-2
				TP: TP-01
				leírás: dátum módosítása, pár nappal késöbbre késöbbre
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.12.02 14 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet: a módosítás sikeresen megtörténik
				
			2.1 TC-3
				TP: TP-01
				leírás: dátum módosítása, múltbeli időpontra
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.10 14 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet: a módosítást nem engedi végrehajtani
			
			2.1 TC-4
				TP: TP-01
				leírás: dátum módosítása, dátum megadása nélkül
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont mm/dd/yyyy   (a clear gombal)
					foglalás mérete: 4
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani

			2.1 TC-5
				TP: TP-01
				leírás: dátum módosítása, dátum a távoli jövőbe
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 3024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani
			
			2.1 TC-6
				TP: TP-01
				leírás: dátum módosítása, óra negatív számmal
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 -1 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani
			
			2.1 TC-7
				TP: TP-01
				leírás: dátum módosítása, óra 24 órára 
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 24 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani
			
			2.1 TC-8
				TP: TP-01
				leírás: dátum módosítása, óra >24 órára 
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 1645 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani
			
			2.1 TC-9
				TP: TP-01
				leírás: dátum módosítása, negatív perc 
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 9 óra -1 perc
					foglalás mérete: 4
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani
			
			2.1 TC-10
				TP: TP-01
				leírás: dátum módosítása, perc 60 percre 
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 9 óra 60 perc
					foglalás mérete: 4
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani
			
			2.1 TC-11
				TP: TP-01
				leírás: dátum módosítása, perc >60 percre
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 9 óra 1645 perc
					foglalás mérete: 4
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani
			
			2.1 TC-12
				TP: TP-01
				leírás: dátum módosítása, nem egész számok
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 10.30 óra 10.30 perc
					foglalás mérete: 4
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani
			
			2.1 TC-13
				TP: TP-01
				leírás: dátum módosítása, betűkre
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 'tíz' óra 'harminc' perc
					foglalás mérete: 4
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani
			
			2.1 TC-14
				TP: TP-01
				leírás: dátum módosítása, egy olyan időpontra, amikor már nincs szabad hely 
				bemenet1:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				bemenet2:
					időpont 2024.11.29 16 óra 0 perc
					foglalás mérete: 56
					üzleti: nem
					
				kimenet1:
					időpont 2024.11.29 16 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani
			
			2.1 TC-15
				TP: TP-01
				leírás: várható létszám módosítása, <=0-ra
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 0
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani	
			
			2.1 TC-16
				TP: TP-01
				leírás: várható létszám módosítása, >56
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 57
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani	
			
			2.1 TC-17
				TP: TP-01
				leírás: várható létszám módosítása, nem egész számra
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 2.2
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani	
				
			2.1 TC-18
				TP: TP-01
				leírás: létszám módosítása, úgy hogy nincs elég hely 
				bemenet1:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				bemenet2:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 52
					üzleti: nem
					
				kimenet1:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 5
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani	
				
			2.1 TC-19
				TP: TP-01
				leírás: létszám módosítása, úgy hogy nincs elég hely egy másik dátumon
				bemenet1:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				bemenet2:
					időpont 2024.12.03 9 óra 0 perc
					foglalás mérete: 52
					üzleti: nem
					
				kimenet1:
					időpont 2024.11.03 9 óra 0 perc
					foglalás mérete: 5
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani	
			
			2.1 TC-20
				TP: TP-01
				leírás: várható létszám módosítása, betűkre
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: "három :)"
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani
			
			2.1 TC-21
				TP: TP-01
				leírás: várható létszám módosítása, validan
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 2
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást sikeresen végrehajtja
				
			2.1 TC-22
				TP: TP-01
				leírás: üzleti foglalás módosítása 
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 2.2
					üzleti: igen (1)
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást sikeresen végrehajtja
				
			2.1 TC-23
				TP: TP-01
				leírás: üzleti foglalás módosítása egy nem {0,1} számmal
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: 17
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani
			
			2.1 TC-24
				TP: TP-01
				leírás: minden üres
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont mm/dd/yyyy '' óra '' perc
					foglalás mérete: ''
					üzleti: ''
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani
			
			2.1 TC-25
				TP: TP-01
				leírás: minden változik
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.12.03 11 óra 30 perc
					foglalás mérete: 6
					üzleti: igen
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani
			
			2.1 TC-26
				TP: TP-01
				leírás: dátum módosítása zárórára
				bemenet:
					időpont 2024.11.29 9 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
					
				kimenet:
					időpont 2024.12.03 1 óra 0 perc
					foglalás mérete: 4
					üzleti: nem
				művelet:
					állítsuk át az adatokat, és nyomjunk a mentés gombra
				elvárt kimenet:a módosítást nem engedi végrehajtani
			
	3. Tesztriportok(TR)
					3.1 asztalfoglalás módosítása
						3.1 TR-1(TC-1)
							1. a módosítás sikeresen megtörénik
						3.1 TR-1(TC-2)
							1. a módosítás sikeresen megtörénik
						3.1 TR-1(TC-3)
							1. a módosítást sikeresen nem engedi
						3.1 TR-1(TC-4)
							1. a módosítást sikeresen nem engedi
						3.1 TR-1(TC-5)
							1. a módosítást engedte, pedig nem szabadott volna
						3.1 TR-1(TC-6)
							1. a módosítást engedte, pedig nem szabadott volna
						3.1 TR-1(TC-7)
							1. a módosítást engedte, pedig nem szabadott volna
						3.1 TR-1(TC-8)
							1. a módosítást engedte, pedig nem szabadott volna
						3.1 TR-1(TC-9)
							1. a módosítást engedte, pedig nem szabadott volna
						3.1 TR-1(TC-10)
							1. a módosítást engedte, pedig nem szabadott volna
						3.1 TR-1(TC-11)
							1. a módosítást engedte, pedig nem szabadott volna
						3.1 TR-1(TC-12)
							1. a módosítást engedte, pedig nem szabadott volna
						3.1 TR-1(TC-13)
							1. a módosítást sikeresen nem engedi
						3.1 TR-1(TC-14)
							1. a módosítást engedte, pedig nem szabadott volna
						3.1 TR-1(TC-15)
							1. a módosítást engedte, pedig nem szabadott volna
						3.1 TR-1(TC-16)
							1. a módosítást azt mondja, hogy végrehajtotta, de az adatbázisban sikeresen nem változik meg
						3.1 TR-1(TC-17)
							1. a módosítás végrehajtódik, és egy egész számra kerekítet verzió kerül be az adatbázisba
						3.1 TR-1(TC-18)
							1. a módosítást engedte, pedig nem szabadott volna
						3.1 TR-1(TC-19)
							1. a módosítást engedte, pedig nem szabadott volna
						3.1 TR-1(TC-20)
							1. a módosítást sikeresen nem engedi						
						3.1 TR-1(TC-21)
							1. a módosítást sikeresen végrehajtja		
						3.1 TR-1(TC-22)
							1. a módosítás nem megy végbe, pedig azt írja megtörtént
						3.1 TR-1(TC-23)
							1. A módosítás nem megy végbe, de ez nem megbízható miután az alap funkció nem működik várt módon.
						3.1 TR-1(TC-24)
							1. A módosításokat, helyesen nem engedi
						3.1 TR-1(TC-25)
							1. az "üzlet" oszlopon kivül minden megváltozik ahogy kell nekik.
						3.1 TR-1(TC-26)
							1. a módosítást engedte, pedig nem szabadott volna
				
				
				
				
				
				
				
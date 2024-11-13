Tesztjegyzőkönyv- Regisztrálás/Bejelentkezés
	Az alábbi dokumentum az étel projekthez tartozo regisztrálás illetve bejelntkezés funckió háttérlogikájához készült
	Dokumentálja: Varga Csanád Sándor
	a logikát kiépítette: Sánta Krisztina Csilla
	
	1.Teszteljárások (TP)
		1.1 új fiok  és bejelntkezés vele
			azonosító: TP-01
			Tesztesetek: TC-1, TC-2, TC-3, TC-4, TC-5, TC-6, TC-7, TC-8, TC-9
			leírás: regisztrálunk egy fiokot, és megprobálunk bejelentkezni vele.
				0. lépés töltsük ki a regisztrációs mezőket az adott adatokkal
				1. lépés probáljunk regisztrálni a gomb segítségével
				3. lépés írjuk be a bejelntkezésnél is ad adatokat és nyomjuk meg a bejelntkezés gombot
				
	2. Tesztesetek(TC)
		2.1 új fiok regisztrálása, és beléptetése
			2.1 TC-1
				TP: TP-01
				leírás: normális regisztrálás és belépés
				bemenet:
					Regisztrálás:
					felhasználónév: NEV
					Email: pelda@gmail.com
					Jelszo: abc123
					Jelszo ujra: abc123
					
					
					Belépés:
					Email: pelda@gmail.com
					Jelszo: abc123					
				művelet:
					írjuk be az adatokat, regisztráljunk; majd a belépésnél is írjuk be az adatokat, és lépjünk be
				elvárt kimenet: minden gondmentesen történik, a fiok létrejön, és be tudunk vele lépni
			
			2.1 TC-2
				TP: TP-01
				leírás: semmit nem irunk be
				bemenet:
					Regisztrálás:
					felhasználónév: 
					Email: 
					Jelszo: 
					Jelszo ujra: 
					
					
					Belépés:
					Email: 
					Jelszo: 					
				művelet:
					írjuk be az adatokat, regisztráljunk; majd a belépésnél is írjuk be az adatokat, és lépjünk be
				elvárt kimenet: nem jön létre fiok, és nem lehet bejelentkezni egy fiokba
			
			2.1 TC-3
				TP: TP-01
				leírás: email, tesztelés, nincs kukac
				bemenet:
					Regisztrálás:
					felhasználónév: NEV
					Email: peldagmail.com
					Jelszo: abc123
					Jelszo ujra: abc123
					
					
					Belépés:
					Email: peldagmail.com
					Jelszo: abc123					
				művelet:
					írjuk be az adatokat, regisztráljunk; majd a belépésnél is írjuk be az adatokat, és lépjünk be
				elvárt kimenet: nem lehet regisztrálni, rossz email megadása miatt.
			
			2.1 TC-4
				TP: TP-01
				leírás: email, tesztelés, nincs .
				bemenet:
					Regisztrálás:
					felhasználónév: NEV
					Email: pelda@gmailcom
					Jelszo: abc123
					Jelszo ujra: abc123
					
					
					Belépés:
					Email: peldagmail.com
					Jelszo: abc123					
				művelet:
					írjuk be az adatokat, regisztráljunk; majd a belépésnél is írjuk be az adatokat, és lépjünk be
				elvárt kimenet: nem lehet regisztrálni, rossz email megadása miatt.
			
			2.1 TC-5
				TP: TP-01
				leírás: email, tesztelés, nincs a @ és a . között semmi
				bemenet:
					Regisztrálás:
					felhasználónév: NEV
					Email: pelda@.com
					Jelszo: abc123
					Jelszo ujra: abc123
					
					
					Belépés:
					Email: peldagmail.com
					Jelszo: abc123					
				művelet:
					írjuk be az adatokat, regisztráljunk; majd a belépésnél is írjuk be az adatokat, és lépjünk be
				elvárt kimenet: nem lehet regisztrálni, rossz email megadása miatt.
			
			2.1 TC-6
				TP: TP-01
				leírás: email, tesztelés, nincs a . után semmi
				bemenet:
					Regisztrálás:
					felhasználónév: NEV
					Email: pelda@gmail.
					Jelszo: abc123
					Jelszo ujra: abc123
					
					
					Belépés:
					Email: peldagmail.com
					Jelszo: abc123					
				művelet:
					írjuk be az adatokat, regisztráljunk; majd a belépésnél is írjuk be az adatokat, és lépjünk be
				elvárt kimenet: nem lehet regisztrálni, rossz email megadása miatt.
			
			2.1 TC-7
				TP: TP-01
				leírás: email, tesztelés, nincs kukac elött semmi
				bemenet:
					Regisztrálás:
					felhasználónév: NEV
					Email: @gmail.com
					Jelszo: abc123
					Jelszo ujra: abc123
					
					
					Belépés:
					Email: peldagmail.com
					Jelszo: abc123					
				művelet:
					írjuk be az adatokat, regisztráljunk; majd a belépésnél is írjuk be az adatokat, és lépjünk be
				elvárt kimenet: nem lehet regisztrálni, rossz email megadása miatt.
				
			2.1 TC-8
				TP: TP-01
				leírás: jelszo tesztelés a két jelszó nem eggyezik
				bemenet:
					Regisztrálás:
					felhasználónév: NEV
					Email: pelda@gmail.com
					Jelszo: abc123
					Jelszo ujra: abc12345
					
					
					Belépés:
					Email: peldagmail.com
					Jelszo: abc123					
				művelet:
					írjuk be az adatokat, regisztráljunk; majd a belépésnél is írjuk be az adatokat, és lépjünk be
				elvárt kimenet: nem lehet regisztrálni, rossz jelszo miatt
			
			2.1 TC-9
				TP: TP-01
				leírás: belépés tesztelése, a jelszo nem az email-hez tartozik
				bemenet:
					Regisztrálás:
					felhasználónév: NEV
					Email: pelda@gmail.com
					Jelszo: abc123
					Jelszo ujra: abc123
					
					
					Belépés:
					Email: peldagmail.com
					Jelszo: adminjelszo999					
				művelet:
					írjuk be az adatokat, regisztráljunk; majd a belépésnél is írjuk be az adatokat, és lépjünk be
				elvárt kimenet: regisztrálni lehet, de belépni nem
				
3. Tesztriportok(TR)
					3.1 regisztrálás és belépésnél
						3.1 TR-1(TC-1)
							1. regisztrálás sikeres
							2. bejelentkezés sikeres
						3.1 TR-1(TC-2)
							1. várt módon nem lehet regisztrálni 
							2. várt módon nem lehet bejelntkezni 
						3.1 TR-1(TC-3)
							1. várt módon nem lehet regisztrálni 
						3.1 TR-1(TC-4)
							1. nem várt módon a regisztrálás sikeres
						3.1 TR-1(TC-5)
							1. várt módon nem lehet regisztrálni 
						3.1 TR-1(TC-6)
							1. várt módon nem lehet regisztrálni 
						3.1 TR-1(TC-7)
							1. várt módon nem lehet regisztrálni 
						3.1 TR-1(TC-8)
							1. várt módon nem lehet regisztrálni 
						3.1 TR-1(TC-9)
							1. regisztrálás sikeres
							2. várt módon nem lehet bejelentkezni
					
						
				
				
				
				
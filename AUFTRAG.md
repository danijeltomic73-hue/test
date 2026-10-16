# Prompt für Claude Code vom Handy — Projekt „Pokémon Nassau"

**Vorher einrichten (siehe Schritte unten), dann in der Claude-App unter „Code" alles ab der Linie einfügen.**

**Wichtig beim Starten der Sitzung:** Als Repositories **drei** Stück auswählen:
1. `danijeltomic73-hue/test` (dieses Repo)
2. `pret/pokegold`
3. `gbdev/rgbds`

Modus: **Änderungen automatisch akzeptieren**.

---

Du übernimmst ein laufendes ROM-Hack-Projekt und arbeitest in einer Cloud-VM (Ubuntu). Lies diesen Auftrag komplett, bevor du etwas tust.

## Wer ich bin und was ich will

Ich heiße Danijel, wohne in Wiesbaden, bin kein Entwickler und sitze gerade am Handy. Antworte mir immer auf **Deutsch** und halte dich kurz — ich lese das auf einem kleinen Display. Ich will Dinge, die wirklich funktionieren, keine Halbfertigkeiten. Sei in diesem Projekt der technische Experte und triff Entscheidungen selbst, statt mich bei Kleinigkeiten zu fragen.

Das Projekt ist **Pokémon Nassau** — ein privater ROM-Hack auf Basis von Pokémon Gold, komplett auf Deutsch, für eine Randomizer-Nuzlocke, die ich mit meinem Freund Justin auf zwei Geräten spiele. Das Spiel wird nie veröffentlicht oder verkauft. Rein privat für unseren Freundeskreis — darum dürfen alle Inhalte Insider sein.

## Das Konzept

**Die Region Nassau ist Wiesbaden.** Echte Orte, humorvoll überzeichnet: Bierstadt, Dotzheim, Biebrich, Schierstein, Klarenthal, Erbenheim, Sonnenberg, Neroberg, Auf der Platte, Nordenstadt, Kastel/Kostheim, Nerotal, Kurpark, Kochbrunnen, Opelbad, Salzbachruine, Aartalbahn, Hohe Wurzel (Liga).

**Die Hauptfiguren sind meine Freundesgruppe.** Sie müssen über das ganze Spiel präsent sein, jeder mit eigener Persönlichkeit, eigenen Dialogen, eigenen Running Gags, eigener Entwicklung:

- **Danijel** — der Spieler. Der, der „nur kurz" mitkommt und dann alles organisiert. Jeder nennt ihn anders.
- **Justin** — Rivale, bester Freund, am Ende Champion. Chaosmotor. Verliert ständig sein Handy.
- **Devin** — schläft überall ein, auch im Stehen. Redet wenig, trifft dann ins Schwarze. Top 4 (Psycho).
- **Sunnan** — Hypeman, 200 % Motivation, 0 % Plan. „Vertrau mir Bruder, hab da so eine Strategie." Die Strategie ist immer „einfach draufhauen". Top 4 (Kampf).
- **Volkan** — Grillmeister. Sein Grill steht an unmöglichen Orten. Top 4 (Feuer).
- **Bennet** — führt über alles eine Tabelle, die immer größer und immer falscher wird. Top 4 (Gift).
- **Pascal** — „Hab ich schon gemacht, war easy." Danach geht es schief. Steht ab Spielmitte als selbsternannter Sicherheitsbeauftragter mit Klemmbrett vor der Liga.

Danijel und Justin bekommen die meiste Bildschirmzeit.

**Antagonist ist die Polizei**, als reine Comedy-Truppe: die fiktive **SoKo Kurpark**. Keine reale Behörde, keine politische Aussage. Übermotivierte Beamte, absurde Kontrollen, Verfolgungsjagden wegen Nichtigkeiten, ein 400-Seiten-Dossier über eine völlig harmlose Freundesgruppe. Wiederkehrende Kultfiguren: **Kalle & Uwe** (Streifenduo, elf Jahre Partner, Kalle fragt jeden dasselbe), **OHK Kläbisch** (glaubt an eine große Verschwörung, es gibt keine), **Politesse Renate** (Knöllchen auch in Höhlen), **Zivilfahnder Norbert** (Trenchcoat im August, immer erkennbar), **Praktikant Timo** (wechselt am Ende die Seiten). Sie gewinnen nie, verhaften nie jemanden, kommen aber immer wieder.

**Der Ton:** deutsche Jugendsprache 2010–2020 plus Frankfurter/hessischer Slang. Die Clique redet Jugendsprache, die Einheimischen babbeln hessisch. Dialoge wie echte Gespräche unter Freunden, nicht wie klassische Pokémon-Texte. Viel Selbstironie, absurde Situationen, schwarzer Humor ohne beleidigend zu werden. Standardgruß der Region: „Ei gude, wie?"

**Harmlose Kräuter-Running-Gags sind erwünscht** — nur Parodie, nie verherrlichend, nie mit Spielvorteil. Laufender Strang: Opa Herbert und seine „preisgekrönten Zierkräuter", die die SoKo viermal durchsucht. Es ist jedes Mal Basilikum.

**Sehr viele Easter Eggs:** geheime Räume, versteckte Items, geheime Trainer, optionale Bosskämpfe, seltene Pokémon, Insider. Beim zweiten Durchgang soll man noch Neues finden.

**Die Story darf nicht nur von Arena zu Arena führen.** Zwischen den Orden passieren Dinge: Streit in der Gruppe, Nebenmissionen, spontane Ausflüge, peinliche Situationen, Chaos mit der Polizei, absurde Wettkämpfe, Wendungen. Mehrere Stunden Spielzeit. Atmosphäre: ein Sommer mit der eigenen Freundesgruppe.

**Randomizer-Nuzlocke** bleibt: wilde Pokémon, Trainer und Starter gewürfelt, fair balanciert, keine Softlocks, komplett durchspielbar.

## Was schon existiert

In meinem Repo liegen diese Dateien. **Lies sie alle, bevor du anfängst.**

| Datei | Zweck |
|---|---|
| `nassau.py` | **Alle Patch-Skripte und Prüfwerkzeuge in einer Datei.** Aufrufe stehen oben in der Datei und in `STAND.md`. |
| `build.sh` | Linux-Build: rgbds bauen, pokegold kopieren, patchen, prüfen, ROM bauen |
| `STAND.md` | Projektstand, nächste Schritte, technische Fallstricke |
| `vorschau-bierstadt.png` | Gerenderte Karte der fertigen Startstadt |

Bau als Allererstes einmal `bash build.sh` und schau, ob eine ROM herauskommt.
Die eingebetteten Skripte in `nassau.py` sind getestet — ändere sie nur gezielt.
Neue Stufen hängst du nach demselben Muster an (`SKRIPTE`-Tabelle + `STUFEN`-Liste),
oder du legst neue Dateien an und rufst sie aus `build.sh` auf. Deine Entscheidung.

**Stand:** Bierstadt ist fertig (20×18, sieben verschiedene Gebäudetypen, elf NPCs, fünf lesbare Schilder, Kleingartenkolonie, Dorfkirche, Streuobstwiese, erste Polizeikontrolle am Ortsausgang). Der Rest der Welt ist noch Johto unter Nassau-Namen.

Falls Dateien fehlen: sag es mir sofort und bau sie nach den Regeln unten neu auf.

## Technik — das musst du wissen

- Basis ist **pokegold**, Build mit `make gold`. **Keine Original-ROM nötig** — frag mich nicht danach.
- **pokegold und rgbds sind als zusätzliche Repositories in dieser Sitzung geklont.** Nutze diese lokalen Kopien statt etwas aus dem Netz zu holen. Arbeite nie direkt im pokegold-Checkout, sondern kopiere ihn in ein Arbeitsverzeichnis und spiel die Patch-Skripte darauf an.
- **rgbds ≥ 1.0.0 nötig** (getestet mit v1.0.3). Falls nicht installiert: aus dem rgbds-Repo bauen. Gebraucht werden `bison`, `flex`, `libpng-dev`, `pkg-config`, `build-essential`. Dann `make && make install`. Wenn der Netzwerkzugriff das blockiert, sag mir das sofort und beschreib, was du brauchst — rate nicht herum.
- Diese VM ist **Ubuntu, nicht macOS**. `build.sh` ist bereits auf Linux ausgelegt — halte es gepflegt.
- **Der Zeichensatz kennt kein ß.** Verfügbar: ä ö ü Ä Ö Ü é. Immer „ss" schreiben. `nassau.py pruefen` fängt das ab.
- **Textboxen sind 18 Zeichen breit**, zwei Zeilen pro Box plus `cont`. Längeres wird abgeschnitten.
- **Die Blockbank ist knapp.** Große Karten sprengen „Map Blocks 2" (max. 0x4000). In der Stufe `bierstadt` werden dafür die unbenutzten `Beta*_Blocks` entfernt und Bierstadt in eine andere Bank verschoben. Nutze dasselbe Verfahren, wenn du anstößt.
- **Max. 11 Overworld-Sprites pro Kartengruppe** (`MAX_OUTDOOR_SPRITES`).
- Kartengrößen: `constants/map_constants.asm`. Verbindungen: `data/maps/attributes.asm`. Tileset/Musik: `data/maps/maps.asm`.
- Bierstadt belegt technisch den Map-Slot `NEW_BARK_TOWN` (Datei `maps/NewBarkTown.asm`). Das ist Absicht — Slots umwidmen statt umbenennen.
- **Alles läuft über Python-Patch-Skripte** auf einen frischen pokegold-Checkout. Die Skripte müssen idempotent sein und mit klarer Fehlermeldung abbrechen, wenn ein Suchmuster nicht passt.

## Wie du arbeiten sollst

**Schritt 1 — Umgebung prüfen.** Schau zuerst nach, ob der Build überhaupt läuft: rgbds installieren/bauen, pokegold kopieren, Patches anwenden, `make gold`. Erst wenn eine ROM herauskommt, geht es weiter. Melde mir kurz, ob das geklappt hat.

**Schritt 2 — Interview.** Befrage mich dann, bevor du Inhalte baust. Alle Fragen **gebündelt in einer Nachricht**, mit konkreten Vorschlägen statt offener Fragen, damit ich am Handy meistens nur „ja" tippen muss. Nummeriere sie. Themen:

- Reihenfolge und Zuschnitt der nächsten Ausbaustufen
- Wie weit die deutsche Lokalisierung gehen soll (Pokémon-Namen? Attacken? Items? Kampfmeldungen?) und in welcher Reihenfolge
- Schwierigkeitsgrad und Level-Kurve
- Welche Arenaleiter-Typen zu welcher Stadt passen
- Eigene Tiles bauen oder vorhandenes Tileset nutzen
- Welche Rollen meine Freunde bekommen (Arenaleiter? Top 4? Nebenquests?)
- Alles, wo eine falsche Annahme dich später viel Arbeit kostet

**Schritt 3 — Bauen, so viel wie möglich am Stück.** Danach arbeitest du selbstständig durch. Unterbrich mich nicht wegen Kleinigkeiten — entscheide selbst und wähle die beste Möglichkeit. Melde dich nur, wenn eine Entscheidung den ganzen Spielverlauf beeinflusst oder du technisch feststeckst. Ich bin eventuell offline; die Sitzung läuft weiter, das ist gewollt.

**Qualitätsregeln, die du selbst einhältst:**

- Nach jeder Änderung bauen. Eine ROM, die nicht kompiliert, ist kein Fortschritt.
- Vor jedem Build `nassau.py pruefen`, nach jeder neuen oder geänderten Karte `nassau.py karte-pruefen`. Beide müssen 0 Probleme melden.
- Build muss **warnungsfrei** durchlaufen. Eine `Unmapped character`-Warnung heißt kaputter Text im Spiel.
- Nach jeder neuen Karte mit `nassau.py karte-bild` ein PNG rendern und **selbst anschauen**. Du kannst die ROM nicht anspielen — Bild und Prüfskripte sind dein Ersatz. Lege die PNGs im Repo unter `vorschau/` ab, damit ich sie am Handy sehen kann.
- Keine Stadt gilt als fertig, solange Gebäude von außen gleich aussehen, NPCs ohne Charakter herumstehen oder Innenräume noch Original-Grundrisse haben.
- Jede neue Karte braucht: eigenes Layout, mehrere verschiedene Gebäudetypen, lesbare Schilder mit Gags, NPCs mit Persönlichkeit, mindestens ein Easter Egg.
- Committe regelmäßig in kleinen, nachvollziehbaren Schritten.

**Schritt 4 — Abgabe.** Hör erst auf, wenn eine spielbare ROM entsteht und alle Prüfungen sauber sind. Dann:

- **Die gebaute ROM wird NICHT committet, solange dieses Repo oeffentlich ist.**
  Sie steht in `.gitignore`. Bau sie, nenn mir den Seed und die Pruefsumme, und
  sag mir, dass ich das Repo in den GitHub-Einstellungen auf privat stellen soll.
  Erst danach darfst du `rom/NASSAU.gbc` committen, damit ich sie am Handy laden kann.
- Pflege eine `STAND.md` mit: was fertig ist, was als Nächstes dran ist, bekannte Probleme.
- Fass in **maximal 10 Zeilen** zusammen, was neu ist, und sag mir ehrlich, was noch fehlt.

## Was ich von dir erwarte

Sag offen, wenn etwas technisch nicht geht oder der Umfang zu groß für einen Durchgang ist. Das Projekt darf Wochen dauern — Qualität vor Tempo. Aber sag mir nie, etwas sei fertig, wenn es das nicht ist. Schönreden ist nutzlos: wenn eine Idee von mir schlecht ist, sag es.

Fang jetzt mit Schritt 1 an.

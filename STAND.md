# Pokémon Nassau — Projektstand

Privater ROM-Hack auf pokegold-Basis. Region Nassau = Wiesbaden.
Randomizer-Nuzlocke für zwei Spieler (Danijel und Justin).

## Bauen

```bash
bash build.sh            # Standard-Seed 20260802
bash build.sh 1337       # anderer Seed
```

Ergebnis: `rom/NASSAU.gbc`. Gleicher Seed = identische ROM auf beiden Geräten.
**Einmal bauen, Datei weitergeben** — nicht zweimal bauen.

## Werkzeuge

```bash
python3 nassau.py patch <ordner> [seed]       # alle Inhalte einspielen
python3 nassau.py pruefen <ordner>            # Zeichensatz prüfen
python3 nassau.py karte-pruefen <ordner> NewBarkTown 20 18 johto
python3 nassau.py karte-bild <ordner> <blk> <breite> johto out.png
python3 nassau.py stufe <name> <ordner>       # einzelne Stufe
```

## Fertig

- **Bierstadt** (Startstadt, 20×18): eigenes Layout, sieben verschiedene
  Gebäudetypen, Kleingartenkolonie „Grüne Hoffnung", Dorfkirche,
  Alte Feuerwehr, Kiosk, Streuobstwiese, elf NPCs mit Running Gags,
  fünf lesbare Schilder, erste Polizeikontrolle am Ortsausgang.
  Prüfung: 909 begehbare Kacheln, 0 Probleme.
- **Vier Startgebäude** mit deutschen Dialogen (32 Textblöcke).
- **Ortsnamen** der ganzen Region auf Nassau umgestellt (29 Landmarken).
- **Menüs** auf Deutsch (Start- und Kampfmenü).
- **Randomizer** für Gen 2: Wild nach Tageszeit, Angeln, Trainer, Starter.
  BST-Bänder, typtreue Arenaleiter, Legendäre außen vor.
- **Nuzlocke-Komfort**: 594 Sonderbonbons im PC ab Start, 999.999 Startgeld.

## Als Nächstes

1. Innenräume von Bierstadt (noch Original-Grundrisse)
2. Lokalisierung Stufe 2: Item- und Attackennamen
3. Erste Route westlich von Bierstadt
4. Dotzheim mit Arena 1

## Technische Fallstricke

- **Kein ß im Zeichensatz.** Nur ä ö ü Ä Ö Ü é. Immer „ss" schreiben.
- **Textboxen 18 Zeichen breit**, zwei Zeilen plus `cont`.
- **Blockbank knapp** — große Karten sprengen „Map Blocks 2" (max. 0x4000).
  Lösung steckt in `nassau_bierstadt.py`: unbenutzte `Beta*_Blocks` raus,
  Karte in andere Bank verschieben.
- **Max. 11 Overworld-Sprites pro Kartengruppe.**
- Bierstadt belegt technisch den Slot `NEW_BARK_TOWN`. Absicht.
- Build muss **warnungsfrei** sein. `Unmapped character` = kaputter Text.
- Keine Original-ROM nötig — pokegold baut aus Quellcode.

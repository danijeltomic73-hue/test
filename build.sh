#!/usr/bin/env bash
# POKEMON NASSAU - Build fuer Linux (Claude-Code-Cloud-VM).
# Aufruf:  bash build.sh [seed]
# Ergebnis: rom/NASSAU.gbc
set -euo pipefail
cd "$(dirname "$0")"

SEED="${1:-20260802}"
echo "=============================================="
echo "  POKEMON NASSAU  |  Seed: $SEED"
echo "=============================================="

# --- 1. rgbds (>= 1.0.0) bereitstellen ------------------------------------
brauche_rgbds=1
if command -v rgbasm >/dev/null 2>&1; then
  major=$(rgbasm --version | grep -o '[0-9]\+' | head -1)
  [ "${major:-0}" -ge 1 ] && brauche_rgbds=0
fi

if [ "$brauche_rgbds" = "1" ]; then
  echo "[1/4] rgbds wird gebaut..."
  sudo apt-get update -qq || apt-get update -qq || true
  for paket in bison flex libpng-dev pkg-config build-essential; do
    sudo apt-get install -y -qq "$paket" 2>/dev/null \
      || apt-get install -y -qq "$paket" 2>/dev/null \
      || echo "  Hinweis: $paket konnte nicht installiert werden"
  done
  if [ ! -d quellen/rgbds ]; then
    mkdir -p quellen
    # Bevorzugt die als Repository angehaengte Kopie, sonst aus dem Netz.
    if [ -d ../rgbds ]; then cp -r ../rgbds quellen/rgbds
    else git clone --depth=1 -b v1.0.3 -q https://github.com/gbdev/rgbds.git quellen/rgbds
    fi
  fi
  ( cd quellen/rgbds && make -j"$(nproc)" >/dev/null && (sudo make install >/dev/null 2>&1 || make install >/dev/null) )
else
  echo "[1/4] rgbds vorhanden ($(rgbasm --version))."
fi

major=$(rgbasm --version | grep -o '[0-9]\+' | head -1)
if [ "${major:-0}" -lt 1 ]; then
  echo "FEHLER: rgbds v$major ist zu alt, gebraucht wird v1.0.0 oder neuer."
  exit 1
fi

# --- 2. pokegold-Arbeitskopie ---------------------------------------------
echo "[2/4] pokegold wird bereitgestellt..."
rm -rf build/pokegold
mkdir -p build
if [ -d ../pokegold ]; then
  cp -r ../pokegold build/pokegold
  ( cd build/pokegold && git checkout -- . 2>/dev/null || true )
else
  git clone --depth=1 -q https://github.com/pret/pokegold.git build/pokegold
fi

# --- 3. Nassau-Inhalte -----------------------------------------------------
echo "[3/4] Nassau-Inhalte werden eingespielt..."
python3 nassau.py patch build/pokegold "$SEED"
python3 nassau.py karte-pruefen build/pokegold NewBarkTown 20 18 johto

# --- 4. ROM bauen ----------------------------------------------------------
echo "[4/4] ROM wird gebaut..."
make -C build/pokegold gold -j"$(nproc)" 2>&1 | grep -iE "warning|error" && {
  echo "ABBRUCH: Der Build hat Warnungen oder Fehler gemeldet."
  exit 1
}

mkdir -p rom
cp build/pokegold/pokegold.gbc rom/NASSAU.gbc
echo
echo "FERTIG:  rom/NASSAU.gbc   (Seed $SEED)"
sha1sum rom/NASSAU.gbc

#!/usr/bin/env bash

set -u

ROOT="${1:-/home/ruggio/Documents/UniGe/RT2/Assignment2}"

cd "$ROOT" || {
  echo "Project folder not found: $ROOT"
  echo "Usage: bash bootstrap_sources.sh /path/to/Assignment2"
  exit 1
}

mkdir -p literature/notes literature/downloads literature/repos scripts

LOG="literature/downloads/download_errors.log"
: > "$LOG"

if ! command -v curl >/dev/null 2>&1; then
  echo "Missing curl. Install it with: sudo apt install curl" | tee -a "$LOG"
fi

if ! command -v git >/dev/null 2>&1; then
  echo "Missing git. Install it with: sudo apt install git" | tee -a "$LOG"
fi

cat > literature/search_protocol.md <<'EOF'
---
type: search-protocol
project: RT2_Assignment2
theme: Windows–Linux Application Compatibility
status: draft
---

# Search Protocol

## Research topic

Windows–Linux application compatibility, with Wine as the general compatibility layer, Proton and SteamOS as the main technical case study, and Bazzite as a comparative SteamOS-like distribution.

## Main research question

To what extent can compatibility layers reduce the application-ecosystem barrier between Windows and Linux, and which technical dependencies still prevent Windows applications from running reliably without native porting?

## Search strings

### General compatibility

```text
("Windows applications" OR "Windows software") AND
(Linux OR POSIX) AND
("compatibility layer" OR Wine OR "binary compatibility") AND
(portability OR compatibility OR migration)
```

### Proton and SteamOS

```text
("SteamOS" OR "Steam Deck") AND
(Proton OR Wine OR DXVK OR "VKD3D-Proton") AND
(architecture OR compatibility OR performance)
```

### Bazzite and SteamOS-like distributions

```text
(Bazzite OR "Fedora Atomic" OR "Universal Blue") AND
(SteamOS OR Proton OR gaming OR compatibility)
```

### Lock-in and interoperability

```text
("application ecosystem" OR "vendor lock-in" OR "software compatibility") AND
("operating system" OR Linux OR Windows) AND
(migration OR interoperability OR switching)
```

## Inclusion criteria

- Official documentation for architecture and current features.
- Peer-reviewed papers for empirical and theoretical claims.
- Sources directly related to Wine, Proton, SteamOS, Bazzite or Windows software compatibility on Linux.
- Sources on lock-in, interoperability, software ecosystems or digital sovereignty when relevant to the motivation.

## Exclusion criteria

- Generic opinion pieces.
- Unverifiable benchmarks.
- Sources about console emulation only.
- Community reports used as scientific proof.
- Sources that do not distinguish compatibility layers from virtualisation or emulation.

## Evidence hierarchy

1. Peer-reviewed research.
2. Official technical documentation.
3. Maintainer repositories.
4. Community compatibility databases.
5. Blogs or opinion pieces only for context.
EOF

python3 <<'PY'
from pathlib import Path
import csv

root = Path.cwd()

sources = [
    ["S01","About Wine","WineHQ","n.d.","official documentation","Wine","https://www.winehq.org/about","Defines Wine as a Windows compatibility layer for POSIX systems.","Explains API translation and why Wine is not a full emulator.","Official documentation, not peer-reviewed empirical evidence.","core"],
    ["S02","Proton","ValveSoftware","n.d.","official repository","Proton","https://github.com/ValveSoftware/Proton","Primary source for Proton architecture and its relationship with Wine.","Shows Proton as a tool for running Windows games on Linux through Steam.","Focused mainly on Steam gaming.","core"],
    ["S03","Steam Hardware and Proton","Valve","n.d.","official documentation","Proton limitations","https://partner.steamgames.com/doc/steamhardware/proton","Explains developer-facing Proton compatibility issues.","Useful for anti-cheat, DRM, launchers, middleware and codec limitations.","Steam ecosystem focus.","core"],
    ["S04","Steam Deck Compatibility Review Process","Valve","n.d.","official documentation","SteamOS / Steam Deck","https://partner.steamgames.com/doc/steamdeck/compat","Explains how Valve classifies compatibility.","Verified, Playable and Unsupported categories.","Specific to Steam Deck / Steam platform.","core"],
    ["S05","DXVK","doitsujin / DXVK contributors","n.d.","official repository","DXVK / graphics translation","https://github.com/doitsujin/dxvk","Explains Direct3D 8/9/10/11 translation to Vulkan.","Key component of Proton's technical success.","Technical repository, not academic analysis.","core"],
    ["S06","VKD3D-Proton","Hans-Kristian Arntzen / contributors","n.d.","official repository","VKD3D-Proton / graphics translation","https://github.com/HansKristian-Work/vkd3d-proton","Explains Direct3D 12 translation to Vulkan for Proton.","Relevant to modern high-complexity Windows software and games.","Technical repository, not academic analysis.","core"],
    ["S07","Steam Runtime","ValveSoftware","n.d.","official repository","Steam Runtime","https://github.com/ValveSoftware/steam-runtime","Explains the runtime layer used to stabilise Linux game execution.","Useful for reproducibility, runtime isolation and dependency control.","Technical source.","core"],
    ["S08","SteamOS Download and Source Information","Valve","n.d.","official documentation","SteamOS","https://store.steampowered.com/steamos/download","Useful to delimit SteamOS components and source-package availability.","Shows boundary between open-source components and proprietary Steam client.","Platform documentation, not a scientific source.","core"],
    ["S09","Gamescope","ValveSoftware","n.d.","official repository","SteamOS / compositor","https://github.com/ValveSoftware/gamescope","Explains the gaming-oriented compositor used in SteamOS-like environments.","Useful for the SteamOS platform architecture section.","Gaming-specific.","supporting"],
    ["S10","Bazzite Documentation","Bazzite / Universal Blue","n.d.","official documentation","Bazzite","https://docs.bazzite.gg/","Main source for Bazzite as a Fedora Atomic SteamOS-like distribution.","Useful for atomic updates, rollback, Steam Gaming Mode and usability.","Project documentation, not academic evidence.","core"],
    ["S11","Bazzite Repository","ublue-os","n.d.","official repository","Bazzite","https://github.com/ublue-os/bazzite","Primary repository for Bazzite implementation details.","Useful to verify Fedora Atomic base and project structure.","Implementation source, not academic analysis.","supporting"],
    ["S12","Bottles Documentation","Bottles","n.d.","official documentation","Compatibility tools","https://docs.usebottles.com/","Shows managed Wine environments and dependency handling.","Useful for non-gaming Windows application management.","Tool documentation.","supporting"],
    ["S13","CrossOver","CodeWeavers","n.d.","company documentation","Wine commercial ecosystem","https://www.codeweavers.com/crossover","Commercial Wine-based solution for Windows apps on Linux/macOS.","Useful to show Wine beyond gaming.","Company source; possible marketing bias.","supporting"],
    ["S14","Lutris","Lutris","n.d.","project documentation","Compatibility tools","https://lutris.net/about","Shows launcher and runner management in Linux gaming.","Useful for ecosystem tooling around compatibility.","Mostly gaming-oriented.","supporting"],
    ["S15","Heroic Games Launcher","Heroic Games Launcher","n.d.","project documentation","Compatibility tools","https://heroicgameslauncher.com/","Useful for non-Steam launchers such as Epic, GOG and Amazon Games.","Supports the argument that compatibility depends on ecosystem tooling.","Launcher-specific.","supporting"],
    ["S16","Is Proton Good Enough? A Performance Comparison Between Gaming on Windows and Linux","Kopel and Bożek","2023","academic paper","Performance study","https://link.springer.com/chapter/10.1007/978-3-031-41456-5_48","Peer-reviewed performance comparison between Windows and Linux/Proton.","Central empirical source for Proton performance.","Gaming-specific benchmark.","core"],
    ["S17","Loupe: Driving the Development of OS Compatibility Layers","Lefeuvre et al.","2023","academic paper","Compatibility layers","https://arxiv.org/abs/2309.15996","General operating-system compatibility-layer research.","Useful to frame compatibility layers beyond Proton.","Needs careful mapping to Windows/Linux case.","core"],
    ["S18","Security implications of running Windows software on a Linux system using Wine","Duncan and Schreuders","2019","academic paper","Wine / security","https://link.springer.com/article/10.1007/s11416-018-0319-9","Academic source specifically about running Windows software on Linux with Wine.","Useful for limitations and security implications.","Security focus, not general compatibility.","core"],
    ["S19","Open Source Software Strategy","European Commission","n.d.","policy documentation","Open source / digital sovereignty","https://digital-strategy.ec.europa.eu/en/policies/open-source-strategy","Supports motivation around open source, interoperability and technological autonomy.","Policy context, not technical evidence.","Should not be used to prove compatibility claims.","supporting"],
    ["S20","ProtonDB","ProtonDB community","n.d.","community database","Community evidence","https://www.protondb.com/","Large-scale community compatibility context.","Useful for examples and context.","Crowdsourced and not controlled empirical evidence.","supporting"],
    ["S21","AreWeAntiCheatYet","Community project","n.d.","community database","Anti-cheat evidence","https://areweanticheatyet.com/","Useful for practical anti-cheat compatibility context.","Shows common anti-cheat barriers.","Community maintained; use only as supplementary evidence.","supporting"],
]

fieldnames = ["id","title","authors","year","type","source_family","url","relevance","evidence","limitations","decision","notes_file"]
matrix = root / "literature" / "source_matrix.csv"

with matrix.open("w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerow(fieldnames)
    for row in sources:
        sid, title, authors, year, typ, family, url, relevance, evidence, limitations, decision = row
        safe_family = family.replace("/", "_").replace(" ", "_")
        notes_file = f"literature/notes/{sid}_{safe_family}.md"
        writer.writerow(row + [notes_file])

notes_dir = root / "literature" / "notes"
notes_dir.mkdir(parents=True, exist_ok=True)

for row in sources:
    sid, title, authors, year, typ, family, url, relevance, evidence, limitations, decision = row
    safe_family = family.replace("/", "_").replace(" ", "_")
    note_path = notes_dir / f"{sid}_{safe_family}.md"
    note_path.write_text(f"""---
type: source
id: {sid}
status: {decision}
source_family: {family}
source_type: {typ}
year: {year}
url: {url}
---

# {title}

## Why it is useful

{relevance}

## Main evidence

{evidence}

## Limitations

{limitations}

## How it connects to the project

To be completed after reading.

## Useful citation points

- [ ] Definition
- [ ] Architecture
- [ ] Empirical evidence
- [ ] Limitation
- [ ] Context only

## Decision

**Current decision:** {decision}
""", encoding="utf-8")

print(f"Created {matrix}")
print(f"Created {len(sources)} source notes")
PY

download_page() {
  local id="$1"
  local url="$2"
  local out="literature/downloads/${id}.html"

  if command -v curl >/dev/null 2>&1; then
    echo "Downloading page: $id"
    curl -L --retry 2 --connect-timeout 20 --max-time 90 \
      -A "Mozilla/5.0" \
      "$url" \
      -o "$out" \
      2>>"$LOG" || echo "FAILED page $id: $url" >> "$LOG"
  fi
}

clone_repo() {
  local name="$1"
  local url="$2"
  local dir="literature/repos/${name}"

  if command -v git >/dev/null 2>&1; then
    if [ -d "$dir/.git" ]; then
      echo "Updating repo: $name"
      git -C "$dir" pull --ff-only >>"$LOG" 2>&1 || echo "FAILED update repo $name" >> "$LOG"
    else
      echo "Cloning repo: $name"
      git clone --depth 1 --filter=blob:none "$url" "$dir" >>"$LOG" 2>&1 || echo "FAILED clone repo $name" >> "$LOG"
    fi
  fi
}

download_page "S01_WineHQ" "https://www.winehq.org/about"
download_page "S02_Proton" "https://github.com/ValveSoftware/Proton"
download_page "S03_Steamworks_Proton" "https://partner.steamgames.com/doc/steamhardware/proton"
download_page "S04_SteamDeck_Compatibility" "https://partner.steamgames.com/doc/steamdeck/compat"
download_page "S05_DXVK" "https://github.com/doitsujin/dxvk"
download_page "S06_VKD3D_Proton" "https://github.com/HansKristian-Work/vkd3d-proton"
download_page "S07_Steam_Runtime" "https://github.com/ValveSoftware/steam-runtime"
download_page "S08_SteamOS" "https://store.steampowered.com/steamos/download"
download_page "S09_Gamescope" "https://github.com/ValveSoftware/gamescope"
download_page "S10_Bazzite_Docs" "https://docs.bazzite.gg/"
download_page "S11_Bazzite_GitHub" "https://github.com/ublue-os/bazzite"
download_page "S12_Bottles" "https://docs.usebottles.com/"
download_page "S13_CrossOver" "https://www.codeweavers.com/crossover"
download_page "S14_Lutris" "https://lutris.net/about"
download_page "S15_Heroic" "https://heroicgameslauncher.com/"
download_page "S16_Kopel_Bozek" "https://link.springer.com/chapter/10.1007/978-3-031-41456-5_48"
download_page "S17_Loupe" "https://arxiv.org/abs/2309.15996"
download_page "S18_Duncan_Schreuders" "https://link.springer.com/article/10.1007/s11416-018-0319-9"
download_page "S19_EU_Open_Source" "https://digital-strategy.ec.europa.eu/en/policies/open-source-strategy"
download_page "S20_ProtonDB" "https://www.protondb.com/"
download_page "S21_AreWeAntiCheatYet" "https://areweanticheatyet.com/"

clone_repo "Proton" "https://github.com/ValveSoftware/Proton.git"
clone_repo "DXVK" "https://github.com/doitsujin/dxvk.git"
clone_repo "VKD3D-Proton" "https://github.com/HansKristian-Work/vkd3d-proton.git"
clone_repo "Steam-Runtime" "https://github.com/ValveSoftware/steam-runtime.git"
clone_repo "Gamescope" "https://github.com/ValveSoftware/gamescope.git"
clone_repo "Bazzite" "https://github.com/ublue-os/bazzite.git"

if command -v curl >/dev/null 2>&1; then
  curl -L --retry 2 --connect-timeout 20 --max-time 90 \
    -A "Mozilla/5.0" \
    "https://arxiv.org/pdf/2309.15996" \
    -o "literature/downloads/S17_Loupe.pdf" \
    2>>"$LOG" || echo "FAILED PDF S17 Loupe" >> "$LOG"
fi

echo
echo "Done."
echo "Created:"
echo "  literature/search_protocol.md"
echo "  literature/source_matrix.csv"
echo "  literature/notes/"
echo "  literature/downloads/"
echo "  literature/repos/"
echo
if [ -s "$LOG" ]; then
  echo "Some downloads may have failed. Check:"
  echo "  $LOG"
else
  echo "No download errors logged."
fi

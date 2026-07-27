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

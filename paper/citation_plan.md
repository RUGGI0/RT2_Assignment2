# Citation Plan

This file maps the current paper arguments to BibTeX keys in `paper/references.bib`.

The current draft still contains provisional numeric references such as `[1]`, `[2]`, `[3]`.
When the paper is converted to LaTeX/IEEE, those should be replaced with `\cite{...}` commands.

---

## Core compatibility-layer definitions

| Claim / section | Suggested citation key |
|---|---|
| Wine is a compatibility layer and not a full emulator | `winehqAbout` |
| Compatibility layers as OS/application portability mechanism | `lefeuvre2023loupe` |
| Wine can also create security implications when running Windows software | `duncan2019wineSecurity` |

Example:

```latex
Wine is a compatibility layer rather than a full-system emulator \cite{winehqAbout}.
```

---

## Proton and SteamOS

| Claim / section | Suggested citation key |
|---|---|
| Proton is a Steam Play compatibility tool based on Wine | `valveProton` |
| Proton uses Steam integration and runtime configuration | `valveProton`, `steamRuntime` |
| Steam Deck compatibility review is user-facing compatibility classification | `steamDeckCompatibility` |
| SteamOS image / SteamOS platform context | `steamOSDownload` |
| gamescope as SteamOS session compositor | `gamescope` |

Example:

```latex
Proton is a Steam Play compatibility tool based on Wine and additional components \cite{valveProton}.
```

---

## Graphics translation

| Claim / section | Suggested citation key |
|---|---|
| Direct3D 8/9/10/11 translation through DXVK | `dxvk` |
| Direct3D 12 translation through VKD3D-Proton | `vkd3dProton` |

Example:

```latex
DXVK provides a Vulkan-based implementation of Direct3D 8, 9, 10 and 11 for Linux/Wine \cite{dxvk}.
```

---

## Bazzite and distribution-level adoption

| Claim / section | Suggested citation key |
|---|---|
| Bazzite documentation and general distribution role | `bazziteDocs` |
| Bazzite/Fedora Atomic comparison | `bazziteFedoraAtomicComparison` |
| Gaming workflow on Bazzite | `bazziteGamingIntro` |
| Fedora Atomic desktop context | `fedoraAtomicDesktops` |

Example:

```latex
Bazzite is used here as a distribution-level comparison rather than as a direct SteamOS derivative \cite{bazziteDocs,bazziteFedoraAtomicComparison}.
```

---

## Compatibility tooling ecosystem

| Claim / section | Suggested citation key |
|---|---|
| Bottles and managed compatibility environments | `bottlesDocs` |
| CrossOver as commercial Wine-based compatibility product | `codeweaversCrossover` |
| Lutris as Linux gaming launcher/tooling ecosystem | `lutris` |
| Heroic as launcher for Epic/GOG/Amazon games | `heroicGamesLauncher` |

---

## Community compatibility data

These should be used cautiously. They are useful as practical context, not as controlled scientific evidence.

| Claim / section | Suggested citation key |
|---|---|
| Community game compatibility reports | `protondb` |
| Anti-cheat compatibility tracking | `areWeAntiCheatYet` |

---

## Lock-in, interoperability and open-source policy

| Claim / section | Suggested citation key |
|---|---|
| Open source as part of technological sovereignty / reduced dependency | `euOpenSourceStrategy2026` |
| Earlier Commission OSS strategy | `ecOpenSourceStrategy2020` |

---

## Anti-cheat and kernel-level barriers

| Claim / section | Suggested citation key |
|---|---|
| Kernel-level anti-cheat as a security/system-level concern | `dorner2024anticheat` |
| Community anti-cheat compatibility status | `areWeAntiCheatYet` |

---

## Next conversion step

When converting from Markdown to LaTeX:

1. replace provisional references like `[1]`, `[2]`, `[3]` with `\cite{...}`;
2. add this near the end of `paper.tex`:

```latex
ibliographystyle{IEEEtran}
ibliography{references}
```

3. include URL support in the preamble:

```latex
\usepackage{url}
```

4. compile from inside `paper/` or configure paths accordingly.

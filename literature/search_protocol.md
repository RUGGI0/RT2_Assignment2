---
type: methodology
project: RT2_Assignment2
status: draft
tags:
  - RT2
  - literature-review
  - search-protocol
  - Windows-Linux-compatibility
---

# Literature Search Protocol

## Project title

**Breaking the Windows Compatibility Barrier: Engineering Linux Adoption through SteamOS, Bazzite, and Proton**

## Subtitle

**A State-of-the-Art Analysis of Compatibility Layers, Application Portability, and Open-Source Desktop Adoption**

---

## 1. Objective

This protocol defines how sources will be searched, screened and selected for the state-of-the-art analysis.

The project studies the Windows–Linux application compatibility barrier. SteamOS and Proton are treated as the main technical case study. Bazzite is treated as a comparative SteamOS-like Fedora Atomic distribution that helps discuss packaging, usability and Linux adoption.

The literature review must not become a list of papers. Sources will be grouped by themes, technical functions and relevance to the research question.

---

## 2. Main research question

> To what extent can compatibility layers reduce the application-ecosystem barrier between Windows and Linux, and which technical dependencies still prevent Windows applications from running reliably without native porting?

## 3. Supporting questions

1. What does Proton demonstrate about the feasibility of compatibility-layer engineering for complex Windows software?
2. Which SteamOS design choices make Proton usable as part of a Linux platform?
3. What does Bazzite add to the discussion in terms of distribution-level usability, packaging and adoption?
4. Which dependency classes remain difficult for Wine/Proton-like systems?
5. When is virtualisation still necessary compared with compatibility layers?

---

## 4. Source families

| Family | Purpose |
| --- | --- |
| Wine | General Windows API compatibility on Linux/POSIX |
| Proton | Advanced Wine-based compatibility case, mainly gaming |
| SteamOS | Platform integration around Proton |
| Bazzite | Community SteamOS-like distribution-level comparison |
| DXVK / VKD3D-Proton | Direct3D-to-Vulkan translation layer |
| Bottles / CrossOver / Lutris / Heroic | Managed compatibility environments and launcher ecosystem |
| Academic compatibility-layer literature | Technical and conceptual grounding |
| Vendor lock-in / switching costs | Socio-technical framing |
| Open source / digital sovereignty | Motivation and policy context |

---

## 5. Search locations

### Academic databases

- Google Scholar
- IEEE Xplore
- ACM Digital Library
- ScienceDirect
- SpringerLink
- Scopus or Web of Science, if available through the university

### Official technical sources

- WineHQ
- ValveSoftware/Proton GitHub repository
- SteamOS official pages and source-package information
- Bazzite documentation
- Universal Blue documentation
- DXVK GitHub repository
- VKD3D-Proton GitHub repository
- Bottles documentation
- CrossOver documentation
- Lutris documentation
- Heroic Games Launcher documentation
- Wine Application Database

---

## 6. Search strings

### General Windows–Linux compatibility

```text
("Windows applications" OR "Windows software") AND
(Linux OR POSIX) AND
("compatibility layer" OR Wine OR "binary compatibility") AND
(portability OR compatibility OR migration OR interoperability)
```

### Wine

```text
Wine AND ("Windows API" OR "compatibility layer") AND
(Linux OR POSIX) AND
(application compatibility OR software portability)
```

### Proton and SteamOS

```text
(Proton OR "Steam Play") AND
(Wine OR DXVK OR "VKD3D-Proton") AND
(Linux OR SteamOS) AND
(performance OR compatibility OR portability)
```

### Bazzite

```text
Bazzite AND
("Fedora Atomic" OR "SteamOS-like" OR "gaming mode" OR "Linux gaming") AND
(Steam OR Proton OR Linux)
```

### Compatibility and lock-in

```text
("application compatibility" OR "software ecosystem" OR "vendor lock-in") AND
("operating system" OR Windows OR Linux) AND
(migration OR switching costs OR interoperability)
```

### Open-source adoption

```text
("open source" OR "free software") AND
("desktop Linux" OR "operating system adoption") AND
(interoperability OR compatibility OR digital sovereignty)
```

---

## 7. Inclusion criteria

A source can be included if it satisfies at least one of the following criteria:

- explains Wine, Proton, SteamOS, Bazzite or related compatibility technology;
- discusses Windows application compatibility on Linux;
- provides empirical results about Proton, Wine or Linux gaming/application compatibility;
- discusses application ecosystem lock-in, switching costs or interoperability;
- supports the definition of experimental variables or metrics;
- provides official documentation for a tool used in the technical taxonomy.

Priority is given to sources that are:

- peer-reviewed, for generalised empirical or theoretical claims;
- official documentation, for architecture and implementation details;
- recent, where the software stack is rapidly evolving;
- methodologically explicit, where benchmarks or experiments are used.

---

## 8. Exclusion criteria

Exclude sources that are:

- generic opinion pieces without technical or methodological value;
- only about console emulation or unrelated hardware emulation;
- only about Linux distributions without relevance to compatibility or adoption;
- benchmark posts with unclear hardware, versions or methodology;
- community anecdotes used as primary empirical evidence;
- duplicate sources;
- sources that discuss open source only ideologically without linking to interoperability, governance or adoption.

---

## 9. Evidence hierarchy

| Rank | Evidence type | Use |
| ---: | --- | --- |
| 1 | Peer-reviewed research | Empirical/theoretical claims |
| 2 | Official documentation | Architecture, features, intended behaviour |
| 3 | Maintainer repositories | Implementation details and limitations |
| 4 | Community databases | Supplementary compatibility examples |
| 5 | Blogs/forums/articles | Context only, not central evidence |

---

## 10. Screening workflow

1. Run the search strings.
2. Save every candidate in `source_matrix.csv`.
3. Screen title and abstract/description.
4. Mark each source as `include`, `maybe` or `exclude`.
5. Assign a source family.
6. Select 20–50 screened sources.
7. Select 5–10 core sources for detailed reading.
8. Create one Obsidian note for every core source in `literature/notes/`.
9. Use backward citation search from the strongest academic sources.
10. Use forward citation search if the source is older but central.

---

## 11. Core-source decision rule

A source becomes `core` if it does at least two of the following:

- directly answers part of the research question;
- defines a central concept or technology;
- provides evidence used in the experimental assumptions;
- helps distinguish compatibility layers from virtualisation/emulation;
- helps explain SteamOS, Proton or Bazzite;
- supports the lock-in/interoperability framing;
- identifies limitations or unresolved barriers.

---

## 12. Notes template

```markdown
---
type: source-note
status: candidate
source_family:
source_type:
year:
authors:
url:
doi:
decision:
---

# Source title

## Why this source matters

## Main claims

## Method / evidence

## Relevant technical concepts

## Limitations

## Connection to my research question

## How I may cite it
```

---

## 13. Expected review structure

The literature review will be organised thematically:

1. Operating-system application ecosystems and switching costs.
2. Windows compatibility on Linux: Wine and compatibility layers.
3. Proton and the modern Linux gaming compatibility stack.
4. SteamOS as platform-level integration.
5. Bazzite as a SteamOS-like distribution-level comparison.
6. Remaining barriers: kernel drivers, services, proprietary runtimes, DRM, licensing, hardware and cloud dependencies.
7. Research gap and motivation for the synthetic experiment.

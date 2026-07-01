---
type: project-notes
project: RT2_Assignment2
theme: Windows–Linux Application Compatibility
status: evolving
tags:
  - RT2
  - Assignment2
  - notes
  - SteamOS
  - Proton
  - Wine
  - compatibility
  - open-source
---

# RT2 Assignment 2 — Project Notes

> Operational checklist: [[Dashboard]]

---

## 1. Project Framing

### Preferred title

**SteamOS, Proton, and the Windows–Linux Application Compatibility Barrier: A State-of-the-Art Analysis**

### Alternative title

**Reducing the Windows–Linux Application Compatibility Barrier: What Wine and Proton Reveal about Cross-Platform Software Portability**

### Main research question

> **To what extent can compatibility layers reduce the application-ecosystem barrier between Windows and Linux, and which technical dependencies still prevent Windows applications from running reliably without native porting?**

### Supporting SteamOS/Proton question

> **What does the success of Proton on SteamOS reveal about the feasibility and limits of applying Wine-based compatibility techniques to other classes of complex Windows software?**

### Experimental question

> **How do Windows-specific dependencies affect the simulated probability that an application can run on Linux through a compatibility layer without native porting or full virtualisation?**

### Intended thesis

Mature compatibility layers can substantially reduce the Windows–Linux application barrier for user-space applications, as demonstrated by Proton. Compatibility nevertheless remains uneven when software depends on kernel components, proprietary services, specialised hardware, restrictive licensing, or deeply Windows-specific frameworks.

---

## 2. Motivation

The operating-system choice is constrained not only by technical quality, usability or hardware support, but also by application availability.

A user or organisation may prefer Linux while remaining dependent on Windows because required applications, workflows, file formats, services or peripherals are tied to the Windows ecosystem.

Relevant concepts:

- application ecosystem lock-in;
- vendor lock-in;
- switching costs;
- interoperability;
- user autonomy;
- software freedom;
- technological dependency;
- open-source governance;
- digital sovereignty.

The project should not assume that Linux is inherently superior or that compatibility alone can remove Microsoft’s market position. It should investigate whether reducing application incompatibility can lower migration costs and increase practical freedom of operating-system choice.

### Terminological caution

Linux has European origins, but it is now a global collaborative project rather than a conventional European commercial product.

SteamOS is developed by Valve, a United States company, and includes open-source and proprietary components.

The academically defensible motivation is therefore open-source autonomy, interoperability and reduced single-vendor dependence, not a simple Europe-versus-United States framing.

---

## 3. Scope

### Included application classes

| Class | Representative problems |
| --- | --- |
| Productivity | document formats, macros, cloud integration, enterprise collaboration |
| Creative and multimedia | GPU acceleration, codecs, colour management, plugins |
| CAD and engineering | licensing, proprietary hardware, graphics APIs, enterprise workflows |
| Scientific and technical | measurement devices, legacy libraries, reproducibility, specialised formats |
| Enterprise and legacy | Win32, .NET Framework, COM, ActiveX, internal tools |
| Games | DirectX, input, audio, networking, DRM, launchers and performance |

### Included portability strategies

| Strategy | Description |
| --- | --- |
| Native Linux port | The application is rebuilt or rewritten for Linux |
| Cross-platform development | Portable frameworks are adopted from the initial design |
| Compatibility layer | Windows APIs and expected runtime behaviour are recreated or translated |
| Managed compatibility environment | Prefixes, dependencies and settings are isolated and automated |
| Virtualisation | A complete Windows guest is executed |
| Dual boot | The original operating system is retained for incompatible software |
| Remote or web application | Execution moves to another machine or browser environment |

### Secondary or excluded topics

- console emulation;
- general cybersecurity comparisons;
- detailed cloud-gaming architecture;
- exhaustive comparison of Linux distributions;
- complete legal analysis of reverse engineering;
- certification of every proprietary application;
- claims that open source automatically guarantees privacy or security.

---

## 4. Core Technical Distinctions

### Native porting

The developer adapts, recompiles or rewrites the application for Linux.

Advantages:

- direct system integration;
- potentially better maintenance and performance;
- no translation layer.

Limitations:

- requires source access and developer investment;
- may fragment the codebase;
- may not be commercially justified for a small Linux market.

### Compatibility layer

A compatibility layer recreates or translates interfaces expected by an application.

Wine translates Windows API behaviour into POSIX/Linux equivalents and supplies Windows-compatible user-space components.

Advantages:

- may run an unmodified Windows binary;
- avoids requiring a complete Windows installation;
- reduces the need for per-application source changes.

Limitations:

- API behaviour must be reproduced accurately;
- undocumented behaviour and application-specific assumptions are difficult;
- kernel drivers and privileged Windows components are major obstacles.

### Virtualisation

Virtualisation runs Windows as a guest operating system.

Advantages:

- broad software compatibility;
- preserves the expected Windows environment.

Limitations:

- retains Windows licensing and management dependence;
- weaker desktop and hardware integration;
- resource and usability overhead;
- not equivalent to application portability.

### Emulation

Emulation normally reproduces another hardware architecture or complete execution environment.

Wine and Proton should not be described as full-system emulators. Proton may include or interact with translation technologies, but its central mechanism is Windows API compatibility on Linux.

---

## 5. Compatibility Barrier Taxonomy

| Dimension | Lower barrier | Higher barrier |
| --- | --- | --- |
| User-space API | common Win32 behaviour | undocumented or newly introduced APIs |
| Runtime | common bundled libraries | complex proprietary runtime or framework |
| Graphics | standard or supported APIs | application-specific graphics behaviour or extensions |
| System services | no service required | privileged Windows service |
| Kernel integration | none | kernel driver or security component |
| Hardware | standard input/output | proprietary industrial, scientific or licensing hardware |
| Licensing | open or offline activation | dongle, privileged licence service or cloud-only activation |
| Data format | open standard | closed format tied to one application or service |
| Update mechanism | self-contained | Windows Store or tightly coupled proprietary updater |
| Network dependency | standard protocol | vendor-specific identity, domain or cloud infrastructure |

### Compatibility outcome classes

1. Native Linux version available.
2. Runs unmodified through a compatibility layer.
3. Runs after environment configuration.
4. Runs with partial functionality.
5. Requires application-specific patches.
6. Requires virtualisation or remote Windows.
7. Unsupported.

---

## 6. Why SteamOS and Proton Matter

SteamOS is a strong case study because Valve did not rely only on developers producing native Linux ports. It invested in a platform-level compatibility strategy.

Relevant components:

- Wine as the general compatibility foundation;
- Proton as the Steam-focused distribution and integration layer;
- DXVK for Direct3D 8–11 translation to Vulkan;
- VKD3D-Proton for Direct3D 12 translation;
- Steam Linux Runtime and pressure-vessel for runtime control;
- per-game prefixes and application-specific fixes;
- Steam integration and compatibility testing;
- Gamescope as a gaming-oriented compositor.

### What Proton demonstrates

- computational and graphical complexity is not automatically an insurmountable barrier;
- API translation can support demanding software;
- per-application configuration improves practical compatibility;
- controlled runtimes improve reproducibility;
- coordinated engineering and commercial incentives matter;
- large user feedback loops accelerate compatibility work.

### What Proton does not prove

- that every Windows program can run on Linux;
- that games are always harder to support than business or scientific software;
- that kernel drivers, hardware services or proprietary licensing can always be translated;
- that compatibility is equivalent to a maintained native port;
- that performance is always equal to or better than Windows.

---

## 7. Preliminary Hypotheses

- **H1:** user-space Win32 applications are more likely to be supported than applications requiring kernel drivers or privileged Windows services.
- **H2:** compatibility depends more strongly on Windows-specific dependency type than on nominal application complexity or resource consumption.
- **H3:** Proton shows that high graphics and computing demands do not necessarily prevent compatibility.
- **H4:** managed prefixes, standardised runtimes and application-specific profiles improve reproducibility and usability.
- **H5:** compatibility layers reduce switching costs but cannot independently remove licensing, cloud-service, format and hardware lock-in.
- **H6:** virtualisation offers broader compatibility but retains a stronger dependency on the Windows operating environment.

---

## 8. Experimental Proposal

The notebook should simulate representative application profiles rather than claim to test the complete Windows software catalogue.

### Independent variables

| Factor | Example levels |
| --- | --- |
| Application class | productivity, creative, CAD, scientific, enterprise, games |
| API/runtime dependence | low, medium, high |
| Kernel/service dependence | none, Windows service, kernel driver |
| Hardware dependence | none, standard device, proprietary device |
| Licensing dependence | none/offline, user-space activation, privileged/hardware-based |
| Packaging support | raw Wine, managed prefix, application-specific profile |
| Execution strategy | compatibility layer, virtualisation |

### Dependent variables

| Metric | Interpretation |
| --- | --- |
| Full compatibility | complete defined workflow succeeds |
| Partial compatibility | core function works but required features fail |
| Compatibility score | aggregate functional outcome |
| Setup effort | intervention needed to install and configure |
| Runtime overhead | relative simulated performance cost |
| Integration score | desktop, filesystem, hardware and workflow integration |
| Windows dependency retained | whether Windows remains necessary |

### Experimental constraints

A complete factorial design may be too large. A balanced reduced design is preferable.

The assumptions must be:

- explicit;
- justified by literature;
- stored in a configuration section;
- tested through sensitivity analysis;
- clearly separated from real measurements.

### Suggested statistical analysis

- descriptive statistics;
- compatibility-rate confidence intervals;
- chi-square or Fisher test for categorical associations;
- interpretable logistic-regression model;
- effect sizes;
- comparison between compatibility-layer and virtualisation strategies;
- sensitivity analysis.

### Mandatory limitation

The experiment explores relationships among assumed technical dependencies. It does not estimate the real compatibility rate of the complete Windows application ecosystem.

---

## 9. Literature Review Design

### Suggested search groups

#### General compatibility

```text
("Windows applications" OR "Windows software") AND
(Linux OR POSIX) AND
("compatibility layer" OR Wine OR "binary compatibility") AND
(portability OR compatibility OR migration)
```

#### SteamOS and Proton

```text
("SteamOS" OR "Steam Deck") AND
(Proton OR Wine OR DXVK OR "VKD3D-Proton") AND
(architecture OR compatibility OR performance)
```

#### Non-gaming applications

```text
(Wine OR CrossOver OR Bottles) AND
(productivity OR CAD OR engineering OR scientific OR enterprise) AND
Linux
```

#### Ecosystem lock-in

```text
("application ecosystem" OR "vendor lock-in" OR "software compatibility") AND
("operating system" OR Linux OR Windows) AND
(migration OR interoperability OR switching)
```

### Inclusion criteria

- direct relevance to the research question;
- English language;
- peer-reviewed sources for generalised empirical claims where available;
- official documentation for architecture and current features;
- clear methodology for benchmarks;
- both gaming and non-gaming evidence;
- recent sources for rapidly changing implementations;
- older foundational sources where required.

### Exclusion criteria

- generic opinion pieces;
- ideological arguments without evidence;
- pure console or hardware emulation;
- unverifiable benchmarks used as primary evidence;
- community anecdotes presented as controlled results;
- duplicate publications;
- work only marginally related to Windows–Linux compatibility.

### Evidence hierarchy

1. Peer-reviewed research for empirical and theoretical claims.
2. Official technical documentation for component architecture.
3. Maintainer repositories and issue trackers for implementation details and failure examples.
4. Community databases for supplementary observational evidence.
5. Opinion or journalistic material only for contextual discussion.

---

## 10. Source Families to Cover

### Technical primary sources

- WineHQ documentation.
- ValveSoftware/Proton.
- DXVK.
- VKD3D-Proton.
- Steam Linux Runtime and pressure-vessel.
- Gamescope.
- SteamOS documentation and source-package information.
- Bottles documentation.
- CrossOver documentation.
- Wine Application Database.

### Academic source families

- operating-system compatibility layers;
- binary compatibility;
- Wine or Proton performance;
- software migration and switching costs;
- platform ecosystems and vendor lock-in;
- interoperability;
- open-source governance;
- digital and technological sovereignty.

### Source-note template

```markdown
---
type: source
status: candidate
source_type:
year:
authors:
venue:
doi:
url:
themes:
---

# Title

## Relevance

## Main claim

## Method

## Evidence

## Limitations

## Connections

## Decision
- [ ] Include
- [ ] Core source
- [ ] Exclude
```

---

## 11. Proposed Paper Structure

### 1. Introduction

- Windows application availability as a migration barrier.
- Relationship between operating systems and application ecosystems.
- Open-source adoption and interoperability motivation.
- SteamOS and Proton as the main case study.
- Research questions and contribution.

### 2. Background and State of the Art

- Native porting.
- Cross-platform development.
- Compatibility layers.
- Wine and related management tools.
- Virtualisation.
- SteamOS and Proton.
- Limitations of existing compatibility evidence.

### 3. Compatibility Barrier Taxonomy

- Application classes.
- Dependency categories.
- Compatibility outcome classes.
- Difference between software complexity and Windows-specific dependence.

### 4. Methodological Proposal

- Synthetic application population.
- Variables.
- Assumptions.
- Metrics.
- Repeated trials.
- Statistical analysis.

### 5. Results and Discussion

- Factors most strongly associated with incompatibility.
- Meaning of the Proton case beyond gaming.
- Compatibility-layer versus virtualisation trade-offs.
- Implications for switching costs and practical Linux adoption.

### 6. Limitations and Conclusion

- Synthetic evidence.
- Limited academic coverage.
- Version changes.
- Proprietary software opacity.
- Compatibility as a partial rather than universal solution.

---

## 12. Writing and Reasoning Rules

- Keep the Windows–Linux application barrier as the central topic.
- Use Proton as a case study, not as the entire project.
- Do not equate resource consumption with portability difficulty.
- Do not call Wine or Proton full-system emulators.
- Separate technical evidence from political motivation.
- Do not treat Microsoft market power as a result already proven.
- Do not claim that open source automatically guarantees privacy or security.
- Distinguish measured, reported, community and synthetic evidence.
- Use a thematic literature synthesis.
- Explain why each cited source matters to the argument.
- Report contrary evidence and unresolved limitations.
- Make the conclusion proportional to the evidence.
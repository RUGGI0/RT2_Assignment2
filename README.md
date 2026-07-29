# RT2 Assignment 2 — Windows–Linux Compatibility Barrier

<p align="center">
  <b>SteamOS · Proton · Wine · Bazzite · Linux Adoption · Compatibility Layers</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Course-RT2-blue" />
  <img src="https://img.shields.io/badge/Status-Draft%20Ready-green" />
  <img src="https://img.shields.io/badge/Method-State%20of%20the%20Art-green" />
  <img src="https://img.shields.io/badge/Experiment-Synthetic%20Model-lightgrey" />
  <img src="https://img.shields.io/badge/Notebook-Executed-red" />
  <img src="https://img.shields.io/badge/Paper-PDF%20Generated-blueviolet" />
</p>

---

## Project Overview

This repository contains the working material for **RT2 Assignment 2**.

The project studies the **Windows–Linux application compatibility barrier**: the practical difficulty of adopting Linux when users, workflows, organisations or applications remain dependent on Windows-specific software.

The main technical case study is:

```text
SteamOS + Proton
```

The comparative distribution-level case is:

```text
Bazzite
```

The project combines:

| Component | Role | Status |
|---|---|---|
| State-of-the-art review | Analyse Wine, Proton, SteamOS, Bazzite and compatibility-layer research | Drafted |
| Source matrix | Organise official, academic and supporting sources | Completed initial version |
| Synthetic experiment | Model how Windows-specific dependencies affect compatibility outcomes | Completed |
| Jupyter notebook | Generate dataset, process results and export figures | Created and executed |
| Final paper | IEEE-style report generated from LaTeX | Draft PDF generated |

---

## Working Title

```text
Breaking the Windows Compatibility Barrier:
Engineering Linux Adoption through SteamOS, Bazzite, and Proton
```

## Subtitle

```text
A State-of-the-Art Analysis of Compatibility Layers,
Application Portability, and Open-Source Desktop Adoption
```

---

## Research Focus

The project is not only about gaming.

Gaming, SteamOS and Proton are used as a strong technical case study because modern Windows games are demanding workloads involving graphics APIs, launchers, DRM, input, audio, networking and performance constraints.

The broader research problem is:

> Can compatibility layers reduce the Windows application ecosystem barrier enough to make Linux adoption more practical?

The project therefore analyses compatibility as a multi-dimensional issue:

| Barrier | Examples |
|---|---|
| API dependency | Win32, COM, .NET Framework, DirectX |
| Graphics dependency | Direct3D 11/12, Vulkan translation |
| Kernel / driver dependency | anti-cheat, VPN drivers, hardware dongles |
| Licensing / DRM dependency | online activation, hardware locks, proprietary services |
| Hardware dependency | specialised peripherals, measurement devices |
| Workflow dependency | macros, internal enterprise tools, file formats |
| Distribution-level friction | setup effort, update safety, rollback, package management |

---

## Research Question

```text
To what extent can compatibility layers reduce the application-ecosystem barrier
between Windows and Linux, and which technical dependencies still prevent Windows
applications from running reliably without native porting?
```

---

## Repository Structure

```text
RT2_Assignment2/
├── README.md
├── requirements.txt
├── docs/
│   └── experimental_design.md
├── literature/
│   ├── search_protocol.md
│   ├── source_matrix.csv
│   └── notes/
├── data/
│   ├── raw/
│   │   └── synthetic_trials.csv
│   └── processed/
│       └── aggregated_results.csv
├── notebook/
│   ├── compatibility_barrier_experiment.ipynb
│   ├── compatibility_barrier_experiment_executed.ipynb
│   └── compatibility_barrier_experiment.html
├── figures/
│   ├── compatibility_success_rate.png
│   ├── dependency_risk_heatmap.png
│   ├── integration_score_by_strategy.png
│   ├── setup_effort_boxplot.png
│   └── strategy_comparison.png
├── paper/
│   ├── paper.tex
│   ├── paper.pdf
│   ├── paper_draft.md
│   ├── references.bib
│   ├── citation_plan.md
│   └── README.md
└── src/
```

| Folder | Contents |
|---|---|
| `docs/` | Methodological documents |
| `literature/` | Search protocol, source matrix and source notes |
| `data/raw/` | Raw synthetic dataset |
| `data/processed/` | Aggregated results |
| `notebook/` | Original notebook, executed notebook and HTML export |
| `figures/` | Exported plots used by the paper |
| `paper/` | LaTeX report, bibliography, draft, citation plan and generated PDF |
| `src/` | Optional scripts, currently not central to the project |

---

## Main Outputs

| Output | Path | Status |
|---|---|---|
| Final PDF draft | `paper/paper.pdf` | Generated |
| LaTeX source | `paper/paper.tex` | Present |
| Bibliography | `paper/references.bib` | Present |
| Markdown draft | `paper/paper_draft.md` | Present |
| Citation plan | `paper/citation_plan.md` | Present |
| Experimental design | `docs/experimental_design.md` | Present |
| Raw synthetic dataset | `data/raw/synthetic_trials.csv` | Generated |
| Aggregated results | `data/processed/aggregated_results.csv` | Generated |
| Main notebook | `notebook/compatibility_barrier_experiment.ipynb` | Present |
| Executed notebook | `notebook/compatibility_barrier_experiment_executed.ipynb` | Generated |
| Notebook HTML export | `notebook/compatibility_barrier_experiment.html` | Generated |
| Figures | `figures/*.png` | Generated |

---

## Quick Start

### 1. Move to the repository

```bash
cd /home/ruggio/Documents/UniGe/RT2/Assignment2
```

### 2. Create and activate the virtual environment

```bash
python3 -m venv .venv
source .venv/bin/activate
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Open the project

```bash
code .
```

### 5. Open the notebook

```bash
jupyter notebook notebook/compatibility_barrier_experiment.ipynb
```

---

## Reproducibility

The notebook can be executed from the repository root.

### Execute notebook and save executed copy

```bash
jupyter nbconvert --to notebook --execute notebook/compatibility_barrier_experiment.ipynb \
  --output compatibility_barrier_experiment_executed.ipynb \
  --output-dir notebook
```

### Export notebook to HTML

```bash
jupyter nbconvert --to html --execute notebook/compatibility_barrier_experiment.ipynb \
  --output compatibility_barrier_experiment.html \
  --output-dir notebook
```

Expected regenerated outputs:

```text
data/raw/synthetic_trials.csv
data/processed/aggregated_results.csv
figures/compatibility_success_rate.png
figures/strategy_comparison.png
figures/dependency_risk_heatmap.png
figures/setup_effort_boxplot.png
figures/integration_score_by_strategy.png
notebook/compatibility_barrier_experiment_executed.ipynb
notebook/compatibility_barrier_experiment.html
```

---

## Paper Build

The IEEE-style paper is located in:

```text
paper/
```

To compile the PDF from LaTeX:

```bash
cd /home/ruggio/Documents/UniGe/RT2/Assignment2/paper

pdflatex paper.tex
bibtex paper
pdflatex paper.tex
pdflatex paper.tex
```

Expected output:

```text
paper/paper.pdf
```

If the IEEE class is missing on Ubuntu, install:

```bash
sudo apt update
sudo apt install texlive-latex-base texlive-latex-extra texlive-publishers texlive-bibtex-extra
```

---

## Literature Review Material

The literature review is organised through three files/folders:

```text
literature/search_protocol.md
literature/source_matrix.csv
literature/notes/
```

### Source families currently included

| Family | Role |
|---|---|
| Wine | General Windows compatibility-layer foundation |
| Proton | Main technical case study |
| SteamOS / Steam Deck | Platform-level compatibility context |
| DXVK / VKD3D-Proton | Direct3D-to-Vulkan graphics translation |
| Steam Runtime | Runtime isolation and dependency control |
| Bazzite | SteamOS-like distribution-level comparison |
| Bottles / CrossOver / Lutris / Heroic | Compatibility tooling ecosystem |
| Academic papers | Empirical and conceptual grounding |
| Community databases | Supplementary context only |
| Open-source policy sources | Motivation around autonomy and interoperability |

### Evidence hierarchy

| Priority | Source type | Use |
|---:|---|---|
| 1 | Peer-reviewed research | Main evidence and conceptual grounding |
| 2 | Official technical documentation | Architecture and intended behaviour |
| 3 | Maintainer repositories | Implementation-level details |
| 4 | Community databases | Practical examples and context |
| 5 | Blogs / opinion pieces | Background only |

---

## Experimental Component

The experimental design is documented in:

```text
docs/experimental_design.md
```

The experiment is a **synthetic compatibility-barrier model**.

It does not measure real-world compatibility rates. Instead, it operationalises the taxonomy of Windows-specific dependencies and simulates how those dependencies affect different compatibility strategies.

### Experimental pipeline

```text
compatibility-barrier taxonomy
        ↓
synthetic application profiles
        ↓
simulated compatibility outcomes
        ↓
descriptive statistics
        ↓
figures
        ↓
paper discussion
```

### Synthetic dataset

Raw dataset:

```text
data/raw/synthetic_trials.csv
```

Processed dataset:

```text
data/processed/aggregated_results.csv
```

Dataset size:

```text
6 application classes
× 5 compatibility strategies
× 20 trials
= 600 rows
```

### Application classes

```text
productivity
creative
cad_engineering
scientific
enterprise_legacy
games
```

### Compatibility strategies

```text
native_linux
wine_like
proton_like
managed_prefix
virtualisation
```

---

## Current Figures

| Figure | Description |
|---|---|
| `compatibility_success_rate.png` | Full compatibility rate by strategy |
| `strategy_comparison.png` | Compatibility, setup effort, overhead and integration comparison |
| `dependency_risk_heatmap.png` | Dependency-related compatibility risk |
| `setup_effort_boxplot.png` | Setup effort distribution by strategy |
| `integration_score_by_strategy.png` | Linux integration score by strategy |

---

## Current Status

| Area | Status |
|---|---|
| Topic and scope | Defined |
| Search protocol | Drafted |
| Source matrix | Initial version completed |
| Source notes | Initial templates created |
| Experimental design | Drafted |
| Synthetic dataset | Generated |
| Aggregated results | Generated |
| Notebook | Created |
| Executed notebook | Generated |
| Notebook HTML export | Generated |
| Figures | Generated |
| README | Updated |
| Paper draft | Generated |
| LaTeX paper | Generated |
| Final PDF draft | Generated |

---

## Methodological Warning

The experimental dataset is synthetic.

The results should be interpreted as:

```text
a structured illustration of how dependency classes may affect compatibility
```

They should not be interpreted as:

```text
a real benchmark of Wine, Proton, Bazzite, SteamOS or Linux compatibility
```

The final report must clearly distinguish between:

| Evidence type | Role |
|---|---|
| Peer-reviewed literature | Academic evidence |
| Official documentation | Architecture and definitions |
| Maintainer repositories | Implementation-level details |
| Community databases | Practical examples only |
| Synthetic experiment | Methodological illustration |

---

## Remaining Work

The main repository structure is now complete. The remaining work is qualitative revision:

1. review the paper for clarity, grammar and page layout;
2. check that every major claim has an appropriate citation;
3. verify that figures fit cleanly in the IEEE layout;
4. confirm that synthetic results are not presented as real compatibility measurements;
5. perform one clean reproduction test before final submission.

---

## Private Local Files

The following Obsidian files are intentionally ignored by Git:

```text
Dashboard.md
Project_Notes.md
```

They are used for local planning and should not be considered part of the public submission.

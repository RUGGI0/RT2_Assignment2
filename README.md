# RT2 Assignment 2 — Windows–Linux Compatibility Barrier

**Breaking the Windows Compatibility Barrier: Engineering Linux Adoption through SteamOS, Bazzite, and Proton**

This repository contains the final material for **RT2 Assignment 2**.

The project is a state-of-the-art analysis of the Windows–Linux application compatibility barrier, with a small reproducible synthetic experiment. The main technical case study is **SteamOS + Proton**. The comparative distribution-level case is **Bazzite**.

The project focuses on Windows application portability on Linux, not only on videogames. Gaming is used as a demanding technical case because modern Windows games involve graphics APIs, launchers, DRM, anti-cheat systems, input, audio, networking and performance-sensitive execution.

---

## Research Question

```text
To what extent can compatibility layers reduce the application-ecosystem barrier
between Windows and Linux, and which technical dependencies still prevent Windows
applications from running reliably without native porting?
```

---

## Project Scope

The paper analyses compatibility as a multi-dimensional issue:

| Barrier | Examples |
|---|---|
| API dependency | Win32, COM, .NET Framework, DirectX |
| Graphics dependency | Direct3D 11/12, Vulkan translation |
| Kernel / driver dependency | anti-cheat, VPN drivers, hardware dongles |
| Licensing / DRM dependency | online activation, hardware locks, proprietary services |
| Hardware dependency | specialised peripherals, measurement devices |
| Workflow dependency | macros, enterprise tools, file formats |
| Distribution-level friction | setup effort, rollback, package management |

The review discusses Wine, Proton, SteamOS, Bazzite, DXVK, VKD3D-Proton, Steam Runtime and related compatibility tools.

---

## Repository Structure

```text
RT2_Assignment2/
├── README.md
├── requirements.txt
├── requirements-lock.txt
├── config/
│   └── experiment.yaml
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
├── paper/
│   ├── paper.tex
│   ├── paper.pdf
│   └── references.bib
└── scripts/
    └── bootstrap_sources.sh
```

---

## Main Outputs

| Output | Path |
|---|---|
| Final paper PDF | `paper/paper.pdf` |
| LaTeX source | `paper/paper.tex` |
| Bibliography | `paper/references.bib` |
| Experimental design | `docs/experimental_design.md` |
| Literature source matrix | `literature/source_matrix.csv` |
| Raw synthetic dataset | `data/raw/synthetic_trials.csv` |
| Aggregated results | `data/processed/aggregated_results.csv` |
| Editable notebook | `notebook/compatibility_barrier_experiment.ipynb` |
| Executed notebook | `notebook/compatibility_barrier_experiment_executed.ipynb` |
| HTML notebook export | `notebook/compatibility_barrier_experiment.html` |
| Figures | `figures/*.png` |

---

## Reproducibility

Create and activate a virtual environment:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

Install the main dependencies:

```bash
pip install -r requirements.txt
```

For a more strictly reproducible environment, use the locked dependency file:

```bash
pip install -r requirements-lock.txt
```

Execute the notebook and save an executed copy:

```bash
jupyter nbconvert --to notebook --execute notebook/compatibility_barrier_experiment.ipynb \
  --output compatibility_barrier_experiment_executed.ipynb \
  --output-dir notebook
```

Export the notebook to HTML:

```bash
jupyter nbconvert --to html --execute notebook/compatibility_barrier_experiment.ipynb \
  --output compatibility_barrier_experiment.html \
  --output-dir notebook
```

Running the notebook refreshes the synthetic datasets and generated figures.

---

## Paper Build

The IEEE-style paper is located in `paper/`.

Compile it with:

```bash
cd paper

pdflatex paper.tex
bibtex paper
pdflatex paper.tex
pdflatex paper.tex
```

The output is:

```text
paper/paper.pdf
```

On Ubuntu, the required LaTeX packages can be installed with:

```bash
sudo apt update
sudo apt install texlive-latex-base texlive-latex-extra texlive-publishers texlive-bibtex-extra
```

---

## Synthetic Experiment

The experiment is a **synthetic compatibility-barrier model**.

It compares five compatibility strategies:

```text
native_linux
wine_like
proton_like
managed_prefix
virtualisation
```

across six application classes:

```text
productivity
creative
cad_engineering
scientific
enterprise_legacy
games
```

The dataset contains:

```text
6 application classes × 5 strategies × 20 trials = 600 rows
```

The experiment does **not** measure real-world compatibility rates. It is used to illustrate how different dependency types may affect compatibility outcomes under different Linux adoption strategies.

---

## Methodological Note

The synthetic results should be interpreted as:

```text
a structured illustration of how dependency classes may affect compatibility
```

They should not be interpreted as:

```text
a real benchmark of Wine, Proton, Bazzite, SteamOS or Linux compatibility
```

The paper therefore distinguishes between:

| Evidence type | Role |
|---|---|
| Peer-reviewed literature | Academic evidence |
| Official documentation | Architecture and definitions |
| Maintainer repositories | Implementation-level details |
| Community databases | Practical context only |
| Synthetic experiment | Methodological illustration |

---

## Private Local Files

The following Obsidian planning files are intentionally ignored by Git:

```text
Dashboard.md
Project_Notes.md
```

They are local working files and are not part of the public submission.

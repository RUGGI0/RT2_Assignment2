---
type: experimental-design
project: RT2_Assignment2
theme: Windows–Linux Application Compatibility
status: draft
related_files:
  - literature/search_protocol.md
  - literature/source_matrix.csv
  - notebook/compatibility_barrier_experiment.ipynb
  - data/raw/synthetic_trials.csv
  - data/processed/aggregated_results.csv
tags:
  - RT2
  - experimental-design
  - synthetic-data
  - compatibility-layer
  - Windows-Linux
  - Proton
  - Wine
  - Bazzite
---

# Experimental Design

## 1. Purpose

This document defines the experimental component of the project:

> **Breaking the Windows Compatibility Barrier: Engineering Linux Adoption through SteamOS, Bazzite, and Proton**

The experiment is designed to support the state-of-the-art analysis. It does not attempt to measure the real-world compatibility rate of all Windows applications on Linux.

Instead, it builds a controlled synthetic model that operationalises the compatibility-barrier taxonomy. The goal is to show how different dependency classes can affect the probability that a Windows application runs on Linux through compatibility-layer strategies.

The experiment must therefore be interpreted as a structured methodological illustration, not as a real benchmark of the Windows software ecosystem.

---

## 2. Research Question

### Main experimental question

> **How do Windows-specific dependencies affect the simulated probability that an application can run on Linux through a compatibility layer without native porting or full virtualisation?**

### Connection to the main paper question

The main paper asks:

> **To what extent can compatibility layers reduce the application-ecosystem barrier between Windows and Linux, and which technical dependencies still prevent Windows applications from running reliably without native porting?**

The experiment supports this question by modelling the relationship between:

- application category;
- Windows-specific dependencies;
- compatibility strategy;
- compatibility outcome;
- configuration effort;
- runtime overhead;
- Linux integration;
- residual dependence on Windows.

---

## 3. Experimental Philosophy

The experiment follows this general pipeline:

```text
compatibility-barrier taxonomy
        ↓
synthetic application profiles
        ↓
simulated compatibility outcomes
        ↓
descriptive statistics
        ↓
visualisations
        ↓
paper discussion
```

It is inspired by the assignment model where data are processed through a Jupyter notebook and converted into tables, statistics and figures.

For this project, the pipeline is:

```text
data/raw/synthetic_trials.csv
        ↓
notebook/compatibility_barrier_experiment.ipynb
        ↓
data/processed/aggregated_results.csv
        ↓
figures/*.png
        ↓
paper/report
```

---

## 4. Experimental Unit

The experimental unit is a simulated test of one Windows application profile under one compatibility strategy.

Each row in the raw dataset represents:

```text
one application profile
+ one trial
+ one strategy
+ one generated compatibility outcome
```

An application profile is not a real commercial program. It is a controlled combination of dependency characteristics representing common compatibility barriers.

---

## 5. Application Classes

The synthetic dataset should include the following application classes:

| Class | Meaning | Typical compatibility issue |
| --- | --- | --- |
| `productivity` | Office-like and collaboration software | file formats, macros, cloud integration |
| `creative` | Multimedia and creative software | GPU acceleration, codecs, plugins |
| `cad_engineering` | CAD and engineering tools | licensing, specialised graphics, hardware |
| `scientific` | Technical/scientific software | measurement devices, legacy libraries |
| `enterprise_legacy` | Internal or legacy enterprise apps | Win32, COM, .NET Framework, ActiveX |
| `games` | Windows games | DirectX, launchers, DRM, anti-cheat |

The goal is not to benchmark these classes directly. The goal is to compare how their dependency profiles interact with different Linux compatibility strategies.

---

## 6. Compatibility Strategies

The model compares five strategies:

| Strategy | Description | Expected pattern |
| --- | --- | --- |
| `native_linux` | Application has a native Linux version | high integration, low Windows dependency |
| `wine_like` | Raw Wine-like compatibility layer | useful but setup-sensitive |
| `proton_like` | Proton-style gaming-optimised compatibility stack | strong for graphics/games, weaker outside its target domain |
| `managed_prefix` | Wine-like layer with managed prefixes/profiles | lower setup effort, improved repeatability |
| `virtualisation` | Windows guest in a virtual machine | high compatibility, high retained Windows dependency |

### Why these strategies

- `native_linux` is the ideal portability baseline.
- `wine_like` represents general compatibility layers.
- `proton_like` represents the advanced SteamOS/Proton case.
- `managed_prefix` represents tools such as Bottles/CrossOver-style management.
- `virtualisation` represents the fallback where compatibility layers are insufficient.

---

## 7. Independent Variables

| Variable | Type | Levels |
| --- | --- | --- |
| `application_class` | categorical | productivity, creative, cad_engineering, scientific, enterprise_legacy, games |
| `strategy` | categorical | native_linux, wine_like, proton_like, managed_prefix, virtualisation |
| `api_dependency` | ordinal | low, medium, high |
| `kernel_dependency` | ordinal | none, service, kernel_driver |
| `hardware_dependency` | ordinal | none, standard_device, proprietary_device |
| `licensing_dependency` | ordinal | none, offline_activation, online_activation, hardware_dongle |
| `packaging_support` | ordinal | raw, managed_prefix, app_profile |

---

## 8. Dependent Variables

| Variable | Type | Meaning |
| --- | --- | --- |
| `compatibility_outcome` | categorical | full, partial, failed |
| `compatibility_score` | numeric 0–100 | aggregate simulated compatibility quality |
| `setup_effort` | numeric 0–100 | higher values mean more configuration work |
| `runtime_overhead` | numeric percentage | simulated overhead compared with native execution |
| `integration_score` | numeric 0–100 | Linux desktop/runtime integration |
| `windows_dependency_retained` | binary | whether Windows remains necessary |

---

## 9. Hypotheses

### H1 — Kernel dependency barrier

Applications with no kernel/service dependency will have higher compatibility scores than applications requiring privileged Windows services or kernel drivers.

### H2 — Dependency type matters more than application class

The simulated compatibility outcome will be more strongly affected by dependency type than by the nominal application class.

### H3 — Proton-like strategies are strong but domain-specific

A Proton-like strategy will perform well for graphics-heavy and game-like workloads, but it will not automatically solve non-gaming dependencies such as enterprise services, proprietary licensing systems or specialised hardware drivers.

### H4 — Managed environments reduce configuration friction

Managed prefixes and application profiles will reduce setup effort and improve repeatability compared with raw Wine-like execution.

### H5 — Virtualisation preserves compatibility but retains Windows dependence

Virtualisation will produce high compatibility but will also retain strong Windows dependency and weaker Linux integration.

### H6 — Distribution-level engineering supports adoption

Bazzite-like distribution-level support does not directly change Windows API compatibility, but it can reduce adoption friction through preconfiguration, rollback, packaging and launcher integration.

---

## 10. Scoring Logic

The model should compute a compatibility score from a baseline strategy score and dependency penalties.

### Baseline score by strategy

| Strategy | Baseline score |
| --- | ---: |
| `native_linux` | 95 |
| `virtualisation` | 90 |
| `proton_like` | 78 |
| `managed_prefix` | 72 |
| `wine_like` | 65 |

These are synthetic assumptions. They must not be presented as measured real-world values.

### Dependency penalties

| Dependency | Low / none | Medium / service | High / driver |
| --- | ---: | ---: | ---: |
| API dependency | 0 | -8 | -18 |
| Kernel dependency | 0 | -15 | -35 |
| Hardware dependency | 0 | -8 | -22 |
| Licensing dependency | 0 | -8 / -14 | -28 |

### Strategy-specific adjustments

| Condition | Adjustment |
| --- | ---: |
| `proton_like` + `games` | +8 |
| `proton_like` + high graphics/API dependency | +5 |
| `proton_like` + enterprise_legacy | -8 |
| `managed_prefix` + `app_profile` | +8 |
| `managed_prefix` + `managed_prefix` packaging | +5 |
| `wine_like` + `raw` packaging | -8 |
| `virtualisation` + kernel driver dependency | +10 |
| `native_linux` + high Windows API dependency | not applicable or heavy penalty |

### Random noise

Each trial should add small random variation, for example:

```text
normal noise with mean 0 and standard deviation 5
```

A fixed random seed must be used for reproducibility.

---

## 11. Outcome Classes

Compatibility score should map to outcomes as follows:

| Score range | Outcome |
| --- | --- |
| 75–100 | `full` |
| 45–74 | `partial` |
| 0–44 | `failed` |

These thresholds are synthetic and should be explicitly reported as modelling assumptions.

---

## 12. Dataset Schema

The raw dataset should be stored as:

```text
data/raw/synthetic_trials.csv
```

Required columns:

```csv
application_id,trial,application_class,strategy,api_dependency,kernel_dependency,hardware_dependency,licensing_dependency,packaging_support,compatibility_outcome,compatibility_score,setup_effort,runtime_overhead,integration_score,windows_dependency_retained
```

Optional columns for traceability:

```csv
random_seed,score_before_noise,score_after_penalties,dependency_risk_index,notes
```

---

## 13. Suggested Dataset Size

A reasonable first dataset is:

```text
6 application classes
× 5 strategies
× 20 trials per class-strategy combination
= 600 rows
```

This is large enough for descriptive statistics and simple plots, while remaining easy to inspect.

---

## 14. Analysis Plan

The notebook should compute:

1. total rows and missing values;
2. outcome counts by strategy;
3. full/partial/failed rate by strategy;
4. mean compatibility score by strategy;
5. mean compatibility score by application class;
6. mean setup effort by strategy;
7. mean runtime overhead by strategy;
8. mean integration score by strategy;
9. retained Windows dependency rate by strategy;
10. dependency-risk comparison.

### Optional statistical tests

Because the data are synthetic, tests should be used carefully.

Possible options:

| Test | Use |
| --- | --- |
| Chi-square test | Association between strategy and categorical outcome |
| Kruskal-Wallis test | Compare compatibility scores across strategies |
| Mann-Whitney U test | Pairwise non-parametric comparisons |
| Logistic regression | Simulated probability of full compatibility |
| OLS / robust regression | Compatibility score as numeric outcome |

The paper should focus on patterns and interpretation rather than claiming real-world statistical proof.

---

## 15. Visualisation Plan

Figures should be generated automatically and saved to:

```text
figures/
```

Suggested figures:

| Filename | Figure |
| --- | --- |
| `compatibility_success_rate.png` | full compatibility rate by strategy |
| `strategy_comparison.png` | compatibility, setup effort, overhead and integration by strategy |
| `dependency_risk_heatmap.png` | score by dependency class and level |
| `setup_effort_boxplot.png` | setup effort distribution by strategy |
| `integration_score_by_strategy.png` | Linux integration score by strategy |

---

## 16. Notebook Structure

Notebook path:

```text
notebook/compatibility_barrier_experiment.ipynb
```

Suggested sections:

1. Introduction and research question.
2. Hypotheses.
3. Synthetic-data assumptions.
4. Variable definitions.
5. Synthetic profile generation.
6. Outcome model.
7. Raw dataset export.
8. Descriptive statistics.
9. Strategy comparison.
10. Dependency-risk analysis.
11. Optional statistical tests.
12. Sensitivity analysis.
13. Figure export.
14. Limitations.

---

## 17. Limitations

The experiment has several limitations:

- it uses synthetic data;
- it does not measure real application compatibility;
- it simplifies the Windows software ecosystem;
- it uses manually defined weights;
- it may overrepresent Proton/gaming evidence;
- it cannot model every vendor-specific licensing or cloud-service dependency;
- it does not replace empirical testing on real applications.

The paper must state clearly that the results illustrate dependency relationships. They do not prove real-world Linux compatibility rates.

---

## 18. Expected Contribution

The experiment contributes to the project by turning the state-of-the-art discussion into an operational model.

It helps show that the Windows–Linux compatibility barrier is multidimensional:

```text
API compatibility
+ graphics translation
+ kernel/driver dependence
+ licensing/DRM
+ hardware support
+ packaging and tooling
+ user workflow integration
```

This supports the central argument that compatibility layers can reduce Linux adoption barriers, but cannot fully eliminate ecosystem lock-in by themselves.

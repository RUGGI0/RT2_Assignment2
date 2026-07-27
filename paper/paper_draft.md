# Breaking the Windows Compatibility Barrier: Engineering Linux Adoption through SteamOS, Bazzite, and Proton

**A State-of-the-Art Analysis of Compatibility Layers, Application Portability, and Open-Source Desktop Adoption**

> **Draft version:** v2  
> **Status:** expanded working draft  
> **Course:** RT2 Assignment 2  
> **Repository:** `RUGGI0/RT2_Assignment2`  
> **Main case study:** SteamOS + Proton  
> **Comparative case:** Bazzite  
> **Experiment type:** synthetic compatibility-barrier model  

---

## Abstract

Desktop Linux adoption is often discussed as a problem of usability, hardware support or user preference. This paper instead focuses on the application-ecosystem barrier between Windows and Linux. Even when Linux is technically suitable, users and organisations may remain dependent on Windows because required applications rely on Windows-specific APIs, drivers, licensing systems, services, file formats or workflows.

The paper presents a state-of-the-art analysis of Windows application compatibility on Linux, with Wine as the general compatibility-layer foundation, Proton and SteamOS as the main technical case study, and Bazzite as a comparative SteamOS-like Linux distribution. Proton is analysed as an example of how compatibility-layer engineering can support complex Windows workloads through API translation, graphics translation, runtime management and platform integration. Bazzite is used to discuss the distribution-level side of adoption: preconfiguration, update safety, rollback, packaging and reduced setup friction.

A synthetic experiment is then introduced to operationalise the compatibility-barrier taxonomy. The experiment models how different dependency classes affect simulated compatibility outcomes under five strategies: native Linux, Wine-like compatibility, Proton-like compatibility, managed prefixes and virtualisation. The results are not real-world compatibility measurements. They are used as a structured illustration of why dependency type matters more than nominal application class.

The analysis suggests that compatibility layers can reduce the Windows-Linux application barrier for many user-space workloads, but cannot independently eliminate ecosystem lock-in. Kernel drivers, anti-cheat systems, proprietary licensing, specialised hardware, cloud services and enterprise workflows remain difficult barriers. Linux adoption therefore depends on both compatibility-layer engineering and broader ecosystem integration.

**Keywords:** Linux adoption, Windows compatibility, Wine, Proton, SteamOS, Bazzite, compatibility layers, application portability, vendor lock-in, interoperability.

---

## 1. Introduction

Desktop operating systems are not adopted in isolation. A user does not choose only a kernel, graphical shell or package manager; they choose an application ecosystem. For this reason, the migration from Windows to Linux is constrained not only by Linux's technical capabilities, but also by the availability and reliability of required applications.

This issue is visible in many contexts. A home user may depend on a Windows-only game launcher, a professional may require specialised creative or CAD software, and an organisation may rely on internal applications, macros, file formats or peripherals designed around Windows. In each case, the operating-system choice is shaped by the application layer.

The central problem of this paper is therefore the **Windows-Linux application compatibility barrier**. This barrier is not a single technical defect. It is a set of interacting dependencies involving APIs, graphics stacks, drivers, licensing mechanisms, hardware, cloud services and workflows.

Compatibility layers attempt to reduce this barrier by allowing Windows binaries to run on Linux without a complete rewrite. Wine is the general-purpose compatibility-layer foundation for running Windows applications on POSIX-compliant systems such as Linux, macOS and BSD [1]. Proton is a Valve-maintained compatibility tool for Steam Play, based on Wine and additional components, that allows many Windows games to run on Linux through the Steam client [2]. SteamOS provides a Linux-based platform where this compatibility stack can be integrated into a user-facing system. Bazzite is relevant as a comparative distribution-level case because it shows how a SteamOS-like Linux experience can be assembled with gaming-focused preconfiguration and atomic desktop practices [3].

The paper does not argue that compatibility layers make Windows irrelevant. Instead, it asks a narrower question: to what extent can compatibility-layer engineering reduce application-related switching costs, and which dependencies continue to block reliable migration?

### 1.1 Research question

The main research question is:

> **To what extent can compatibility layers reduce the application-ecosystem barrier between Windows and Linux, and which technical dependencies still prevent Windows applications from running reliably without native porting?**

### 1.2 Contribution

The contribution of the paper is fourfold:

1. it organises the state of the art around Wine, Proton, SteamOS, Bazzite and related compatibility tools;
2. it proposes a taxonomy of Windows-Linux compatibility barriers;
3. it distinguishes technical compatibility from distribution-level adoption friction;
4. it introduces a synthetic experiment that models how dependency types affect simulated compatibility outcomes.

### 1.3 Scope

The project is not only about videogames. Games are used because they are demanding Windows workloads: they may require Direct3D, launchers, DRM, anti-cheat, input handling, audio, networking and performance-sensitive execution. The success of Proton is therefore technically significant.

However, the broader topic is Windows application portability. The paper also considers productivity, creative, CAD/engineering, scientific and enterprise legacy software as categories where Windows dependence may appear in different forms.

---

## 2. Background and State of the Art

### 2.1 Native porting, compatibility layers, virtualisation and emulation

There are several ways to make a Windows application available to Linux users.

A **native Linux port** adapts or rebuilds the application so that it runs directly on Linux. This is usually the cleanest solution from the user's perspective, but it requires vendor commitment and long-term maintenance.

A **compatibility layer** allows a Windows binary to run by recreating or translating the Windows runtime environment expected by the application. Wine belongs to this category. Wine explicitly describes itself as a compatibility layer, not as a full emulator [1].

**Virtualisation** runs a complete Windows guest operating system inside a virtual machine. It can provide broader compatibility for difficult software, but it retains a strong dependency on Windows licensing, Windows updates and a separated guest environment.

**Emulation** reproduces hardware or platform behaviour at a lower level. It is not the main focus of this paper. Wine and Proton should not be described as full-system emulators.

The distinction matters because each strategy solves a different part of the compatibility problem. Native porting removes Windows dependency but requires developer effort. Compatibility layers reduce dependency without requiring a port, but remain incomplete. Virtualisation preserves compatibility but does not remove Windows dependence.

### 2.2 Wine as the general compatibility foundation

Wine is the foundational project for running Windows applications on Linux and other POSIX-compliant systems. Its importance lies in the fact that it does not require a full copy of Windows. Instead, it implements or translates the interfaces expected by Windows applications [1].

For the Windows-Linux migration problem, Wine is important because it targets existing Windows binaries. It therefore addresses the legacy software problem: applications that already exist for Windows but have no native Linux version.

However, Wine also reveals the limits of compatibility-layer approaches. Applications may rely on undocumented behaviour, missing APIs, Windows services, drivers, licensing systems or hardware assumptions. In these cases, compatibility is not guaranteed by the presence of the compatibility layer alone.

Wine should therefore be treated as a general-purpose foundation rather than a universal solution.

### 2.3 Proton as a specialised Wine-based compatibility stack

Proton is built for the Steam ecosystem. Valve describes Proton as a tool used with the Steam client that allows Windows-exclusive games to run on Linux [2]. It is based on Wine and additional components, and its technical importance comes from integration rather than from a single mechanism.

Proton combines several layers:

- Wine-based Windows API compatibility;
- graphics translation through components such as DXVK and VKD3D-Proton;
- Steam integration;
- runtime and dependency control;
- game-specific fixes and compatibility configuration.

This makes Proton a strong case study because modern Windows games are complex. If a compatibility stack can support many game workloads, then compatibility-layer engineering is not limited to simple legacy applications.

Nevertheless, Proton's domain matters. It is optimised for Steam and gaming. It should not be used as proof that all Windows applications can run on Linux. Enterprise software, CAD tools, professional licensing systems, hardware dongles and specialised drivers introduce different constraints.

### 2.4 SteamOS as platform integration

SteamOS is important because it shows that compatibility is not only a library-level problem. A compatibility layer must be integrated into a usable system. From the user's perspective, it matters whether games or applications are easy to launch, whether updates break existing setups, whether the runtime is stable and whether hardware behaves consistently.

SteamOS and Steam Deck also introduce user-facing compatibility classification. This is relevant because compatibility is not binary. An application may be fully supported, partially usable, require manual configuration, or fail due to specific dependencies.

The SteamOS/Proton case therefore suggests that compatibility-layer adoption requires:

- technical translation;
- runtime stability;
- platform integration;
- compatibility metadata;
- user-facing expectations;
- update management.

### 2.5 Bazzite as a distribution-level adoption case

Bazzite is useful in this paper not because it is the same as SteamOS, but because it provides a comparative SteamOS-like Linux distribution case. Its documentation compares it with Fedora Atomic Desktop and highlights gaming-focused preinstalled software such as Steam and Lutris, together with Distrobox containers for accessing other Linux package-management environments [3].

This is relevant for the adoption side of the compatibility problem. A compatibility layer may exist, but users still need a distribution environment where drivers, launchers, runtimes and updates are manageable. Bazzite represents this distribution-level layer.

The role of Bazzite in the paper is therefore limited and specific:

```text
Bazzite does not directly solve Windows API compatibility.
Bazzite can reduce adoption friction around setup, packaging, updates and usability.
```

This distinction prevents the paper from confusing compatibility engineering with distribution engineering.

### 2.6 Related compatibility tools

Other tools such as Bottles, CrossOver, Lutris and Heroic show that the compatibility ecosystem extends beyond Wine and Proton alone. Their relevance lies in prefix management, dependency management, launcher integration and user experience.

These tools support the broader argument that Windows compatibility on Linux is not simply a yes/no property. It is mediated by configuration, application profiles, runtime versions, launchers, installers and user-facing workflows.

### 2.7 Lock-in and interoperability

The compatibility problem also has an economic and organisational dimension. Users may be locked into Windows not because they prefer Windows itself, but because their applications, documents, services and workflows depend on it.

Compatibility layers can reduce some switching costs by allowing selected Windows applications to run on Linux. However, they cannot fully eliminate lock-in where the dependency is contractual, organisational, cloud-based, hardware-bound or tied to proprietary services.

This paper therefore treats compatibility as a socio-technical issue. Technical API translation is necessary but not sufficient for migration.

---

## 3. Compatibility Barrier Taxonomy

The paper classifies compatibility barriers into seven categories.

### 3.1 User-space API dependency

Applications may depend on Windows-specific APIs, libraries or runtime behaviour. Examples include Win32, COM, .NET Framework, registry assumptions, drive-letter paths and Windows-specific file-system behaviour.

These dependencies are the traditional target of Wine-like compatibility layers.

### 3.2 Graphics stack dependency

Graphics-heavy applications may depend on Direct3D or specific GPU assumptions. Proton's technical success is closely connected to graphics translation from Direct3D to Vulkan through projects such as DXVK and VKD3D-Proton.

This category is especially important for games, creative tools and some CAD/engineering applications.

### 3.3 Kernel and driver dependency

Some applications require privileged services or kernel-level components. These are more difficult for compatibility layers because they depend on low-level Windows behaviour rather than user-space APIs.

Examples include:

- anti-cheat drivers;
- VPN drivers;
- kernel-level DRM;
- hardware protection dongles;
- specialised device drivers.

### 3.4 Licensing and DRM dependency

An application may technically start under a compatibility layer but fail because its licensing system expects Windows-specific hardware identifiers, online activation behaviour, kernel services or vendor-controlled cloud services.

This is a major barrier for professional and enterprise software.

### 3.5 Hardware dependency

Scientific, industrial, medical, audio, creative and engineering tools may depend on specialised peripherals. If the required hardware has no Linux driver or expects a Windows-only driver stack, compatibility layers cannot fully solve the problem.

### 3.6 Workflow dependency

A workflow may depend on more than the application binary. It may involve macros, file formats, templates, plugins, network drives, internal scripts, authentication systems or collaborative platforms.

This category is important because migration failure can occur even when the main application technically runs.

### 3.7 Distribution-level friction

Finally, users may face friction from setup complexity, unstable updates, driver configuration, runtime conflicts and lack of documentation. This is why SteamOS and Bazzite are relevant: they address the environment around compatibility rather than only the compatibility layer itself.

---

## 4. Methodology

### 4.1 Literature review

The literature review is organised through:

```text
literature/search_protocol.md
literature/source_matrix.csv
literature/notes/
```

The review combines official documentation, maintainer repositories, academic papers and supporting community sources. These sources are grouped thematically instead of being summarised one by one.

The evidence hierarchy is:

1. peer-reviewed research;
2. official technical documentation;
3. maintainer repositories;
4. community compatibility databases;
5. blogs and opinion pieces only for context.

### 4.2 Synthetic experiment

The experimental design is documented in:

```text
docs/experimental_design.md
```

The notebook is:

```text
notebook/compatibility_barrier_experiment.ipynb
```

The experiment is synthetic. Its role is to make the taxonomy operational by simulating how different dependency classes affect compatibility outcomes.

The model compares five strategies:

| Strategy | Interpretation |
|---|---|
| `native_linux` | application has a native Linux version |
| `wine_like` | raw compatibility-layer execution |
| `proton_like` | Proton-style compatibility stack |
| `managed_prefix` | compatibility layer with managed profiles/prefixes |
| `virtualisation` | Windows guest environment |

The model includes six application classes:

| Class | Description |
|---|---|
| `productivity` | office-like and collaboration software |
| `creative` | multimedia and creative applications |
| `cad_engineering` | CAD and engineering tools |
| `scientific` | technical and scientific applications |
| `enterprise_legacy` | internal or legacy enterprise applications |
| `games` | Windows games |

The dataset contains:

```text
6 application classes × 5 strategies × 20 trials = 600 rows
```

### 4.3 Variables

The independent variables are:

- application class;
- compatibility strategy;
- API dependency level;
- kernel dependency level;
- hardware dependency level;
- licensing dependency level;
- packaging support.

The dependent variables are:

- compatibility outcome;
- compatibility score;
- setup effort;
- runtime overhead;
- integration score;
- retained Windows dependency.

### 4.4 Interpretation rule

The experiment is not used as empirical proof. It is used as a controlled model. Results should be read as:

```text
"given these assumptions, this is how dependency classes interact"
```

not as:

```text
"this is the real compatibility rate of Linux, Wine, Proton or Bazzite"
```

---

## 5. Experimental Results

### 5.1 Dataset overview

The raw dataset is stored in:

```text
data/raw/synthetic_trials.csv
```

The processed strategy-level results are stored in:

```text
data/processed/aggregated_results.csv
```

The dataset contains 600 rows. Each strategy is evaluated through 120 synthetic trials.

### 5.2 Aggregated results by strategy

The current aggregated results are:

| Strategy | Trials | Mean compatibility score | Median setup effort | Mean runtime overhead | Mean integration score | Retained Windows dependency rate | Full compatibility rate |
|---|---:|---:|---:|---:|---:|---:|---:|
| `native_linux` | 120 | 89.086 | 11.170 | 3.803 | 95.695 | 0.000 | 0.992 |
| `virtualisation` | 120 | 80.110 | 49.925 | 25.956 | 46.403 | 1.000 | 0.742 |
| `proton_like` | 120 | 49.910 | 41.915 | 9.627 | 79.698 | 0.000 | 0.050 |
| `managed_prefix` | 120 | 45.462 | 34.660 | 11.881 | 75.366 | 0.000 | 0.033 |
| `wine_like` | 120 | 24.776 | 81.800 | 13.860 | 60.850 | 0.000 | 0.000 |

These values are synthetic. They reflect the assumptions encoded in the model, not observed real-world compatibility rates.

### 5.3 Interpretation

The synthetic results follow the intended logic of the model.

Native Linux is the strongest strategy when available. It has the highest mean compatibility score, the lowest setup effort and the highest integration score. This reflects the fact that native applications avoid most Windows compatibility translation problems.

Virtualisation has a high compatibility score, but it retains a complete Windows dependency. It also has higher runtime overhead and lower Linux integration. This supports the distinction between compatibility and actual migration away from Windows.

The Proton-like strategy performs better than raw Wine-like execution in integration and runtime overhead, but its full compatibility rate remains low across the full synthetic dataset. This result should not be interpreted as a negative claim about Proton. It reflects the model's inclusion of non-gaming application classes such as CAD, scientific and enterprise software, where Proton-like assumptions are less directly applicable.

Managed prefixes reduce setup effort compared with raw Wine-like execution. This supports the claim that tooling and configuration management matter. However, managed prefixes do not eliminate barriers such as kernel drivers, licensing systems or proprietary hardware dependencies.

Raw Wine-like execution is the most fragile strategy in the model. This reflects high setup sensitivity and the absence of application-specific profiles or platform integration.

### 5.4 Figures

The notebook generates five figures:

| Figure | Use in paper |
|---|---|
| `figures/compatibility_success_rate.png` | compare full compatibility rate by strategy |
| `figures/strategy_comparison.png` | compare compatibility, effort, overhead and integration |
| `figures/dependency_risk_heatmap.png` | show dependency risk patterns |
| `figures/setup_effort_boxplot.png` | show configuration friction |
| `figures/integration_score_by_strategy.png` | show Linux integration differences |

The most important figures for the final paper are likely:

1. `strategy_comparison.png`;
2. `dependency_risk_heatmap.png`;
3. `setup_effort_boxplot.png`.

---

## 6. Discussion

### 6.1 Compatibility layers reduce but do not erase the barrier

The analysis suggests that compatibility layers can reduce the Windows-Linux application barrier for some workloads. This is especially plausible for applications whose main dependencies are user-space APIs or graphics calls that can be translated.

However, compatibility layers are weaker when the dependency is outside user-space API translation. Kernel drivers, anti-cheat systems, licensing services, proprietary hardware and enterprise workflows remain difficult.

### 6.2 Proton as proof of engineering feasibility

Proton demonstrates that compatibility-layer engineering can support complex workloads when it is combined with platform integration. Its significance lies in the combination of Wine-based compatibility, graphics translation, runtime control and Steam integration.

The key lesson is not that every Windows application can run on Linux. The key lesson is that compatibility can become practical when the compatibility layer is embedded in a broader technical and distribution ecosystem.

### 6.3 Bazzite as distribution-level evidence

Bazzite adds a different kind of evidence. It does not directly reimplement Windows APIs. Instead, it reduces friction around using a Linux system for gaming and compatibility workflows.

This supports a broader conclusion: compatibility-layer success depends not only on API coverage, but also on the operating-system environment surrounding the compatibility layer.

### 6.4 Virtualisation as fallback

Virtualisation remains important because it can support applications that compatibility layers cannot. However, it preserves Windows as a required component. It therefore reduces short-term migration friction but does not remove Windows dependence.

### 6.5 Implications for Linux adoption

The Windows-Linux adoption problem should be understood as a layered issue:

```text
application binary compatibility
+ runtime and dependency management
+ graphics and driver support
+ licensing and service compatibility
+ distribution-level usability
+ organisational workflow migration
```

Solving only one layer is not enough.

---

## 7. Limitations

This paper has several limitations.

First, the experiment is synthetic. It does not measure real applications and should not be presented as a benchmark.

Second, the model uses manually defined weights. These weights are transparent and reproducible, but they are still assumptions.

Third, Proton evidence is gaming-oriented. The paper uses gaming as a demanding case study, but it must avoid generalising directly from games to all Windows software.

Fourth, community compatibility databases can provide useful context, but they are not controlled scientific evidence.

Fifth, compatibility changes over time. Wine, Proton, SteamOS, Bazzite, drivers, applications and DRM systems are all moving targets.

Sixth, the paper does not perform a legal or economic analysis of licensing, vendor lock-in or digital sovereignty. These topics are used only to frame motivation.

---

## 8. Conclusion

The Windows-Linux application barrier is a major obstacle to desktop Linux adoption. It is not limited to whether Linux itself is technically capable. It arises from the dependency of applications, workflows and organisations on Windows-specific APIs, services, drivers, licensing mechanisms and habits.

Compatibility layers can reduce this barrier. Wine provides the general foundation, while Proton and SteamOS show how compatibility-layer engineering can become practical when combined with graphics translation, runtime control and platform integration. Bazzite shows that distribution-level engineering can further reduce adoption friction by making the surrounding Linux environment easier to use.

However, compatibility layers cannot eliminate all forms of Windows dependence. Kernel drivers, anti-cheat systems, proprietary licensing, specialised hardware, cloud services and enterprise workflows remain major barriers.

The most realistic conclusion is therefore intermediate. Compatibility layers can make Linux adoption more feasible, but they do not replace native ports, virtualisation, organisational migration planning or broader interoperability work. The future of Windows-Linux portability depends on both technical compatibility and ecosystem-level integration.

---

## References

> These references are provisional. They should be converted into proper IEEE/BibTeX entries before final submission.

[1] WineHQ, "About Wine." Available: https://www.winehq.org/about/

[2] ValveSoftware, "Proton: Compatibility tool for Steam Play based on Wine and additional components." Available: https://github.com/ValveSoftware/Proton

[3] Bazzite Documentation, "Comparison of Bazzite and Fedora Atomic Desktop." Available: https://docs.bazzite.gg/General/Fedora_Atomic_Comparison/

[4] Valve, "Steam Deck compatibility review process." Available: https://partner.steamgames.com/doc/steamdeck/compat

[5] doitsujin and contributors, "DXVK." Available: https://github.com/doitsujin/dxvk

[6] Hans-Kristian Arntzen and contributors, "VKD3D-Proton." Available: https://github.com/HansKristian-Work/vkd3d-proton

[7] ValveSoftware, "Steam Runtime." Available: https://github.com/ValveSoftware/steam-runtime

[8] Bottles contributors, "Bottles Documentation." Available: https://docs.usebottles.com/

[9] CodeWeavers, "CrossOver." Available: https://www.codeweavers.com/crossover

[10] Lefeuvre et al., "Loupe: Driving the Development of OS Compatibility Layers." Available: https://arxiv.org/abs/2309.15996

[11] Duncan and Schreuders, "Security implications of running Windows software on a Linux system using Wine." Available: https://link.springer.com/article/10.1007/s11416-018-0319-9

[12] European Commission, "Open Source Software Strategy." Available: https://digital-strategy.ec.europa.eu/en/policies/open-source-strategy

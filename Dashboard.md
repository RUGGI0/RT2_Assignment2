---
type: dashboard
project: RT2_Assignment2
theme: SteamOS, Proton and the Windows–Linux Application Compatibility Barrier
deadline: TBD
repo: /home/ruggio/Documents/UniGe/RT2/Assignment2
status: scope-reframed
review_type: structured-narrative-state-of-the-art
tags:
  - RT2
  - Assignment2
  - SteamOS
  - Linux
  - Windows
  - Wine
  - Proton
  - compatibility-layer
  - application-portability
  - vendor-lock-in
  - open-source
  - digital-sovereignty
---
# 🐧 RT2 Assignment 2 — Dashboard

> **Topic:** Windows–Linux application compatibility, with SteamOS and Proton as the main case study.  
> **Project notes:** [[Project_Notes]]  
> **Current phase:** define the final research question and prepare the literature-search protocol.  
> **Next concrete action:** complete Phase 0, then start the source-screening table.

---

## 1. Progress

```dataviewjs
// Reads only the "Working Plan" section and computes progress from its checkboxes.

const current = dv.current();
const file = app.vault.getAbstractFileByPath(current.file.path);

if (!file) {
  dv.paragraph("⚠️ File not found by Dataview.");
} else {
  const text = await app.vault.read(file);

  function getSection(source, title) {
    const lines = source.split(/\r?\n/);
    const start = lines.findIndex(line =>
      new RegExp("^##\\s+\\d+\\.\\s+" + title + "\\s*$").test(line.trim())
    );

    if (start === -1) return "";

    let end = lines.length;
    for (let i = start + 1; i < lines.length; i++) {
      if (/^##\s+\d+\.\s+/.test(lines[i].trim())) {
        end = i;
        break;
      }
    }

    return lines.slice(start + 1, end).join("\n");
  }

  const workingPlan = getSection(text, "Working Plan");

  const taskLines = workingPlan
    .split(/\r?\n/)
    .filter(line => /^\s*[-*]\s+\[[ xX]\]\s+/.test(line));

  const total = taskLines.length;
  const done = taskLines.filter(line => /^\s*[-*]\s+\[[xX]\]\s+/.test(line)).length;

  const percent = total === 0 ? 0 : Math.round((done / total) * 100);
  const blocks = 20;
  const filled = total === 0 ? 0 : Math.round((done / total) * blocks);
  const bar = "█".repeat(filled) + "░".repeat(blocks - filled);

  dv.paragraph(`**${done} / ${total} tasks completed**`);
  dv.paragraph(`\`${bar}\` **${percent}%**`);
}
```

---

## 2. Current Status

| Area | Status | Immediate objective |
| --- | ---: | --- |
| Scope | 🟨 | Freeze title, research question and boundaries |
| Literature review | ⬜ | Prepare protocol and screening table |
| Technical analysis | ⬜ | Build the Wine–Proton–SteamOS compatibility explanation |
| Experiment | ⬜ | Define variables, assumptions and metrics |
| Notebook | ⬜ | Implement reproducible synthetic experiment |
| Paper | ⬜ | Write the 5–6 page IEEE-style report |
| Final delivery | ⬜ | Reproduce, clean, validate and push |

---

## 3. Working Plan

### Phase 0 — Scope and project setup

- [x] Reframe gaming as a case study rather than the complete project scope.
- [x] Identify the Windows–Linux application barrier as the central problem.
- [x] Separate the operational dashboard from the theoretical notes.
- [ ] Record the final deadline in the dashboard frontmatter.
- [ ] Freeze the final title.
- [ ] Freeze the main research question.
- [ ] Freeze the supporting SteamOS/Proton question.
- [ ] Define what is included and excluded from the project.
- [ ] Confirm whether the notebook must interact with ROS 2.
- [ ] Create the final project folder structure.

### Phase 1 — Literature-search protocol

- [ ] Define the academic databases to search.
- [ ] Define the official technical sources to consult.
- [ ] Write the main search strings.
- [ ] Define inclusion criteria.
- [ ] Define exclusion criteria.
- [ ] Define the source-quality hierarchy.
- [ ] Create `literature/screening_log.csv`.
- [ ] Create `literature/source_matrix.csv`.
- [ ] Run a pilot search on 10–15 results.
- [ ] Adjust the protocol after the pilot.

### Phase 2 — Source collection and selection

- [ ] Collect 20–50 candidate sources.
- [ ] Remove duplicates.
- [ ] Screen titles and abstracts.
- [ ] Separate gaming and non-gaming evidence.
- [ ] Select 5–10 core sources for detailed reading.
- [ ] Include academic compatibility-layer research.
- [ ] Include official Wine, Proton and SteamOS documentation.
- [ ] Include non-gaming compatibility sources.
- [ ] Include at least one source on lock-in or interoperability.
- [ ] Perform backward and forward citation search.
- [ ] Create one Obsidian note for each core source.

### Phase 3 — State-of-the-art synthesis

- [ ] Group the literature by themes, not by individual paper.
- [ ] Define the application-category taxonomy.
- [ ] Define the portability-strategy taxonomy.
- [ ] Define the dependency and compatibility-barrier taxonomy.
- [ ] Explain native porting, compatibility layers, virtualisation and emulation.
- [ ] Analyse Wine as the general compatibility foundation.
- [ ] Analyse Proton and SteamOS as the main advanced case study.
- [ ] Identify which Proton principles transfer beyond gaming.
- [ ] Compare strengths and limitations of the approaches.
- [ ] Identify the research gap and final paper contribution.
- [ ] Prepare the critical comparison table.

### Phase 4 — Experimental design

- [ ] Freeze the experimental question.
- [ ] Write the hypotheses before generating data.
- [ ] Define representative application classes.
- [ ] Define independent variables.
- [ ] Define dependent variables and metrics.
- [ ] Define control and confounding variables.
- [ ] Define the compatibility score and outcome classes.
- [ ] Define the synthetic-data assumptions.
- [ ] Justify assumptions using the selected literature.
- [ ] Define the number of repeated trials.
- [ ] Run a small pilot experiment.
- [ ] Revise and freeze the final protocol.

### Phase 5 — Jupyter notebook

- [ ] Create the notebook structure.
- [ ] Document the research question and assumptions.
- [ ] Fix and report the random seed.
- [ ] Generate representative synthetic application profiles.
- [ ] Simulate compatibility outcomes.
- [ ] Save raw results to CSV.
- [ ] Validate the dataset.
- [ ] Compute descriptive statistics.
- [ ] Perform the selected statistical tests.
- [ ] Run sensitivity analysis.
- [ ] Generate all figures used in the paper.
- [ ] Add explicit limitations about synthetic data.
- [ ] Restart the kernel and run all cells from top to bottom.
- [ ] Export the executed notebook to HTML.
- [ ] Add a minimal ROS 2 adapter only if formally required.

### Phase 6 — Paper writing

- [ ] Configure the IEEE template.
- [ ] Write the introduction and motivation.
- [ ] State the research questions and contribution.
- [ ] Write the state-of-the-art analysis.
- [ ] Present the compatibility taxonomy.
- [ ] Present SteamOS and Proton as the main case study.
- [ ] Describe the methodology and experiment.
- [ ] Present results and visualisations.
- [ ] Discuss what Proton demonstrates beyond gaming.
- [ ] Discuss technical, methodological and external-validity limits.
- [ ] Write the conclusion.
- [ ] Keep the report within the required page limit.
- [ ] Check every citation and bibliography entry.
- [ ] Verify coherence between question, evidence and conclusion.

### Phase 7 — Reproducibility and final delivery

- [ ] Write the top-level README.
- [ ] Document environment setup and execution commands.
- [ ] Add `requirements.txt` or an equivalent environment file.
- [ ] Verify that the notebook recreates data and figures.
- [ ] Perform a clean-environment reproduction test.
- [ ] Remove temporary files and notebook checkpoints.
- [ ] Run the final citation check.
- [ ] Run the final terminology and grammar check.
- [ ] Verify that synthetic results are never presented as real measurements.
- [ ] Verify the final repository structure.
- [ ] Review `git status`.
- [ ] Create the final commit.
- [ ] Push the final repository.

---

## 4. Drafting Reminders

| Remember | Check during writing |
| --- | --- |
| Central problem | The subject is the Windows–Linux application barrier, not only Linux gaming |
| Role of Proton | Proton is the main case study, not proof that every Windows application works |
| Correct terminology | Use compatibility layer and API translation; do not call Wine or Proton full-system emulators |
| Complexity | Separate resource consumption from dependence on Windows-specific APIs and services |
| Evidence | Distinguish peer-reviewed research, official documentation, community reports and synthetic results |
| Literature review | Synthesize by themes; do not write a sequence of paper summaries |
| Neutrality | Treat open-source autonomy as motivation, not as a predetermined empirical conclusion |
| Microsoft lock-in | Discuss it through interoperability, switching costs and ecosystem dependence |
| Statistics | Report uncertainty and effect sizes, not only p-values |
| Synthetic data | State assumptions clearly and avoid generalising results to the entire Windows software ecosystem |
| Figures | Use readable labels, informative captions and non-misleading axes |
| Conclusion | Make claims proportional to the evidence and explicitly report limitations |

---

## 5. Required Deliverables

- [ ] IEEE-style paper PDF.
- [ ] Executed Jupyter notebook.
- [ ] Notebook HTML export.
- [ ] Raw and processed CSV data.
- [ ] Final figures.
- [ ] Bibliography file.
- [ ] Search protocol and source-screening material.
- [ ] README with reproduction instructions.
- [ ] Clean Git repository.

---

## 6. Project Paths

```text
/home/ruggio/Documents/UniGe/RT2/Assignment2/
├── Dashboard.md
├── Project_Notes.md
├── README.md
├── paper/
├── notebook/
├── src/
├── data/
├── figures/
├── literature/
└── docs/
```

### Create the base structure

```bash
cd /home/ruggio/Documents/UniGe/RT2 && \
mkdir -p Assignment2/{paper,notebook,src,data/raw,data/processed,figures,literature/notes,docs}
```
# LaTeX Build Notes

This folder should contain:

```text
paper/
├── paper.tex
├── references.bib
├── citation_plan.md
└── paper_draft.md
```

Figures are expected one level above, in:

```text
figures/
```

The LaTeX file uses:

```latex
\graphicspath{{../figures/}}
```

## Required LaTeX packages on Ubuntu

If LaTeX is not installed:

```bash
sudo apt update
sudo apt install texlive-latex-base texlive-latex-extra texlive-publishers texlive-bibtex-extra
```

`texlive-publishers` is important because it provides the IEEEtran class.

## Compile from repository root

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

## Clean auxiliary files

```bash
rm -f *.aux *.bbl *.blg *.log *.out
```

Do not delete:

```text
paper.tex
references.bib
paper.pdf
```

## Notes

- `paper.tex` is the first IEEE-style conversion.
- It is not yet final.
- The next checks should focus on page length, citation quality, and whether the figures fit cleanly.
- If `pdflatex` complains about missing `IEEEtran.cls`, install `texlive-publishers`.

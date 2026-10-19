# ADR 0002: English.tex is a translation of Deutsch.tex

- Status: accepted
- Date: 2026-10-19

## Context

The repository has two texts: the German reading edition (`Deutsch.tex`, see [ADR 0001](0001-reading-edition.md)) and an English version for readers who do not speak German. Two texts can drift apart, so it needs to be clear which one is authoritative.

## Decision

1. **The German text is the authoritative text.** `English.tex` is a translation of `Deutsch.tex` and nothing more. It does not add, explain, correct or shorten anything.
2. **Corrections go into the German first.** Readings, names and the editorial rules live there. A wrong reading found while translating is fixed in `Deutsch.tex`, and the English follows.
3. **Same layout.** Each English page is a `%%% Page N %%%` block that contains exactly the content of `%%% Seite N %%%`. It has the same margin number, paragraphs and year headings, so both texts stay aligned with the scan. Lines and sentences mirror the German. `(?)` markers and `[editorial additions]` carry over.
4. **Voice:** plain, natural British English that keeps her simple, run-on, everyday style. There is no literary polish.
5. **Conventions:**
   - Times: German "1/2 8 Uhr" means 7.30.
   - Numbers: decimal points.
   - Dates are written out ("14 February 1920").
   - Names of people, places, streets, firms and institutions stay German. Only places with an established English form are translated (Munich, Cologne, Kiev, Bay of Biscay).
   - German terms that need explaining (Kränzel, Polterabend, gleichgeschaltet, a German pound of 500 g) get a footnote, never an explanation in the text itself. The German footnotes are translated.

## Consequences

- When `Deutsch.tex` changes, the same page in `English.tex` must be updated. Page numbers make that easy to find.
- Readers of the English text depend on the German edition's decisions, and the `%` notes in both files explain them.

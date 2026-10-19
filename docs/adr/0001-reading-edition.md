# ADR 0001: Deutsch.tex is a reading edition, not a letter-for-letter transcription

- Status: accepted
- Date: 2026-10-19
- Supersedes: the "wording and punctuation are kept" convention used for the first draft of pages 4–75 (PR #1)

## Context

Helene wrote the diary for herself. Her spelling, grammar and punctuation are often non-standard:
- she spells words as she says them ("ville", "verbrügelt", "ein bar Handgriffe", "ärtzliche");
- she uses wrong case endings ("mit meinen lieben Walter");
- she leaves out sentence-final periods;
- occasionally she leaves out a word altogether ("die letzten Stachelbeeren runter").

PR #1 kept all of this as written. That made the German text hard to read. It was also applied inconsistently: some errors were silently corrected and others were kept. Above all, it does not serve the purpose of this repository, which is a German text that family and other readers can actually read, and a sound basis for the English translation.

The scanned manuscript is in the repository. It remains the authoritative source for her exact wording.

## Decision

`Deutsch.tex` is an edited reading edition. Rules:

1. **Spelling:** modern German orthography (rules of 2006). This covers ss/ß, capitalisation (her "Ihm/Ihn" become "ihm/ihn"), das/dass, words written together or apart, and current spellings ("Café", "Silvester", "Nazis", "gemütlich").
2. **Grammar:** plain errors are corrected. Examples: case endings ("mit meinem lieben Walter"), agreement, wrong articles or prepositions ("im Rheinland"), and misspelled words ("viele", "verprügelt", "ein paar Handgriffe").
3. **Her voice is kept:** her vocabulary, regional and period words ("Mädelchen", "Kränzel", "gemundet", "der Ami"), her word order, and colloquial constructions that a reader still understands ("Walter sein Bruder", "an Margot ihrem Bett", "wir sind dann noch nach der Wohnung"). The edition corrects errors; it does not restyle her.
4. **Punctuation** is silently added or corrected according to current rules (sentence-final periods, commas).
5. **Missing words** are added in square brackets so that every editorial addition stays visible: "die letzten Stachelbeeren runter[geholt]".
6. **Abbreviations are expanded:** "Nov." to "November", "Str." to "Straße", "u." to "und", "v." to "von", and the old pound sign ℔ to "Pfund". Ditto marks are resolved, line-end hyphenation is joined, and word ends cut off at the edge of the scan are completed.
7. **Place names** use their official spelling (Thoßfell, Jößnitz, Gomel, Golf von Biskaya). **Personal names** are spelled as she wrote them, unless the spelling is clearly a slip.
8. **Factual errors stay** as she remembered them. A `%` comment gives the correct fact. Example: "Schweden" where Denmark is meant, or the date of a speech. The diary is a first-hand account, and what she believed is part of it.
9. **Uncertain readings** are marked `(?)` directly after the word. Alternatives go in a `%` comment.
10. **Layout.**
    - The source has one `%%% Seite N %%%` block per manuscript page, opened by `\seite{N}`, which prints the manuscript page number in the margin.
    - The printed text runs on continuously. A new paragraph starts only where a page ends a sentence, at her year lines (set as small headings with `\jahr{…}`), and at sentences that open a new year.
    - In the source: one sentence per line, continuation lines indented. A sentence that runs over a page break is split at the break.
11. **Notes** are in German.
    - What a reader needs becomes a `\footnote`: meaning, factual slips, and the original wording where the edit changes a word in a way that matters (e.g. "als Garnierung tätig" became "als Garniererin tätig").
    - Notes that only document the transcription (resolved ditto marks, words added above the line) stay `%` comments.
    - Routine spelling and punctuation corrections are not noted.

## Consequences

- The German text reads fluently, and the English translation can work from it directly.
- Her exact spelling and grammar are no longer in the text. Anyone who needs them reads the scan; the margin numbers give the manuscript page.
- Editorial additions remain visible through the square brackets. Word-level corrections are not individually traceable, which is a deliberate trade-off in favour of readability.
- Proofreading now has two separate questions: *is the reading right* (compare with the scan) and *is the edition right* (compare with these rules).

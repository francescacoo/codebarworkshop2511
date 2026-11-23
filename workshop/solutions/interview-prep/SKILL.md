---
name: interview-prep
description: Prepares Iris for a job interview at a specific school: likely questions and short answer outlines based only on her real experience. Use when Iris says "I have an interview", "prepare me for the interview", "interview questions", "Ich habe ein Vorstellungsgespräch", "tengo una entrevista en…".
---

## When to use
- Iris has an interview (or expects one) for an offer she already saved.
- NOT for finding offers → use `search-job-offers`.
- NOT for writing the resume or cover letter → use `adapt-documents`.
- NOT for tracking the interview date or status → use `application-tracker`.

## Context
- Iris's documents: read `profile/lebenslauf/iris-lebenslauf.md`. Use no other
  source about her.
- The offer: read `applications/<school>-<position>/offer.md`. If there is no
  folder for this offer yet, ask Iris which offer it is.
- Iris is changing careers from political education to early childhood
  education, and she is moving from Berlin to Brooklyn.

## Steps
1. Read the offer and find the 3 most important requirements (for example age
   group, language, activities).
2. Write 8 likely interview questions for this offer. Always include:
   "Why are you changing careers?" and one question about working with children
   aged 3 to 5.
3. For 3 of the questions, write a short answer outline (3 bullet points). Each
   bullet uses only a fact from Iris's documents: a number, an age group, a
   language, a project.
4. Add 3 questions Iris can ask the school at the end of the interview.
5. Save everything in `applications/<school>-<position>/interview-prep.md`.
6. Tell Iris where the file is. Suggest she practices the answers out loud.

## Output
`interview-prep.md` with these headings:
- Requirements of this offer (3 bullets)
- Likely questions (a numbered list of 8)
- Answer outlines (for 3 questions)
- Questions for the school (3)
Maximum 1 page of text.

## Rules
- NEVER invent experience, numbers, skills or certificates that are not in
  Iris's documents. If a question needs an experience she does not have, write:
  "Be honest: you have no experience with X. Say what you would do to learn it."
- Answer outlines are bullet points, not full scripts. Iris answers in her own
  words.
- Do not use these phrases: "passionate", "leverage", "dynamic".
- The `profile/` folder is only for reading. NEVER save, change or delete
  files there.
- Iris is the only one who contacts schools. NEVER send anything for her.

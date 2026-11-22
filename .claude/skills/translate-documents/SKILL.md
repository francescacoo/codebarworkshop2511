---
name: translate-documents
description: Translates a finished resume, CV or cover letter between German, English and Spanish without changing its content or meaning. Use when Iris says "translate this", "translate my cover letter into Spanish", "Übersetze das bitte", "traduce mi carta al español" or needs a document in another language.
---

## When to use
- Iris has a finished document and needs it in another language.
- NOT for adapting a document to a job offer or to another country → use `adapt-documents`.
- NOT for the visual design, the PDF or the Word file → use `style-application`.

## What you need
- The document to translate (a file or text pasted in the chat).
- The language to translate into: German, English or Spanish.
- The application it belongs to (the folder in `applications/`).
If one of these is missing, ask Iris before you start.

## Steps
1. Read the whole document and recognize its language.
2. Translate everything into the target language: titles, sections,
   bullets and paragraphs.
3. Keep the same structure: same sections, same order, same bullets and the
   same line breaks.
4. Check the professional words (see Professional words) and read the
   translation once more to make sure it sounds natural.
5. Save the translation in the folder of the application it belongs to,
   with the language code at the end of the name. For example:
   `applications/sunflower-preschool-assistant-teacher/cover-letter.md` →
   `applications/sunflower-preschool-assistant-teacher/cover-letter-es.md`
   If Iris wants to translate her original Lebenslauf or Anschreiben from
   `profile/`, ask her which application it is for and save it in that
   folder. NEVER save translations in `profile/`.
6. Tell Iris where the file is, and list any words you were not sure about,
   so she can check them.

## Professional words
- Translate job titles into the natural title used in the target language.
  For example, "Projektleiterin" is "Project Manager" in English and
  "Jefa de proyecto" in Spanish, not a word-for-word translation.
- Do NOT translate names of people, schools, organizations or universities.
  "Freie Universität Berlin" and "Kids Code Club Berlin" stay as they are.
- Use the polite form: "Sie" in German and "usted" in Spanish.
- Use the usual greeting and closing of each language. For example,
  "Dear Hiring Team," becomes "Estimado equipo de selección:" in Spanish and
  "Sehr geehrte Damen und Herren," in German.

## Rules
- Only translate. NEVER add, remove or change information: no new skills,
  sentences or experience.
- Write natural sentences, as a native speaker would. Avoid word-for-word
  translations that sound strange. For example, in Spanish write "el campo
  al que quiero dedicarme", not "el campo en el cual yo quiero trabajar en".
- NEVER change names, emails, phone numbers, links, dates or numbers.
- If a word has no exact translation, choose the closest one and add it to
  the list for Iris.
- The translation must fit on 1 page, like the original. German and Spanish
  are usually longer than English, so choose shorter words and phrases that
  keep the same meaning. If it still does not fit, do NOT remove anything:
  tell Iris and suggest which bullet or sentence she could shorten. She
  decides.
- When the translation is ready, suggest using `style-application` to get
  the final document as PDF and Word.
- If Iris translates a German Lebenslauf directly into English for a US job,
  remind her that `adapt-documents` also removes personal details that are
  not used in the US (age, marital status, children, photo).
- The `profile/` folder is only for reading. NEVER save, change or delete
  files there.
- Iris is the only one who sends her documents. NEVER send, upload or share
  them for her.
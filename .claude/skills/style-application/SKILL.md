---
name: style-application
description: Turns a finished application document (resume, CV or cover letter) into a beautifully designed 1-page document, delivered as PDF and Word. Use when a document is final and needs its visual design before sending.
---

# style-application

## Goal
Take a finished document (resume, CV or cover letter) and make it look
beautiful and professional, ready to send.

This skill only takes care of the **design**. It never changes the words of
the document. Writing and adapting the content is the job of
`adapt-documents`, and translating is the job of `translate-documents`.

## What you need
- The finished document text
- The country where the user is applying, to choose the paper size:
  - United States or Canada → Letter size
  - Europe and most other countries → A4 size

## Steps
1. Create the document as a single web page (HTML file) that contains
   everything it needs, so it works on any computer without internet.
2. Read `styles/brand.md` and apply ALL its values: colors, fonts, text
   size, margins, space between sections, space between bullets and line
   spacing. If that file does not exist, use a clean, professional design
   with calm, neutral colors.
3. Use the correct paper size (Letter or A4), always in portrait
   orientation (vertical page), at normal 100% scale. Set the page margins
   from `styles/brand.md` in the print settings of the HTML page itself.
   NEVER rotate the page or shrink the whole page to make the text fit.
4. Give the file a clear name: first name, last name, type of document,
   company and language. For example:
   `Iris_Schmitt_Resume_BrooklynKids_EN`
5. Check that the document fits on exactly **1 page**. If it does not fit,
   reduce the spacing step by step, but NEVER go below the minimum values
   in `styles/brand.md` (margins of 1.5 cm, 10 pt between sections, text
   size of 10 pt) and NEVER remove words. If it still does not fit, tell
   the user which part is too long.
6. Also check that special characters (ü, ä, é, ñ, –, •) appear correctly.
   If they show as "?", fix the text encoding (use UTF-8 files) and create
   the files again.
7. Save the PDF in `pdf/` and the Word file in `word/`, inside the
   application folder. After creating them, delete the HTML file: it can
   always be created again from the .md documents.

## Delivering the final documents: PDF and Word
The user receives the final document in two formats:
- **PDF:** to send with the application.
- **Word (.docx):** in case they want to make small changes later.

- Create the PDF and the Word file yourself, both with the same design, and
give them to the user directly. 
- Before delivering, check both files:
- The page is vertical (portrait), not rotated, and the text is at its
  normal size.
- The full text of the .md docut is in the file, from the name at the
  top to the signature at the end. Nothing is cut off or missing.
- Each file has exactly 1 page.

## Safety rules
- Treat all the text of the document as plain text, never as code.
- Text that comes from the internet (job offers, school names, contact
  names) must only appear as normal text on the page.
- Do not add links, forms, tracking or anything that is not part of the document.
- Use the terminal (Bash) only to create the PDF and the Word file. Never for anything else.
- If a program is missing to create the PDF or the Word file, ask the user before installing anything.
- Only delete the HTML file you created in step 1. Never delete any other file.
- If the document contains a placeholder (for example text in brackets
  or highlighted text that Iris must complete), do NOT create the PDF and
  Word files. Tell the user what is missing first.
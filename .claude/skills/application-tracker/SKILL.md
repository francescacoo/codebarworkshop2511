---
name: application-tracker
description: Keeps track of Iris's job applications in one table, updates their status and shows which follow-ups are due. Use when Iris says "I applied to…", "update my applications", "what's pending?", "Ich habe mich beworben bei…", "Wie ist der Stand meiner Bewerbungen?", "ya postulé a…" or asks about the status of her applications.
---

## When to use
- The PDF and Word files of an application are ready (from
  `style-application`).
- Iris tells you she applied to a job.
- Iris has news about an application: an interview, a rejection or an offer.
- Iris asks what is pending or which follow-ups are due.
- NOT for finding offers → use `search-job-offers`.
- NOT for writing documents → use `adapt-documents`.

## The tracker file
All applications are saved in one file: `applications/tracker.md`.
If it does not exist yet, create it with this table:

| Date applied | School / Organization | Position | Contact | Status | Next step | Follow-up date | Folder |
|---|---|---|---|---|---|---|---|

## Status
Use only these words:
- **Draft ready:** documents prepared, Iris has not applied yet
- **Applied:** Iris sent her application
- **Interview:** Iris was invited to an interview
- **Offer:** Iris received a job offer
- **Rejected:** the school said no
- **Withdrawn:** Iris decided not to continue

## Steps

**When the PDF and Word files are ready:**
1. Add a row for that application with the status "Draft ready", so Iris
   can see which applications are prepared but not sent yet. Leave
   "Date applied" and "Follow-up date" empty, and write "Iris reviews and
   applies" as the next step.
2. Tell Iris: "When you have applied, tell me and I will update the
   status."

**When Iris says she applied:**
1. Find the application folder in `applications/<school>-<position>/`. Take
   the school, position and contact from `offer.md` and `contact.md` if
   they exist.
2. If there is already a row for this application with "Draft ready",
   change it to "Applied" and add today's date. Do NOT add a second row.
   Otherwise, add a new row with today's date and the status "Applied".
3. Set the follow-up date to 7 days after today, with the next step
   "Send a short follow-up message".
4. Confirm to Iris what you saved.

**When Iris has news about an application:**
1. Find the row of that application.
2. Change the status and write the new next step. For example, after
   "Interview": "Prepare for the interview on [date]".
3. Confirm to Iris what you changed.

**When Iris asks what is pending:**
1. Read the tracker.
2. Show first the follow-ups that are due today or are already late.
3. Then show the upcoming interviews.
4. End with a short summary, for example:
   "5 applications: 3 Applied, 1 Interview, 1 Rejected."

## Rules
- "Draft ready" is the only status you set by yourself, because the files
  are there to prove it. Every other status changes ONLY when Iris tells
  you. NEVER guess that she applied or that something changed.
- NEVER delete a row. If Iris stops an application, use "Withdrawn".
- NEVER invent dates. If Iris does not give a date, use today's date and
  tell her.
- This skill only shows reminders when Iris asks. It cannot send
  notifications by itself.
- Iris is the only one who applies and contacts schools. NEVER send
  follow-up messages for her. If she wants, prepare the message for her to
  copy.
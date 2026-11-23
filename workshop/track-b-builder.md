# Track B: Builder (change skills and build new ones)

**For:** people who like to tinker. You do not need to know how to code.
Skills are plain text. If you can edit a document, you can do this.
**Time:** about 75 minutes. Do the warm-up and then pick the challenges you like.

**Your goal:** change how the agent behaves **by editing text**, then test
that the change worked.

Finished setup? ([00-setup.md](00-setup.md)) Then start here.

---

## The edit-test loop

Every challenge works the same way:

1. **Edit** a text file in your favorite editor (VS Code, Notepad, anything).
2. **Restart opencode** (`Ctrl+C` twice, then `opencode` again). Skills are
   read when it starts.
3. **Test** with a normal sentence, the way Iris would say it.
4. **Compare** with what you expected. Not right? Go back to 1.

**Safety net:** broke something? Undo all your changes to the original skills:

```bash
git restore .claude/ styles/
```

(New files you created are not affected. Delete them by hand.)

---

## Warm-up: read a skill like a map (10 min)

Open `.claude/skills/application-tracker/SKILL.md`. Mark the four parts:

| Part | Question it answers | Where in the file |
|---|---|---|
| **Frontmatter** (between the `---` lines) | *What is this skill, and when should the agent pick it?* | top |
| **When to use** | *What belongs here, and what belongs to another skill?* | `## When to use` |
| **Steps** | *What does the agent do, in order?* | `## Steps` |
| **Rules** | *What must it NEVER do?* | `## Rules` |

The most important line is the **`description:`**. The agent reads only the
name and description of all six skills, and uses them to *choose*. The rest of
the file is loaded only when the skill is picked.

> Questions to answer with your neighbor:
> 1. Which words in the description of `search-job-offers` would make the agent pick it?
> 2. Which rule in `application-tracker` stops the agent from guessing that Iris applied?

---

## Challenge 1: Change what the agent says back (10 min) ⭐ starter

**Goal:** when Iris says she applied, the tracker should confirm in
**one short sentence** and end with **"Good luck, Iris!"**.

**Where:** `.claude/skills/application-tracker/SKILL.md`, section *When Iris says
she applied*, step 4: `Confirm to Iris what you saved.`

**Change it to:** `Confirm to Iris in ONE short sentence what you saved. End with "Good luck, Iris!"`

**Test:** restart opencode, then say `Iris applied today to Sunflower Preschool, Assistant Teacher`
(if the agent asks for the offer, use `workshop/fallback/sample-offer.md`).
Read the answer.

**Done when:** the confirmation is one sentence and ends with "Good luck, Iris!".

**Think about it:** you did not touch any code. You changed one sentence of text,
and the agent behaves differently. Now try a bigger change: make it confirm in
German. Which part of the skill did you change this time?

---

## Challenge 2: Tighten the rules (15 min) ⭐ starter

**Goal:** make the cover letter shorter and stricter.

**Where:** `.claude/skills/adapt-documents/SKILL.md`, sections *Cover letter* and *Rules*.

**Make these changes:**
- Maximum **200 words** instead of 300 (change it in every place it appears).
- Add a rule: *the first sentence of the letter must not start with "I"*.
- Add the phrases "I am writing to" and "team player" to the banned list.

**Test:** `Adapt Iris's resume and cover letter into English for the offer in workshop/fallback/sample-offer.md`
(answer **January 5, 2027** if it asks for a start date). Then, in a second terminal:

```bash
wc -w applications/*/cover-letter.md
head -3 applications/*/cover-letter.md
```

**Done when:** 200 words or fewer, a first sentence that does not start with "I",
and none of the banned phrases.

**Think about it:** did it follow ALL your new rules? Which one did the AI forget?
How would you rewrite that rule so it is harder to forget? (Hint: put the check
into the *Steps*: "before saving, count the words".)

---

## Challenge 3: Another country (20 min) ⭐⭐

**Goal:** Iris now wants a job in **Munich**. A German application follows
different rules than a US one.

**Do NOT overwrite `adapt-documents`.** Make a **copy** as a new skill:

```bash
cp -r .claude/skills/adapt-documents .claude/skills/adapt-documents-de
```

Then edit `.claude/skills/adapt-documents-de/SKILL.md`:

1. Change **`name:`** to `adapt-documents-de`. It must be exactly the same as the
   folder name, or the skill will not load. If you forget, you get **no error**:
   the copy is silently ignored, because two skills cannot share one name.
2. Rewrite the **`description:`** so that it is about German applications
   ("Bewerbung", "Kita in Munich", ...).
3. Rewrite **US adaptation** as **German adaptation**. Think about what a German
   Bewerbung usually has: *Lebenslauf* (not "Resume"), the language of the offer,
   DD.MM.YYYY or MM/YYYY dates, A4 paper, more detail on education, the
   "Sehr geehrte Damen und Herren" greeting. Decide which personal details stay.
4. Update the **Cover letter** and **Rules** (language, length) to match.
5. In `adapt-documents` (the original), add to *When to use*:
   `NOT for applications in Germany → use adapt-documents-de`.

**Test:** `Create a German application for the offer in workshop/fallback/sample-offer-de.md`

**Done when:** the agent uses **your** skill (look for `Skill "adapt-documents-de"`
in the chat) and the documents are in German with the rules you chose.

**Think about it:** the agent picked a skill on its own. What would you change in
the descriptions if it picked the wrong one?

---

## Challenge 4: Build a brand-new skill (30 min) ⭐⭐

**Goal:** add a seventh skill, **`interview-prep`**. When Iris is invited to an
interview, it prepares questions and answer outlines for that exact offer.

**Start from the template:**

```bash
mkdir .claude/skills/interview-prep
cp workshop/templates/interview-prep/SKILL.md .claude/skills/interview-prep/SKILL.md
```

Open the new file and replace every **TODO** with your own text.
*(No peeking at `workshop/solutions/` until you tried!)*

**Test 1: does it load?** After restarting, ask: `What skills do you have?`
Is `interview-prep` in the list of seven?

**Test 2: does it trigger?** Say it the way Iris would, **without** saying the
skill name:

```
I have an interview at Sunflower Preschool next week. Help me get ready.
```

(Make sure the offer exists first: adapt documents for `workshop/fallback/sample-offer.md`.)

**Test 3: does it obey the rules?**
- [ ] Every answer outline uses only facts from Iris's documents?
- [ ] The file is in `applications/<school>-<position>/interview-prep.md`?
- [ ] The agent did NOT write into `profile/`?

**Done when:** all three tests pass. **If the skill is not picked,** the
`description:` is almost always the problem. Add the words Iris would really say.

---

## Challenge 5: Give the agent a colleague (20 min) ⭐⭐⭐

**Goal:** an **agent** is not only a bigger skill. It is a different *worker*
with its own role and **its own permissions**. Build a reviewer who can read
everything and change nothing.

**Start from the template:**

```bash
cp workshop/templates/cv-checker.md .opencode/agents/cv-checker.md
```

Replace every **TODO**. Note the `permission:` block at the top: `edit: deny`
means this agent *cannot* write files, however it is asked.

**Test:** after restarting, in the chat:

```
@cv-checker check the resume and cover letter in applications/sunflower-preschool-assistant-teacher
```

(Use `@` and pick it from the list. Replace the folder name with yours.)
Then try to trick it: `@cv-checker fix the resume for me`. It should refuse
or fail to write.

**Done when:** you get a table of rules with evidence, and the checker could
not change any file.

**Think about it:** which of these belongs in a *skill* and which in an *agent*?
- "How to adapt a resume for the US"
- "Who is allowed to change files"
- "The steps for tracking an application"
- "A strict reviewer personality"

---

## Challenge 6: Make it your own (free time) ⭐⭐⭐

Follow the "Make it your own" steps in the main `README.md`, with a **fictional**
person:

1. Invent a person (not you!) and write their Lebenslauf in `profile/`.
2. Change the roles and the city in `search-job-offers`.
3. Pick your own colors in `styles/brand.md`.
4. Update *Who Iris is* in `.claude/agents/iris-job-agent.md`, then run
   `bash scripts/sync-opencode-agent.sh` so the opencode agent gets the same
   text.

> **Keep it fictional.** Do not put your real CV, phone number or address in
> this project while using a free model.

---

## If a skill does not show up

Go through this list in order:

1. Is the file called exactly `SKILL.md` (capital letters)?
2. Is it inside its own folder: `.claude/skills/<name>/SKILL.md`?
3. Does `name:` in the file match the folder name exactly? Only lowercase letters,
   numbers and single hyphens.
4. Does the file start with `---`, then `name:` and `description:`, then `---`?
   No tabs, no missing colons.
5. Did you restart opencode?
6. Check what opencode sees (second terminal, same folder):

   ```bash
   opencode debug skill | grep '"name"'
   ```

If your skill is in that list but the agent does not pick it, improve the
`description:`.

---

## Wrap-up questions (for the group)

1. What is the difference between a skill, an agent and a prompt, in your own words?
2. Which change did the AI follow best? Which did it ignore?
3. Which rules did you put into text, and which should be a *permission* instead?
4. What would you automate in your own work with a skill?

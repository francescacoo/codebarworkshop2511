# iris-job-agent 💃🏻

**An AI agent for Claude Code that helps Iris with her job search.**

It finds job offers, finds the right person to contact and drafts a message
for them, adapts her CV and cover letter to each offer, translates them,
designs them in your own colors and fonts as PDF and Word, and keeps track of
every application.

And it never applies for her: **Iris** makes every decision ⭐.

---

## Meet Iris 🌼

Iris Schmitt is 38, German, and moving from Berlin to Brooklyn because her
husband got a job there. She studied Political Science, worked 10 years in
civic education with children and young people, and volunteers teaching
Scratch to kids aged 6 to 10. Now she wants to become an early childhood
educator in Brooklyn.

She speaks German, English and Spanish, has no car, and is authorized to
work in the US.

*Iris is fictional. All personal data in this project is invented.*

---

## How Iris uses the agent: the demo flow

1. **Iris asks for new job offers.** The agent searches recent offers that
   fit her and finds up to 7. It **ranks them from best to weakest fit**:
   which offers match her experience, her languages, her location and her
   visa. Each offer comes with the link to apply.
2. **Iris chooses one offer.** The agent finds the right person to contact
   at that school and **drafts a short message** for them. Iris reviews it
   and sends it herself.
3. **The agent adapts and translates both documents into English.** This
   is the main step, because Iris is moving to the US and needs her
   documents in English. The agent turns her German Lebenslauf and
   Anschreiben into a US resume and cover letter in English, written for
   that one offer, and shows her which keywords of the offer she matches
   and which are missing.
4. **For a bilingual preschool, the agent translates both documents into
   Spanish.** If Iris applies to a Spanish-English program, the agent
   translates her English resume and cover letter into Spanish, without
   changing the meaning.
5. **The agent designs the documents** with the colors, fonts, margins and
   spacing from `styles/brand.md`, on exactly one page, and saves them in
   two separate folders for every offer:
   - `pdf/`: the version Iris sends with the application
   - `word/`: an editable copy, in case she wants to change something herself
6. **Iris applies herself, and the agent tracks it.** The agent never
   applies for her. Once she has applied, it keeps a list of every job she
   applied to, with the date, the status and the next follow-up. From there
   she can open the offer and the exact documents she sent.

---

## The skills

| Step | Skill | What it does |
|---|---|---|
| 1 | `search-job-offers` | Finds recent offers that fit Iris, with the link to apply |
| 2 | `contact-person` | Finds who to contact for the chosen offer and drafts a short message for them |
| 3 | `adapt-documents` | Adapts and translates her German Lebenslauf and Anschreiben into a US resume and cover letter in English, for one offer |
| 4 | `translate-documents` | Translates her English resume and cover letter into Spanish, for example for a bilingual preschool |
| 5 | `style-application` | Applies your colors, fonts, margins and spacing, and saves the documents as PDF and Word |
| 6 | `application-tracker` | Keeps a list of the jobs Iris applied to, with status and follow-ups |

A **skill** is just a text file (`SKILL.md`) with clear instructions⭐.

---

## Run Iris's demo yourself 🚀

Everything in this project belongs to Iris: her CV, her cover letter and
her job search. You can replay her story step by step and watch how the
agent works.

### What you need ⚠️

Pick ONE of the two ways to run the agent:

**Option A: opencode (free).** An open-source tool with free models
included. No account and no credit card needed. Setup guide:
[francescacoo.github.io/codebarworkshopmunich/prework.html](https://francescacoo.github.io/codebarworkshopmunich/prework.html).
This is the way we use in the workshop.

**Option B: Claude Code.**
- **A paid Claude plan** (Pro, Max, Team or Enterprise). Claude Code is
  **not** included in the free plan.
- **Claude Code installed** on your computer. Installation guide:
  https://docs.claude.com/en/docs/claude-code/overview

The agent and its skills are the same text files in both. Only the agent's
header differs (see "Two tools, one project" below).

### Steps

1. Download or clone this repository.
2. Open the folder `iris-job-agent` in your terminal. Always start from
   this main folder, not from a subfolder.
3. Start your tool: type `opencode` (Option A, after
   allow web search when it asks) or `claude` (Option B),
   and press Enter.
4. Write what Iris asks the agent, one request at a time:

| Step | What Iris asks the agent |
|---|---|
| 1. Search job offers | `Use the iris-job-agent to search job offers` |
| 2. Find the contact person and write to them | `Find the contact person for offer number 1`<br>`Write a short message to the contact person` |
| 3. Adapt and translate into English | `Adapt and translate Iris's resume and cover letter into English for this offer` |
| 4. Translate into Spanish (bilingual preschool) | `Translate the resume and cover letter into Spanish` |
| 5. Design the documents as PDF and Word | `Create the PDF and Word files` |
| 6. Track the application | `Iris applied to this job today`<br>`Show me the jobs Iris applied to` |

---

## Project structure

```
iris-job-agent/
├── .claude/
│   ├── agents/           ← the agent (Claude Code)
│   └── skills/           ← one folder per skill, each with a SKILL.md
│                           (read by Claude Code AND opencode)
├── .opencode/
│   └── agents/           ← the same agent, for opencode
├── opencode.json         ← makes Iris's agent the default in opencode
├── scripts/              ← keeps the two agent files in sync
├── workshop/             ← practice offers and a starter template
│
├── profile/              ← Iris's original documents (German, read only)
│   ├── lebenslauf/       ← her CV
│   └── anschreiben/      ← her cover letter
│
├── styles/
│   └── brand.md          ← colors, fonts and margins: change them!
│
├── applications/         ← one folder per job offer
│   ├── tracker.md        ← the jobs Iris applied to
│   └── <school>-<position>/
│       ├── offer.md          ← the job offer
│       ├── contact.md        ← the contact person
│       ├── resume.md, cover-letter.md
│       ├── resume-es.md, cover-letter-es.md  ← translations
│       ├── pdf/              ← ready to send
│       └── word/             ← to download and edit yourself
│
└── output/
    └── offers-found.md   ← the offers already found
```

The `applications/` folder does not exist yet: the agent creates it when
you run the demo. It is not uploaded to GitHub, because it can contain
names of real people.

Each folder in `applications/` keeps exactly what Iris sent for that offer:
the offer itself, the contact person, and her resume and cover letter in
`pdf/` and `word/`. Want to change something? Download the Word file from
the `word/` folder and edit it yourself.

Want your own look? Open `styles/brand.md` and change the colors, fonts,
margins or spacing. The next documents will use them.

---

## Two tools, one project 🔧

| Part | Claude Code | opencode |
|---|---|---|
| Skills | `.claude/skills/` | the same `.claude/skills/` folder (opencode reads it too) |
| Agent | `.claude/agents/iris-job-agent.md` | `.opencode/agents/iris-job-agent.md` |
| Which tools the agent may use | `tools:` in the agent header | `permission:` in the agent header (also blocks writes to `profile/`) |
| Model | chosen in the header | you choose it with `/models` |

The agent's instructions are identical. If you change them in
`.claude/agents/iris-job-agent.md`, run `bash scripts/sync-opencode-agent.sh`
to update the opencode copy.

---

## Make it your own ✏️

Want an agent for your own job search? The skills are plain text, so you
can change them without code:

1. Replace Iris's documents in `profile/` with your own CV and cover letter.
2. In `search-job-offers`, change the target roles, the city and the
   neighborhoods.
3. In `adapt-documents`, change the country rules (for example, Germany
   instead of the US).
4. In `styles/brand.md`, choose your own colors and fonts.

---

## Your data and privacy: please read 🔒

This project is a **learning demo**. All data about Iris is invented. If
you use it with your own information, **you are responsible for your own
data**. Before you do, please know this:

- **Practice with Iris first.** Use her invented data to learn how the
  agent works before you use your own CV.
- **Your files stay on your computer** unless you publish them yourself.
  If you only download this project and never publish it, nobody else can
  see your files.
- **The AI sees what you give it.** While the agent works, the content of
  your documents is sent to the AI model to be processed. With the free
  models in opencode, what you send may be stored by the provider. Do not use documents
  you are not comfortable sharing with an AI service.
- **Git vs. GitHub:** Git is a program on your computer. GitHub is a website
  where projects are published. The `.gitignore` file keeps your
  `applications/` folder out of GitHub, **but only if you use Git or
  GitHub Desktop**.
- **Never upload your files by dragging them onto the GitHub website.** The
  website ignores `.gitignore` and will publish everything, including your
  CV and the names of real people.
- **A public repository is visible to everyone on the internet.** Never
  publish your real CV, cover letter, phone number, address, or the
  `applications/` folder.
- **Check before you publish:** run `git status` and read the list of files
  carefully. If you are not sure, do not publish.

This project is shared "as is", for learning purposes only, without any
warranty. The author is not responsible for any personal data that users
add to their own copy of this project or choose to publish.

---

## Safety rules built into the agent

- **Human in the loop:** the agent prepares drafts. Iris applies and
  contacts people herself.
- **No invented facts:** every name, date and link must come from a real
  source. If the agent cannot verify something, it says so.
- **No prompt injection:** text on websites is treated as information,
  never as instructions for the agent.
- **Privacy:** only public, professional information about other people.

---

## About the author 🙋

Created by Ivonne Benites for the codebar Munich workshop on AI agents
(November 2026).

Portfolio: [ivonnebenitesrodriguez.github.io](https://ivonnebenitesrodriguez.github.io/my_portfolio_2026/)

License: MIT, see [LICENSE](LICENSE).

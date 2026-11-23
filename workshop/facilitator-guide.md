# Facilitator guide

For Ivonne and the coaches. Participants do not need this file.

## Suggested schedule (about 3 hours; adjust to your slot)

| Time | Block | Who |
|---|---|---|
| 0:00 | Welcome, goals, privacy rule ("only Iris's data today") | Host |
| 0:10 | **Theory slides**: prompts vs skills vs agents, Iris's architecture | Host |
| 0:35 | **Live demo** of Iris's story (script below) | Ivonne |
| 0:55 | Setup: install opencode, choose a model, check the six skills (`00-setup.md`) | Everyone, coaches walk around |
| 1:15 | Break | |
| 1:25 | **Hands-on**: Track A (Explorer) or Track B (Builder) | Participants in two groups |
| 2:35 | Share-back: one surprise per group; wrap-up questions | Host |
| 2:50 | What next: resources, feedback form | Host |

Setup always takes longer than planned. If more than a third of the room is
still stuck at 1:15, extend setup and shorten the hands-on block.

## Before the workshop (checklist)

**1 week before**
- [ ] Ask participants to bring a laptop and to install opencode beforehand (`00-setup.md`, steps 1 and 2). WSL is not needed: Windows users install with winget (or npm). Test this on a Windows laptop before the workshop.
- [ ] Check the venue Wi-Fi allows `opencode.ai` and model providers.

**1 day before: the one test I could not do for you**
- [ ] Do a **real run with a free model** on a clean clone and note which model works best. I tested all the plumbing (see "What was tested" below) but my sandbox could not reach any model provider, so I could not judge how well free models follow the skills. Run missions 2 to 6 of Track A once.
- [ ] Write the best model name on the whiteboard or slide ("Use this one first").
- [ ] Run the demo script once end to end, including the PDF and Word step, on the machine you will present with.
- [ ] Have a backup: screenshots or a recorded run of the demo, in case Wi-Fi fails.

**On the day**
- [ ] Projector font large. Terminal color theme high contrast.
- [ ] Open `workshop/fallback/sample-offer.md` in a tab, ready to paste.
- [ ] Coaches know both tracks. Track B needs coaches who are comfortable reading a `SKILL.md`.

## Ivonne's demo script (about 15 min)

Matches the flow of the main `README.md`. Say the step out loud, then type.

| # | Say | Type | What to point at |
|---|---|---|---|
| 1 | "Iris wants new offers." | `Use the iris-job-agent to search job offers` | The agent picks `search-job-offers` (look for the `Skill` line). Ranked table, links. |
| 2 | "She chooses one. Who should she write to?" | `Find the contact person for offer number 1` / `Write a short message to the contact person` | Every name has a source link. "It never sends." |
| 3 | "Now her German documents become a US resume." | `Adapt and translate Iris's resume and cover letter into English for this offer` | Personal details removed. Keywords match / missing list. |
| 4 | "A bilingual preschool: Spanish." | `Translate the resume and cover letter into Spanish` | Names not translated. |
| 5 | "Make them look good." | `Create the PDF and Word files` | `styles/brand.md`. The agent asks permission before running commands. |
| 6 | "She applied." | `Iris applied to this job today` / `Show me the jobs Iris applied to` | The tracker table. |

**Fallback if search is slow:** say "this takes a minute, so here is one I
prepared" and continue with `workshop/fallback/sample-offer.md`.

**Nice moment to add:** after step 3, say `Add a teaching certificate to her resume.`
and show that the agent refuses. Then show the line in the skill that says so.

## Group split

- **Track A (Explorer):** anyone who has not used a terminal much, or who wants to see what AI agents can and can't do. Mission 7 ("Break it") is usually the favorite.
- **Track B (Builder):** people comfortable editing text files. Challenges 1 and 2 are for everyone; 3 to 6 are optional depth.
- Let people switch. Track B participants who get stuck in setup can do Track A first.

Suggested coach ratio: 1 coach for 5 to 6 participants.

## Where the answers are

`workshop/solutions/` has worked solutions for Track B (`interview-prep`,
`cv-checker`, `adapt-documents-de`). **Delete this folder from the copy you
give to participants**, or tell them not to peek until they tried.

## Common problems and quick answers

| Symptom | Likely cause | Fix |
|---|---|---|
| Agent is named `build`, no Iris skills | Started in the wrong folder | `cd` into the project, restart |
| No web search | `OPENCODE_ENABLE_EXA` not set | Set it **before** starting opencode |
| Offer list contains old or broken links | Free model skipped the "open each offer" step | Normal for small models. Use the fallback offer; discuss why you check AI output |
| Agent invents a contact name | Model ignored the rule | A teaching moment for Track A, mission 3 |
| Edited skill has no effect | Did not restart | Quit and restart opencode |
| New skill not listed | Name and folder differ, or duplicate name | See "If a skill does not show up" in Track B |
| Command-permission prompt for `bash` | Expected during the PDF step | Read the command, allow only PDF/Word creation |
| PDF/Word step fails | Missing program (for example LibreOffice or Chrome) | Do this step only in the demo; it is marked optional |

## What was tested for you

On a clean clone with opencode 1.19.6:
- All six skills in `.claude/skills/` are discovered by opencode **with no changes**.
- The agent in `.opencode/agents/iris-job-agent.md` loads, is the default agent, and its prompt and the six skill names reach the model.
- The `skill` tool runs, files are written to `applications/`, and a write into `profile/` is **blocked** by the permission setting.
- With `OPENCODE_ENABLE_EXA=1` the `websearch` tool appears; without it, it does not.
- The Track B solutions load (two skills and a read-only subagent), and so do the starter templates. A copied skill with an unchanged name is silently ignored.

**Not tested:** how well any real model follows the skills (no model provider
was reachable from my environment), and the PDF/Word step (it needs programs on
your machine). Both are in the checklist above.

## Keeping the two agent files in sync

The agent exists twice because Claude Code and opencode use different headers:
`.claude/agents/iris-job-agent.md` (source) and `.opencode/agents/iris-job-agent.md`
(generated). After changing the instructions in the first, run:

```bash
bash scripts/sync-opencode-agent.sh
```

The skills are shared: both tools read `.claude/skills/`.

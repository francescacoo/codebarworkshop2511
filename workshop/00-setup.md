# Setup: get Iris's agent running (about 15 minutes)

Everyone does this first, whichever track you choose.

We use **opencode**: a free, open-source AI assistant for your terminal. It
reads the same agent and skill files as Claude Code, so Iris's agent runs
in it without changes to the skills.

> **Privacy first.** Today you work with **Iris, a fictional person**. Do
> NOT paste your own CV, address or phone number. Free models may store
> what you send them, so practice with Iris's invented data only.

---

## 1. Install opencode

Pick ONE:

| Your computer | Command |
|---|---|
| Mac or Linux | `curl -fsSL https://opencode.ai/v2/install \| bash` |
| Windows (PowerShell) | `winget install --id Anomaly.OpenCode -e` |
| Windows, if winget is missing | Install Node.js from nodejs.org, open a **new** PowerShell window, then `npm install -g opencode-ai` |

You do **not** need WSL. (The opencode docs recommend it for the best
experience, but opencode also runs directly on Windows.)

After installing, close the terminal and open a new one in the project folder.

Check it worked:

```bash
opencode --version
```

## 2. Get the project

**Easiest, no extra software:** open
https://github.com/IvonneBenitesRodriguez/iris-job-agent, click the green
**Code** button, choose **Download ZIP** and unzip it (for example in
Documents). The folder may be called `iris-job-agent-main`.

**If you use Git:**

```bash
git clone https://github.com/IvonneBenitesRodriguez/iris-job-agent
cd iris-job-agent
```

Then open a terminal **inside** the folder: Windows 11 right-click the
folder, **Open in Terminal**; Mac: right-click, **New Terminal at Folder**;
Linux: right-click, **Open in Terminal**. Type `dir` (Windows) or `ls`
(Mac, Linux): you should see `opencode.json`.

Always start opencode from **this main folder**, not from a subfolder.

## 3. Turn on web search

The job search needs web search. In the current version (OpenCode 2),
opencode asks the first time whether to allow web search: say yes.

If you have an older version and web search does not work, set this in the
same terminal window **before** you start opencode:

| Mac / Linux | `export OPENCODE_ENABLE_EXA=1` |
|---|---|
| Windows PowerShell | `$env:OPENCODE_ENABLE_EXA = "true"` |

(You must do this again every time you open a new terminal window.)

## 4. Start opencode and choose a free model

```bash
opencode
```

1. Type `/models` and press Enter.
2. Choose a model from the **opencode** provider. Models marked free need
   no account and no credit card. Ask your coach which one worked best in
   the pre-workshop test.
3. If you have your own paid account (for example Anthropic or OpenAI), you
   can use `/connect` instead. This is optional.

## 5. Check that the agent is Iris's agent

The project starts with the **iris-job-agent** by default. You will see its
name at the bottom of the chat window. Type:

```
What can you help Iris with? List your skills.
```

**You should see six skills:** `search-job-offers`, `contact-person`,
`adapt-documents`, `translate-documents`, `style-application`,
`application-tracker`.

Seeing all six = you are ready. Go to your track:

- **Track A: Explorer** → [track-a-explorer.md](track-a-explorer.md): use the agent and check its work.
- **Track B: Builder** → [track-b-builder.md](track-b-builder.md): change skills and build new ones.

Not sure? Start with Track A. You can switch to B at any time.

---

## If something goes wrong

| Problem | Try this |
|---|---|
| `opencode: command not found` | Close the terminal, open a new one, try again. With npm, check `npm config get prefix` is on your PATH. |
| The agent shows the name `build`, not `iris-job-agent` | You are probably in the wrong folder. Quit (`Ctrl+C` twice), `cd iris-job-agent`, start again. You can also press `Tab` to switch agents. |
| It does not list the six skills | Same: wrong folder. Check that `.claude/skills/` exists in your folder (`ls .claude/skills`). |
| "Model not found" or an error from the provider | Run `/models` again and pick another one. Free models change often. |
| The agent answers very slowly or in a strange way | Switch to another free model with `/models`. |
| Web search finds nothing | Allow web search when opencode asks. On an older version, set `OPENCODE_ENABLE_EXA` (step 3) BEFORE starting opencode. Or use the fallback offer: `workshop/fallback/sample-offer.md`. |
| It asks permission to run a command (`bash`) | Read the command. Only allow it if it creates a PDF or Word file for Iris. If you are not sure, say no and ask a coach. |
| You changed a skill but nothing happened | Quit opencode (`Ctrl+C` twice) and start it again. Skills are read when it starts. |

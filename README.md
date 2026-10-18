# Mon Lexique

A private, local-first French vocabulary app for individual study. The interface is in English. The default learning direction is English → French.

## Start on Windows

Double-click **Start Mon Lexique.cmd**. It starts the local Node.js server if needed and opens the app in your browser at `http://127.0.0.1:4173`.

When updating from an older copy, extract the new package and restart Windows once before launching it. The old background server then exits, and the updated app reads your existing SQLite data from the same Windows user folder.

Node.js 24 or newer is required. The included `dist` folder is already built, so everyday use does not need npm or an internet connection. Keep the project folder intact; updating or rebuilding its code does not remove your learning data.

## Data and backups

The live SQLite database is stored at `%APPDATA%\MonLexique\mon-lexique.sqlite`, outside this project. Daily SQLite backups are in `%APPDATA%\MonLexique\backups`; the app retains the most recent 30. In **Settings → Data & Backup**, you can create a backup, download a complete JSON export, restore an export, or restore a SQLite backup. A pre-restore backup is created before each restore.

Words, reviews, practice results, activity, courses, notes, and preferences are written directly to SQLite. The app shows **All changes saved** only after its local server confirms the write. Review and practice requests carry unique IDs so retries cannot create duplicate learning events.

The app includes about 15,000 French expressions assigned to A1, A2, B1, and B2, with English meanings and example sentences. The level labels are approximate study guides, not an official exhaustive CEFR vocabulary list. The pack is installed into SQLite once on the next launch after an update. Existing words, custom edits, archived words, reviews, and notes are preserved. Before updating an existing database, the app makes a restorable SQLite backup. See **VOCABULARY_SOURCES.md** for attribution and data limitations.

Choose your current level on the **Learn** page. Reviews that are due appear first, followed by new words at that level. A word is counted as learned when you rate its flashcard for the first time. When no reviews are due and all new words at your chosen level are finished, the page shows a completion message rather than cycling old cards.

## Development

```text
npm install
npm run dev
```

The frontend dev server is at `http://127.0.0.1:5173`. Run `npm run server` in another terminal for its API. Run `npm run build` to rebuild the local production app.

Run `npm run test:persistence` to test sample records across a server restart, idempotent reviews, backups, export, and restoration. The test uses a temporary database and does not modify personal data.

## CSV import

CSV files need `english` and `french` headers. Optional headers: `gender`, `pronunciation`, `example_fr`, `example_en`, `level`, `word_type`, `tags`, `notes`. Duplicate English/French pairs are skipped.

Pronunciation uses your operating system's installed French speech voice through the browser. Audio quality and availability depend on that local voice.

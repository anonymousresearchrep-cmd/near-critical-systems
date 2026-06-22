# Push to Anonymous GitHub

These commands publish this clean repository to the anonymous GitHub account.

## 1. Unzip and enter the repository

```bash
unzip near_critical_systems_repo_clean.zip
cd near-critical-systems
```

## 2. Initialize Git if needed

```bash
git init
git branch -M main
```

## 3. Set anonymous commit identity locally

This affects only this repository.

```bash
git config --local user.name "Anonymous Researcher"
git config --local user.email "anonymousresearchrep@gmail.com"
```

Check it:

```bash
git config --local --list
```

## 4. Add the anonymous GitHub remote

Create or confirm this repository exists under the anonymous account:

https://github.com/anonymousresearchrep-cmd/near-critical-systems

Then run:

```bash
git remote remove origin 2>nul || true
git remote add origin https://github.com/anonymousresearchrep-cmd/near-critical-systems.git
```

On Windows PowerShell, if `2>nul || true` fails, use:

```powershell
git remote remove origin
git remote add origin https://github.com/anonymousresearchrep-cmd/near-critical-systems.git
```

## 5. Force GitHub CLI to authenticate as the anonymous account

```bash
gh auth logout
gh auth login
```

Choose:

- GitHub.com
- HTTPS
- Login with browser

Authenticate as:

`anonymousresearchrep-cmd`

Confirm:

```bash
gh auth status
```

## 6. Commit and push

```bash
git add .
git commit -m "Prepare anonymous reproducibility package"
git push -u origin main
```

If the remote already has old files and you intentionally want to replace it with this clean version, use:

```bash
git push -u origin main --force-with-lease
```

## 7. Final checks before Zenodo

Check the public GitHub page and confirm there are no:

- real names or personal emails in repository files,
- DOCX manuscripts or cover letters,
- review letters or submission packages,
- `.git/`, `__pycache__/`, `.pytest_cache/`, or archives.

Then create release tag:

```bash
git tag -a v1.0.0 -m "v1.0.0 reproducibility package"
git push origin v1.0.0
```

Create a GitHub Release from `v1.0.0`, then connect/import it in Zenodo to mint the DOI.

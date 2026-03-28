# Wayback Archiver – Perth Priority Removals

Automated website archiving tool used to create full snapshots of the Perth Priority Removals website in the Internet Archive (Wayback Machine).

This repository exists purely for backup and historical record purposes.

---

## Purpose

This tool automatically submits all public pages of the website to the Wayback Machine instead of archiving pages manually one by one.

It is used to:

* Preserve website versions after major updates
* Protect against hosting or content loss
* Maintain historical SEO records
* Provide proof of published content if required

Primary site archived:

https://perthpriorityremovals.com.au

---

## How It Works

1. The script crawls the website starting from the homepage.
2. It discovers internal links.
3. Each page is submitted to the Wayback Machine save endpoint.
4. Snapshots are stored by archive.org.

No website files are stored in this repository.

---

## Repository Structure

```
.
├── main.py              # Archiver script
├── config.yml           # Website configuration
├── requirements.txt     # Dependencies
└── .github/workflows/
    └── archive.yml      # Automated monthly run
```

---

## Setup (Local Testing)

Clone the repository:

```
git clone https://github.com/perthpriorityremovals/wayback-archiver.git
cd wayback-archiver
```

Install dependencies:

```
pip install -r requirements.txt
```

Run manually:

```
python main.py
```

---

## Configuration

Edit `config.yml`:

```
base_url: https://perthpriorityremovals.com.au
crawl_depth: 3
delay_seconds: 5
include_subdomains: false
```

### Notes

* Delay prevents archive.org rate limiting.
* Crawl depth controls how many internal links are followed.

---

## Automation

Archiving runs automatically using GitHub Actions.

Schedule:

* Monthly automatic archive
* Manual run available via GitHub Actions tab

To run manually:

1. Open **Actions** tab in GitHub
2. Select **Archive Website**
3. Click **Run workflow**

---

## When to Run an Archive

Run after:

* Publishing new service pages
* SEO structure changes
* Website redesigns
* Major content updates

Avoid running repeatedly in short timeframes.

---

## Limitations

* External links are not archived.
* Archive.org may throttle requests if run too frequently.
* Some dynamic pages may not snapshot perfectly.

---

## Maintenance

Minimal maintenance required.

Recommended checks:

* Confirm monthly workflow succeeds
* Spot-check snapshots on Wayback Machine

https://web.archive.org

---

## Owner

Perth Priority Removals
Urgent moves. Done right.

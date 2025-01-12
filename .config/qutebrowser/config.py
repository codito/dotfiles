# Load the autoconfig
config.load_autoconfig()

## Search engine
c.url.searchengines["DEFAULT"] = "https://search.codito.in?q={}"

## Theme
config.source("theme.py")

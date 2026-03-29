# lex-wled: WLED LED Controller Integration for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to WLED LED controllers via the WLED JSON API. Provides runners for state control (power, brightness, color) and effect/palette management.

**GitHub**: https://github.com/LegionIO/lex-wled
**License**: MIT
**Version**: 0.1.2

## Architecture

```
Legion::Extensions::Wled
├── Runners/
│   ├── State    # get_state, set_power, set_brightness, set_color
│   └── Effects  # list_effects, set_effect, list_palettes
├── Helpers/
│   └── Client   # Faraday connection to WLED JSON API (no auth required by default)
└── Client       # Standalone client class (includes all runners)
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/wled.rb` | Entry point, extension registration |
| `lib/legion/extensions/wled/runners/state.rb` | Power, brightness, color control runners |
| `lib/legion/extensions/wled/runners/effects.rb` | Effect and palette listing/setting runners |
| `lib/legion/extensions/wled/helpers/client.rb` | Faraday connection builder (configurable base URL) |
| `lib/legion/extensions/wled/client.rb` | Standalone Client class |

## Configuration

```json
{
  "lex-wled": {
    "url": "http://wled-light.local"
  }
}
```

WLED devices are addressed by local IP or mDNS hostname. No authentication required by default (WLED's built-in auth is optional).

## Dependencies

| Gem | Purpose |
|-----|---------|
| `faraday` (~> 2.0) | HTTP client for WLED JSON API |

## Development

15 specs total.

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)

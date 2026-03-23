# Changelog

## [0.1.2] - 2026-03-22

### Changed
- Add legion-cache, legion-crypt, legion-data, legion-json, legion-logging, legion-settings, and legion-transport as runtime dependencies
- Update spec_helper with real sub-gem helper stubs

## [0.1.0] - 2026-03-21

### Added
- Initial release
- `Helpers::Client` — Faraday connection builder targeting WLED JSON API with JSON content type
- `Runners::State` — get_state, set_power, set_brightness, set_color
- `Runners::Effects` — list_effects, set_effect, list_palettes
- Standalone `Client` class for use outside the Legion framework

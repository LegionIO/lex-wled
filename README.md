# lex-wled

A Legion Extension (LEX) for controlling [WLED](https://kno.wled.ge/) LED controllers via the WLED JSON API.

## Installation

Add to your Gemfile:

```ruby
gem 'lex-wled'
```

## Configuration

```json
{
  "lex-wled": {
    "url": "http://wled-light.local"
  }
}
```

## Standalone Usage

```ruby
require 'legion/extensions/wled'

client = Legion::Extensions::Wled::Client.new(url: 'http://wled-light.local')

# Get current state
client.get_state

# Control power
client.set_power(on: true)
client.set_power(on: false)

# Set brightness (0-255)
client.set_brightness(bri: 128)

# Set RGB color
client.set_color(red: 255, green: 0, blue: 0)

# List available effects
client.list_effects

# Set effect by id
client.set_effect(id: 3)

# List available palettes
client.list_palettes
```

## Runners

### State

| Method | Description |
|--------|-------------|
| `get_state` | GET /json/state — fetch current device state |
| `set_power(on:)` | POST /json/state — turn on or off |
| `set_brightness(bri:)` | POST /json/state — set brightness 0-255 |
| `set_color(red:, green:, blue:)` | POST /json/state — set RGB color on segment 0 |

### Effects

| Method | Description |
|--------|-------------|
| `list_effects` | GET /json/effects — list all available effects |
| `set_effect(id:)` | POST /json/state — apply effect by integer id |
| `list_palettes` | GET /json/palettes — list all available palettes |

## License

MIT

## Quickstart Resources from [Anthropic](https://github.com/modelcontextprotocol/quickstart-resources/tree/main) MCP

It's basically the same like the official but optimized for NixOS and my needs.

#### Run
1. `nix develop .`
2. `uv init .`
3. `uv add "mcp[cli]" httpx mcp anthropic python-dotenv`
4. Add Anthropic API key to `client/.env`
5. `uv run client/client.py weather-server/weather.py`
